package providers.repositories;

import constants.enums.PaymentMethod;
import managers.DatabaseManager;
import models.orm.*;

import java.util.List;
import java.util.Optional;

public class CartRepo extends GenericRepo<ShoppingCart, Long> {
    private static volatile CartRepo instance = null;

    private CartRepo() {
        if (instance != null)
            throw new RuntimeException("Use getInstance(), reflection is not allowed");
    }

    public static CartRepo getInstance() {
        if (instance == null) {
            synchronized (CartRepo.class) {
                if (instance == null) {
                    instance = new CartRepo();
                }
            }
        }
        return instance;
    }


    public List<ShoppingCart> findHistoryByUser(User user) {
        return DatabaseManager.getInstance()
                .runTransactionWithRet(session -> session
                        .createNamedQuery("ShoppingCart.findHistoryByUser")
                        .setParameter("user", user)
                        .getResultList());
    }

    public Optional<ShoppingCart> findShoppingCartByUser(User owner) {
        return DatabaseManager.getInstance()
                .runTransactionWithRet(session -> (Optional<ShoppingCart>) session
                        .createNamedQuery("ShoppingCart.findShoppingCartByUser")
                        .setParameter("user", owner)
                        .getResultList().stream().findAny());
    }

    public Optional<ShoppingCart> findShoppingCartByDummyUser(DummyUser dummyOwner) {
        return DatabaseManager.getInstance()
                .runTransactionWithRet(session -> (Optional<ShoppingCart>) session
                        .createNamedQuery("ShoppingCart.findShoppingCartByDummyUser")
                        .setParameter("dummyOwner", dummyOwner)
                        .getResultList().stream().findAny());
    }

    public void updateDummyToUser(DummyUser dummyOwner, User owner) {
        DatabaseManager.getInstance()
                .runTransaction(session -> session
                        .createNamedQuery("ShoppingCart.updateDummyToUser")
                        .setParameter("dummyOwner", dummyOwner)
                        .setParameter("owner", owner)
                        .executeUpdate());
    }

    private int addToShoppingCart(Product product, ShoppingCart cart, int addQuantity) {
        // cart logic
//        refresh(cart);
        var cartItems = cart.getCartItems();
        Optional<CartItem> currentCartItem = Optional.empty();
        if (cartItems != null)
            currentCartItem = cartItems.stream()
                    .filter(cartItem -> cartItem.getProduct().getProductId().equals(product.getProductId()))
                    .findAny();
        CartItemRepo cartItemRepo = CartItemRepo.getInstance();
        if (currentCartItem.isEmpty()) {
            var newItem = new CartItem(cart, product);
            if (addQuantity > product.getQuantity()) addQuantity = 0;
//            addQuantity = Math.min(addQuantity, product.getQuantity());
            newItem.setProductQuantity(addQuantity);
            cartItemRepo.create(newItem);
        } else {
            if (addQuantity + currentCartItem.get().getProductQuantity() > product.getQuantity()) addQuantity = 0;
//            addQuantity = Math.min(addQuantity + currentCartItem.get().getProductQuantity(), product.getQuantity()) - currentCartItem.get().getProductQuantity();
            currentCartItem.get().setProductQuantity(currentCartItem.get().getProductQuantity() + addQuantity);
            cartItemRepo.update(currentCartItem.get());
        }

        // update price
        cart.setTotalPrice((int) (cart.getTotalPrice() + addQuantity * product.getPrice() * (1 - product.getDiscountPercent() / 100.0)));
        update(cart);
//        DatabaseManager.getInstance().flush();

//        refresh(cart);
        return addQuantity;
    }

    private Optional<ShoppingCart> removeFromShoppingCart(Product product, ShoppingCart cart) {
        return removeFromShoppingCart(product, cart, false);
    }

