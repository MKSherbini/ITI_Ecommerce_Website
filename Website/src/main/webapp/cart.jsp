<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="commons/pageCommon.jsp" %>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>${applicationScope.urlMappingConstants.getTitle(PageNames.CART)}</title>
    <%@include file="commons/headCommon.jsp" %>
    <script>document.write('<script src="scripts/js/shop.js?dev=' + new Date().getTime() + '"\><\/script>');</script>
    <%--    <script  src="scripts/js/shop.js?time="></script>--%>
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

                                    <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CART)}">Cart</a>
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

            <!--====== Section Intro ======-->
            <div class="section__intro u-s-m-b-60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section__text-wrap">
                                <h1 class="section__heading u-c-secondary">SHOPPING CART</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Intro ======-->


            <!--====== Section Content ======-->
            <div class="section__content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                            <div class="table-responsive">
                                <table class="table-p">
                                    <tbody>
                                    <c:forEach items="${sessionScope.cart.cartItems}" var="item">
                                        <!--====== Row ======-->
                                        <tr>
                                            <td>
                                                <div class="table-p__box">
                                                    <div class="table-p__img-wrap">

                                                        <img class="u-img-fluid"
                                                             src="${item.imageSrc}" alt="${item.name}"></div>
                                                    <div class="table-p__info">

                                                            <span class="table-p__name">

                                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.PRODUCT)}?ref=${item.productId}">${item.name}</a></span>

                                                        <span class="table-p__category">

                                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.SHOP)}?category=${item.categoryName}">${item.categoryName}</a></span>
                                                            <%--                                                        <ul class="table-p__variant-list">--%>
                                                            <%--                                                            <li>--%>

                                                            <%--                                                                <span>Size: 22</span></li>--%>
                                                            <%--                                                            <li>--%>

                                                            <%--                                                                <span>Color: Red</span></li>--%>
                                                            <%--                                                        </ul>--%>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>

                                                <span class="table-p__price">$${item.price}</span></td>
                                            <td>
                                                <div class="table-p__input-counter-wrap">

                                                    <!--====== Input Counter ======-->
                                                    <div class="input-counter">

                                                        <span class="input-counter__minus fas fa-minus"
                                                              onclick="decrementFromCart(${item.productId});"></span>

                                                        <input class="input-counter__text input-counter--text-primary-style"
                                                               type="text" value="${item.productQuantity}" data-min="1"
                                                               data-max="${item.productQuantityMax}">

                                                        <span class="input-counter__plus fas fa-plus"
                                                              onclick="incrementFromCart(${item.productId});"></span>
                                                    </div>
                                                    <!--====== End - Input Counter ======-->
                                                </div>
                                            </td>
                                            <td>
                                                <div class="table-p__del-wrap">

                                                    <a class="far fa-trash-alt table-p__delete-link"
                                                       onclick="removeCartItem(${item.productId});"></a></div>
                                            </td>
                                        </tr>
                                        <!--====== End - Row ======-->
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="route-box">
                                <div class="route-box__g1">

                                    <a class="route-box__link"
                                       href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.SHOP)}"><i
                                            class="fas fa-long-arrow-alt-left"></i>

                                        <span>CONTINUE SHOPPING</span></a></div>
                                <div class="route-box__g2">

                                    <a class="route-box__link"
                                       href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CART)}"><i
                                            class="fas fa-trash"></i>

                                        <span>CLEAR CART</span></a>

                                    <a class="route-box__link"
                                       href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CART)}"><i
                                            class="fas fa-sync"></i>

                                        <span>UPDATE CART</span></a></div>
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
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 u-s-m-b-30">
                            <form class="f-cart">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                        <div class="f-cart__pad-box">
                                            <h1 class="gl-h1">ESTIMATE SHIPPING AND TAXES</h1>

                                            <span class="gl-text u-s-m-b-30">Enter your destination to get a shipping estimate.</span>
                                            <div class="u-s-m-b-30">

                                                <!--====== Select Box ======-->

                                                <label class="gl-label" for="shipping-country">COUNTRY *</label><select
                                                    class="select-box select-box--primary-style" id="shipping-country">
                                                <option selected value="">Choose Country</option>
                                                <option value="uae">United Arab Emirate (UAE)</option>
                                                <option value="uk">United Kingdom (UK)</option>
                                                <option value="us">United States (US)</option>
                                            </select>
                                                <!--====== End - Select Box ======-->
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <!--====== Select Box ======-->

                                                <label class="gl-label" for="shipping-state">STATE/PROVINCE
                                                    *</label><select class="select-box select-box--primary-style"
                                                                     id="shipping-state">
                                                <option selected value="">Choose State/Province</option>
                                                <option value="al">Alabama</option>
                                                <option value="al">Alaska</option>
                                                <option value="ny">New York</option>
                                            </select>
                                                <!--====== End - Select Box ======-->
                                            </div>
                                            <div class="u-s-m-b-30">

                                                <label class="gl-label" for="shipping-zip">ZIP/POSTAL CODE *</label>

                                                <input class="input-text input-text--primary-style" type="text"
                                                       id="shipping-zip" placeholder="Zip/Postal Code"></div>
                                            <div class="u-s-m-b-30">

                                                <a class="f-cart__ship-link btn--e-transparent-brand-b-2"
                                                   href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CART)}">CALCULATE
                                                    SHIPPING</a></div>

                                            <span class="gl-text">Note: There are some countries where free shipping is available otherwise our flat rate charges or country delivery charges will be apply.</span>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                        <div class="f-cart__pad-box">
                                            <h1 class="gl-h1">NOTE</h1>

                                            <span class="gl-text u-s-m-b-30">Add Special Note About Your Product</span>
                                            <div>

                                                <label for="f-cart-note"></label><textarea
                                                    class="text-area text-area--primary-style"
                                                    id="f-cart-note"></textarea></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 u-s-m-b-30">
                                        <div class="f-cart__pad-box">
                                            <div class="u-s-m-b-30">
                                                <table class="f-cart__table">
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
                                            <div>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CHECKOUT)}"
                                                   class="btn btn--e-brand-b-2" type="submit"> PROCEED TO
                                                    CHECKOUT
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
${ServiceNames.PRODUCT_ADD_TO_CART}

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
