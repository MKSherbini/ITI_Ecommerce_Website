<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="commons/pageCommon.jsp" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>${applicationScope.urlMappingConstants.getTitle(PageNames.CHECKOUT)}</title>
    <%@include file="commons/headCommon.jsp" %>
</head>
<body class="config">
<div class="preloader is-active">
    <div class="preloader__wrap">

        <img class="preloader__img" src="images/preloader.png" alt=""></div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!--====== Main Header ======-->
    <header class="header--style-1 header--box-shadow">
        <%@include file="commons/headerCommon.jsp" %>
    </header>
    <!--====== End - Main Header ======-->


    <!--====== App Content ======-->
    <div class="app-content">

        <!--====== Section 1 ======-->
        <div class="u-s-p-y-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="breadcrumb">
                        <div class="breadcrumb__wrap">
                            <ul class="breadcrumb__list">
                                <li class="has-separator">

                                    <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.HOME_PAGE)}">Home</a>
                                </li>
                                <li class="is-marked">

                                    <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CHECKOUT)}">Checkout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--====== End - Section 1 ======-->


        <!--====== Section 2 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="checkout-msg-group">
                                <c:if test="${empty sessionScope.user}">
                                    <div class="msg u-s-m-b-30">
                                        <span class="msg__text">Returning customer?
                                            <a class="gl-link" href="#return-customer" data-toggle="collapse">Click here to login</a></span>

                                        <div class="collapse" id="return-customer" data-parent="#checkout-msg-group">
                                            <div class="l-f u-s-m-b-16">

                                                <span class="gl-text u-s-m-b-16">If you have an account with us, please log in.</span>
                                                <form class="l-f__form">
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-15">

                                                            <label class="gl-label" for="login-email">E-MAIL *</label>

                                                            <input class="input-text input-text--primary-style"
                                                                   type="text"
                                                                   id="login-email" placeholder="Enter E-mail"></div>
                                                        <div class="u-s-m-b-15">

                                                            <label class="gl-label" for="login-password">PASSWORD
                                                                *</label>

                                                            <input class="input-text input-text--primary-style"
                                                                   type="text"
                                                                   id="login-password" placeholder="Enter Password">
                                                        </div>
                                                    </div>
                                                    <div class="gl-inline">
                                                        <div class="u-s-m-b-15">

                                                            <button class="btn btn--e-transparent-brand-b-2"
                                                                    type="submit">
                                                                LOGIN
                                                            </button>
                                                        </div>
                                                        <div class="u-s-m-b-15">

                                                            <a class="gl-link" href="lost-password.jsp">Lost Your
                                                                Password?</a></div>
                                                    </div>

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="remember-me">
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="remember-me">Remember
                                                                Me</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="msg">
                                        <span class="msg__text">Have a coupon?

                                            <a class="gl-link" href="#have-coupon" data-toggle="collapse">Click Here to enter your code</a></span>
                                    <div class="collapse" id="have-coupon" data-parent="#checkout-msg-group">
                                        <div class="c-f u-s-m-b-16">

                                            <span class="gl-text u-s-m-b-16">Enter your coupon code if you have one.</span>
                                            <form class="c-f__form">
                                                <div class="u-s-m-b-16">
                                                    <div class="u-s-m-b-15">

                                                        <label for="coupon"></label>

                                                        <input class="input-text input-text--primary-style" type="text"
                                                               id="coupon" placeholder="Coupon Code"></div>
                                                    <div class="u-s-m-b-15">

                                                        <button class="btn btn--e-transparent-brand-b-2" type="submit">
                                                            APPLY
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->


        <!--====== Section 3 ======-->
        <div class="u-s-p-b-60">

            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="checkout-f">
                        <div class="row">
                            <div class="col-lg-6">
                                <h1 class="checkout-f__h1">DELIVERY INFORMATION</h1>
                                <form class="checkout-f__delivery">
                                    <div class="u-s-m-b-30">
                                        <div class="u-s-m-b-15">

                                            <!--====== Check Box ======-->
                                            <div class="check-box">

                                                <input type="checkbox" id="get-address">
                                                <div class="check-box__state check-box__state--primary">

                                                    <label class="check-box__label" for="get-address">Use default
                                                        shipping and billing address from account</label></div>
                                            </div>
                                            <!--====== End - Check Box ======-->
                                        </div>

                                        <!--====== First Name, Last Name ======-->
                                        <div class="gl-inline">
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-fname">FIRST NAME *</label>

                                                <input class="input-text input-text--primary-style" type="text"
                                                       id="billing-fname" data-bill=""></div>
                                            <div class="u-s-m-b-15">

                                                <label class="gl-label" for="billing-lname">LAST NAME *</label>

                                                <input class="input-text input-text--primary-style" type="text"
                                                       id="billing-lname" data-bill=""></div>
                                        </div>
                                        <!--====== End - First Name, Last Name ======-->


                                        <!--====== E-MAIL ======-->
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-email">E-MAIL *</label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-email" data-bill=""></div>
                                        <!--====== End - E-MAIL ======-->


                                        <!--====== PHONE ======-->
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-phone">PHONE *</label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-phone" data-bill=""></div>
                                        <!--====== End - PHONE ======-->


                                        <!--====== Street Address ======-->
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-street">STREET ADDRESS *</label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-street" placeholder="House name and street name"
                                                   data-bill=""></div>
                                        <div class="u-s-m-b-15">

                                            <label for="billing-street-optional"></label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-street-optional"
                                                   placeholder="Apartment, suite unit etc. (optional)" data-bill="">
                                        </div>
                                        <!--====== End - Street Address ======-->


                                        <!--====== Country ======-->
                                        <div class="u-s-m-b-15">

                                            <!--====== Select Box ======-->

                                            <label class="gl-label" for="billing-country">COUNTRY *</label><select
                                                class="select-box select-box--primary-style" id="billing-country"
                                                data-bill="">
                                            <option selected value="">Choose Country</option>
                                            <option value="uae">United Arab Emirate (UAE)</option>
                                            <option value="uk">United Kingdom (UK)</option>
                                            <option value="us">United States (US)</option>
                                        </select>
                                            <!--====== End - Select Box ======-->
                                        </div>
                                        <!--====== End - Country ======-->


                                        <!--====== Town / City ======-->
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-town-city">TOWN/CITY *</label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-town-city" data-bill=""></div>
                                        <!--====== End - Town / City ======-->


                                        <!--====== STATE/PROVINCE ======-->
                                        <div class="u-s-m-b-15">

                                            <!--====== Select Box ======-->

                                            <label class="gl-label" for="billing-state">STATE/PROVINCE *</label><select
                                                class="select-box select-box--primary-style" id="billing-state"
                                                data-bill="">
                                            <option selected value="">Choose State/Province</option>
                                            <option value="al">Alabama</option>
                                            <option value="al">Alaska</option>
                                            <option value="ny">New York</option>
                                        </select>
                                            <!--====== End - Select Box ======-->
                                        </div>
                                        <!--====== End - STATE/PROVINCE ======-->


                                        <!--====== ZIP/POSTAL ======-->
                                        <div class="u-s-m-b-15">

                                            <label class="gl-label" for="billing-zip">ZIP/POSTAL CODE *</label>

                                            <input class="input-text input-text--primary-style" type="text"
                                                   id="billing-zip" placeholder="Zip/Postal Code" data-bill=""></div>
                                        <!--====== End - ZIP/POSTAL ======-->
                                        <div class="u-s-m-b-10">

                                            <!--====== Check Box ======-->
                                            <div class="check-box">

                                                <input type="checkbox" id="make-default-address" data-bill="">
                                                <div class="check-box__state check-box__state--primary">

                                                    <label class="check-box__label" for="make-default-address">Make
                                                        default shipping and billing address</label></div>
                                            </div>
                                            <!--====== End - Check Box ======-->
                                        </div>
                                        <div class="u-s-m-b-10">

                                            <a class="gl-link" href="#create-account" data-toggle="collapse">Want to
                                                create a new account?</a></div>
                                        <div class="collapse u-s-m-b-15" id="create-account">

                                            <span class="gl-text u-s-m-b-15">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</span>
                                            <div>

                                                <label class="gl-label" for="reg-password">Account Password *</label>

                                                <input class="input-text input-text--primary-style" type="text"
                                                       data-bill id="reg-password"></div>
                                        </div>
                                        <div class="u-s-m-b-10">

                                            <label class="gl-label" for="order-note">ORDER NOTE</label><textarea
                                                class="text-area text-area--primary-style" id="order-note"></textarea>
                                        </div>
                                        <div>

                                            <button class="btn btn--e-transparent-brand-b-2" type="submit">SAVE</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-6">
                                <h1 class="checkout-f__h1">ORDER SUMMARY</h1>

                                <!--====== Order Summary ======-->
                                <div class="o-summary">
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__item-wrap gl-scroll">
                                            <c:forEach items="${sessionScope.cart.cartItems}" var="item">
                                                <div class="o-card">
                                                    <div class="o-card__flex">
                                                        <div class="o-card__img-wrap">

                                                            <img class="u-img-fluid"
                                                                 src="${item.imageSrc}" alt="${item.name}">
                                                        </div>
                                                        <div class="o-card__info-wrap">

                                                            <span class="o-card__name">

                                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.PRODUCT)}?ref=${item.productId}">${item.name}</a></span>

                                                            <span class="o-card__quantity">Quantity x ${item.productQuantity}</span>

                                                            <span class="o-card__price">$${item.price}</span></div>
                                                    </div>

                                                    <a class="o-card__del far fa-trash-alt"
                                                       onclick="removeCartItem(${item.productId});"></a>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <h1 class="checkout-f__h1">SHIPPING & BILLING</h1>
                                            <div class="ship-b">

                                                <span class="ship-b__text">Ship to:</span>
                                                <div class="ship-b__box u-s-m-b-10">
                                                    <p class="ship-b__p"> ${sessionScope.user.address.streetAddress} <br> ${sessionScope.user.address.city} <br> ${sessionScope.user.address.country}  ${sessionScope.user.address.zipPostalCode}</p>

                                                    <a class="ship-b__edit btn--e-transparent-platinum-b-2"
                                                       data-modal="modal" data-modal-id="#edit-ship-address">Edit</a>
                                                </div>
                                                <div class="ship-b__box">

                                                    <span class="ship-b__text">Bill to default billing address</span>

                                                    <a class="ship-b__edit btn--e-transparent-platinum-b-2"
                                                       data-modal="modal" data-modal-id="#edit-ship-address">Edit</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <table class="o-summary__table">
                                                <tbody>
                                                <tr>
                                                    <td>SHIPPING</td>
                                                    <td class="cart-shipping-price">
                                                        $${WebsiteConstants.defaultDecimalFormat.format(sessionScope.cart.totalPrice*0.1)}</td>
                                                </tr>
                                                <tr>
                                                    <td>TAX</td>
                                                    <td class="cart-tax-price">
                                                        $${WebsiteConstants.defaultDecimalFormat.format(sessionScope.cart.totalPrice*0.05)}</td>
                                                </tr>
                                                <tr>
                                                    <td>SUBTOTAL</td>
                                                    <td class="cart-total-price">
                                                        $${WebsiteConstants.defaultDecimalFormat.format(sessionScope.cart.totalPrice)}</td>
                                                </tr>
                                                <tr>
                                                    <td>GRAND TOTAL</td>
                                                    <td class="cart-full-price">
                                                        $${WebsiteConstants.defaultDecimalFormat.format(sessionScope.cart.totalPrice*1.15)}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="o-summary__section u-s-m-b-30">
                                        <div class="o-summary__box">
                                            <h1 class="checkout-f__h1">PAYMENT INFORMATION</h1>
                                            <form class="checkout-f__payment"
                                                  action="${applicationScope.urlMappingConstants.getServiceUrl(ServiceNames.PAYMENT)}">
                                                <div class="u-s-m-b-10">

                                                    <!--====== Radio Box ======-->
                                                    <div class="radio-box">

                                                        <input type="radio" value="cash" id="cash-on-delivery"
                                                               name="method" checked>
                                                        <div class="radio-box__state radio-box__state--primary">

                                                            <label class="radio-box__label" for="cash-on-delivery">Cash
                                                                on Delivery</label></div>
                                                    </div>
                                                    <!--====== End - Radio Box ======-->

                                                    <span class="gl-text u-s-m-t-6">Pay Upon Cash on delivery. (This service is only available for some countries)</span>
                                                </div>
                                                <div class="u-s-m-b-10">

                                                    <!--====== Radio Box ======-->
                                                    <div class="radio-box">

                                                        <input type="radio" value="bank" id="direct-bank-transfer"
                                                               name="method">
                                                        <div class="radio-box__state radio-box__state--primary">

                                                            <label class="radio-box__label" for="direct-bank-transfer">Direct
                                                                Bank Transfer</label></div>
                                                    </div>
                                                    <!--====== End - Radio Box ======-->

                                                    <span class="gl-text u-s-m-t-6">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.</span>
                                                </div>
                                                <div class="u-s-m-b-10">

                                                    <!--====== Radio Box ======-->
                                                    <div class="radio-box">

                                                        <input type="radio" value="check" id="pay-with-check"
                                                               name="method">
                                                        <div class="radio-box__state radio-box__state--primary">

                                                            <label class="radio-box__label" for="pay-with-check">Pay
                                                                With Check</label></div>
                                                    </div>
                                                    <!--====== End - Radio Box ======-->

                                                    <span class="gl-text u-s-m-t-6">Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</span>
                                                </div>
                                                <div class="u-s-m-b-10">

                                                    <!--====== Radio Box ======-->
                                                    <div class="radio-box">

                                                        <input type="radio" value="card" id="pay-with-card"
                                                               name="method">
                                                        <div class="radio-box__state radio-box__state--primary">

                                                            <label class="radio-box__label" for="pay-with-card">Pay With
                                                                Credit / Debit Card</label></div>
                                                    </div>
                                                    <!--====== End - Radio Box ======-->

                                                    <span class="gl-text u-s-m-t-6">International Credit Cards must be eligible for use within the United States.</span>
                                                </div>
                                                <div class="u-s-m-b-10">

                                                    <!--====== Check Box ======-->
                                                    <div class="check-box">

                                                        <input type="checkbox" id="term-and-condition" required>
                                                        <div class="check-box__state check-box__state--primary">

                                                            <label class="check-box__label" for="term-and-condition">I
                                                                consent to the</label></div>
                                                    </div>
                                                    <!--====== End - Check Box ======-->

                                                    <a class="gl-link">Terms of Service.</a>
                                                </div>
                                                <div>
                                                    <button class="btn btn--e-brand-b-2" type="submit">PLACE ORDER
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--====== End - Order Summary ======-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 3 ======-->
    </div>
    <!--====== End - App Content ======-->


    <!--====== Main Footer ======-->
    <jsp:include page="commons/footerCommon.jsp" flush="true"/>
    <!--====== Main Footer ======-->
    <!--====== Modal Section ======-->


    <!--====== Shipping Address Add Modal ======-->
    <div class="modal fade" id="edit-ship-address">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="checkout-modal2">
                        <div class="u-s-m-b-30">
                            <div class="dash-l-r">
                                <h1 class="gl-modal-h1">Shipping Address</h1>
                                <div class="dash__link dash__link--brand">

                                    <a data-modal="modal" data-modal-id="#add-ship-address" data-dismiss="modal">Add new
                                        Address</a></div>
                            </div>
                        </div>
                        <form class="checkout-modal2__form">
                            <div class="dash__table-2-wrap u-s-m-b-30 gl-scroll">
                                <table class="dash__table-2">
                                    <thead>
                                    <tr>
                                        <th>Action</th>
                                        <th>Full Name</th>
                                        <th>Address</th>
                                        <th>Region</th>
                                        <th>Phone Number</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>

                                            <!--====== Radio Box ======-->
                                            <div class="radio-box">

                                                <input type="radio" id="address-1" name="default-address" checked="">
                                                <div class="radio-box__state radio-box__state--primary">

                                                    <label class="radio-box__label" for="address-1"></label></div>
                                            </div>
                                            <!--====== End - Radio Box ======-->
                                        </td>
                                        <td>John Doe</td>
                                        <td>4247 Ashford Drive Virginia VA-20006 USA</td>
                                        <td>Virginia VA-20006 USA</td>
                                        <td>(+0) 900901904</td>
                                        <td>
                                            <div class="gl-text">Default Shipping Address</div>
                                            <div class="gl-text">Default Billing Address</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>

                                            <!--====== Radio Box ======-->
                                            <div class="radio-box">

                                                <input type="radio" id="address-2" name="default-address">
                                                <div class="radio-box__state radio-box__state--primary">

                                                    <label class="radio-box__label" for="address-2"></label></div>
                                            </div>
                                            <!--====== End - Radio Box ======-->
                                        </td>
                                        <td>Doe John</td>
                                        <td>1484 Abner Road</td>
                                        <td>Eau Claire WI - Wisconsin</td>
                                        <td>(+0) 7154419563</td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="gl-modal-btn-group">

                                <button class="btn btn--e-brand-b-2" type="submit">SAVE</button>

                                <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Shipping Address Add Modal ======-->


    <!--====== Shipping Address Add Modal ======-->
    <div class="modal fade" id="add-ship-address">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="checkout-modal1">
                        <form class="checkout-modal1__form">
                            <div class="u-s-m-b-30">
                                <h1 class="gl-modal-h1">Add new Shipping Address</h1>
                            </div>
                            <div class="gl-inline">
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-fname">FIRST NAME *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-fname"
                                           placeholder="First Name"></div>
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-lname">LAST NAME *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-lname"
                                           placeholder="Last Name"></div>
                            </div>
                            <div class="gl-inline">
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-phone">PHONE *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-phone">
                                </div>
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-street">STREET ADDRESS *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-street"
                                           placeholder="House Name and Street"></div>
                            </div>
                            <div class="gl-inline">
                                <div class="u-s-m-b-30">

                                    <!--====== Select Box ======-->

                                    <label class="gl-label" for="address-country">COUNTRY *</label><select
                                        class="select-box select-box--primary-style" id="address-country">
                                    <option selected value="">Choose Country</option>
                                    <option value="uae">United Arab Emirate (UAE)</option>
                                    <option value="uk">United Kingdom (UK)</option>
                                    <option value="us">United States (US)</option>
                                </select>
                                    <!--====== End - Select Box ======-->
                                </div>
                                <div class="u-s-m-b-30">

                                    <!--====== Select Box ======-->

                                    <label class="gl-label" for="address-state">STATE/PROVINCE *</label><select
                                        class="select-box select-box--primary-style" id="address-state">
                                    <option selected value="">Choose State/Province</option>
                                    <option value="al">Alabama</option>
                                    <option value="al">Alaska</option>
                                    <option value="ny">New York</option>
                                </select>
                                    <!--====== End - Select Box ======-->
                                </div>
                            </div>
                            <div class="gl-inline">
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-city">TOWN/CITY *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-city">
                                </div>
                                <div class="u-s-m-b-30">

                                    <label class="gl-label" for="address-street">ZIP/POSTAL CODE *</label>

                                    <input class="input-text input-text--primary-style" type="text" id="address-postal"
                                           placeholder="Zip/Postal Code"></div>
                            </div>
                            <div class="gl-modal-btn-group">

                                <button class="btn btn--e-brand-b-2" type="submit">SAVE</button>

                                <button class="btn btn--e-grey-b-2" type="button" data-dismiss="modal">CANCEL</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--====== End - Shipping Address Add Modal ======-->
    <!--====== End - Modal Section ======-->
</div>
<!--====== End - Main App ======-->


<!--====== Google Analytics: change UA-XXXXX-Y to be your site's ID ======-->
<script>
    window.ga = function () {
        ga.q.push(arguments)
    };
    ga.q = [];
    ga.l = +new Date;
    ga('create', 'UA-XXXXX-Y', 'auto');
    ga('send', 'pageview')
</script>
<script src="https://www.google-analytics.com/analytics.js" async defer></script>

<!--====== Vendor Js ======-->
<script src="scripts/js/vendor.js"></script>

<!--====== jQuery Shopnav plugin ======-->
<script src="scripts/js/jquery.shopnav.js"></script>

<!--====== App ======-->
<script src="scripts/js/app.js"></script>

<!--====== Noscript ======-->
<noscript>
    <div class="app-setting">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="app-setting__wrap">
                        <h1 class="app-setting__h1">JavaScript is disabled in your browser.</h1>

                        <span class="app-setting__text">Please enable JavaScript in your browser or upgrade to a JavaScript-capable browser.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</noscript>
</body>
</html>