    private Optional<ShoppingCart> removeFromShoppingCart(Product product, ShoppingCart cart, boolean fullCartItem) {
        // cart logic
//        refresh(cart);
        var cartItems = cart.getCartItems();
        Optional<CartItem> currentCartItem = Optional.empty();
        if (cartItems != null)
            currentCartItem = cartItems.stream()
                    .filter(cartItem -> cartItem.getProduct().getProductId().equals(product.getProductId()))
                    .findAny();
        CartItemRepo cartItemRepo = CartItemRepo.getInstance();
        if (currentCartItem.isPresent()) {
            System.out.println("currentCartItem.get().getProductQuantity() = " + currentCartItem.get().getProductQuantity());
            boolean LeavesAtLeastOne = currentCartItem.get().getProductQuantity() >= 2;
            if (LeavesAtLeastOne && !fullCartItem) {
                currentCartItem.get().setProductQuantity(currentCartItem.get().getProductQuantity() - 1);
                cartItemRepo.update(currentCartItem.get());
            } else if (fullCartItem) {
                cartItemRepo.delete(currentCartItem.get());
                cart.getCartItems().remove(currentCartItem.get());
//                DatabaseManager.getInstance().flush();
            }

            // update price
            if (fullCartItem)
                cart.setTotalPrice((int) Math.max(0, cart.getTotalPrice() - currentCartItem.get().getProductQuantity() * product.getPrice() * (1 - product.getDiscountPercent() / 100.0)));
            else if (LeavesAtLeastOne)
                cart.setTotalPrice((int) Math.max(0, cart.getTotalPrice() - product.getPrice() * (1 - product.getDiscountPercent() / 100.0)));

            update(cart);
//            DatabaseManager.getInstance().flush();
        }

//        refresh(cart);
        return Optional.of(cart);
    }

    public int addProduct(User user, Product product, int addQuantity) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return -1;

        return addToShoppingCart(product, cart.get(), addQuantity);
    }

    public Optional<ShoppingCart> removeProduct(User user, Product product) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return Optional.empty();

        return removeFromShoppingCart(product, cart.get());
    }

    public Optional<ShoppingCart> removeCartItem(User user, Product product) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return Optional.empty();

        return removeFromShoppingCart(product, cart.get(), true);
    }

    public Optional<ShoppingCart> GetCartOrCreateOne(User user) {
//        UserRepo.getInstance().update(user);
//        UserRepo.getInstance().refresh(user); // todo fk jpa
        user = UserRepo.getInstance().read(user.getUserId()).get();
        var cart = findShoppingCartByUser(user);
        if (cart.isEmpty()) {
            create(new ShoppingCart(user));
        }
        cart = findShoppingCartByUser(user);
        System.out.println("cart optional = " + cart);
        System.out.println("user optional = " + user);
        if (cart.isEmpty()) return Optional.empty();
        return cart;
    }

    public Optional<ShoppingCart> GetCartOrCreateOne(DummyUser user) {
        var cart = findShoppingCartByDummyUser(user);
        if (cart.isEmpty()) {
            create(new ShoppingCart(user));
        }
        cart = findShoppingCartByDummyUser(user);
        if (cart.isEmpty()) return Optional.empty();
        return cart;
    }

    public int addProduct(DummyUser user, Product product, int addQuantity) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return -1;

        return addToShoppingCart(product, cart.get(), addQuantity);
    }

    public Optional<ShoppingCart> removeProduct(DummyUser user, Product product) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return Optional.empty();

        return removeFromShoppingCart(product, cart.get());
    }

    public Optional<ShoppingCart> removeCartItem(DummyUser user, Product product) {
        var cart = GetCartOrCreateOne(user);
        if (cart.isEmpty()) return Optional.empty();

        return removeFromShoppingCart(product, cart.get(), true);
    }

    public Optional<ShoppingCart> submitOrder(User user, PaymentMethod paymentMethod) {
        // find cart
        var cart = findShoppingCartByUser(user);
        if (cart.isEmpty()) return Optional.empty();
//        refresh(cart.get());
        var price = cart.get().getTotalPrice() * 1.15;
//        switch (paymentMethod) {
//            case BANK:
//            case CASH:
//            case CHECK:
//                break;
//            case CARD:
//                break;
//        }

        // find balance
        var balance = user.getCredit();
        // todo check other methods
        System.out.println("balance = " + balance);
        System.out.println("price = " + price);
        if (balance < price) return Optional.empty();
        user.setCredit(user.getCredit() - price);
        cart.get().setIsHistory(true);
        UserRepo.getInstance().update(user);
        update(cart.get());

        return cart;
    }

}
