<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="commons/pageCommon.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>${applicationScope.urlMappingConstants.getTitle(PageNames.ADDRESS_BOOK)}</title>
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

                                    <a href="addressBook">My Account</a></li>
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
                <div class="dash">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-12">

                                <!--====== Dashboard Features ======-->
                                <div class="dash__box dash__box--bg-white dash__box--shadow u-s-m-b-30">
                                    <div class="dash__pad-1">

                                        <span class="dash__text u-s-m-b-16">Hello, ${sessionScope.user.userName}</span>
                                        <ul class="dash__f-list">
                                            <li>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.Account)}">Manage
                                                    My Account</a></li>
                                            <li>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.Profile)}">My
                                                    Profile</a></li>
                                            <li>

                                                <a class="dash-active" href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.ADDRESS_BOOK)}">Address
                                                    Book</a>
                                            <li>

                                                <a
                                                   href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CARD_BOOK)}">Card
                                                    Book</a>
                                            </li>
                                            <li>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.TRACK_ORDER)}">Track
                                                    Order</a></li>
                                            <li>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.MY_ORDERS)}">My
                                                    Orders</a></li>
                                            <li>

                                                <a href="${applicationScope.urlMappingConstants.getControllerUrl(PageNames.CANCELLATIONS)}">My
                                                    Returns & Cancellations</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="dash__box dash__box--bg-white dash__box--shadow dash__box--w">
                                    <div class="dash__pad-1">
                                        <ul class="dash__w-list">
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-1"><i
                                                            class="fas fa-cart-arrow-down"></i></span>

                                                    <span class="dash__w-text">${requestScope.ordersCount}</span>

                                                    <span class="dash__w-name">Orders Placed</span></div>
                                            </li>
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-2"><i
                                                            class="fas fa-times"></i></span>

                                                    <span class="dash__w-text">0</span>

                                                    <span class="dash__w-name">Cancel Orders</span></div>
                                            </li>
                                            <li>
                                                <div class="dash__w-wrap">

                                                    <span class="dash__w-icon dash__w-icon-style-3"><i
                                                            class="far fa-heart"></i></span>

                                                    <span class="dash__w-text">0</span>

                                                    <span class="dash__w-name">Wishlist</span></div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--====== End - Dashboard Features ======-->
                            </div>
                            <div class="col-lg-9 col-md-12">
                                <div class="dash__box dash__box--shadow dash__box--radius dash__box--bg-white u-s-m-b-30">
                                    <div class="dash__pad-2">
                                        <div class="dash__address-header">
                                            <h1 class="dash__h1">Address Book</h1>
                                            <div>

                                                    <span class="dash__link dash__link--black u-s-m-r-8">

                                                        <a href="dash-address-make-default.jsp">Make default shipping address</a></span>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dash__box dash__box--shadow dash__box--bg-white dash__box--radius u-s-m-b-30">
                                    <div class="dash__table-2-wrap gl-scroll">
                                        <table class="dash__table-2">
                                            <thead>
                                            <tr>
                                                <th>Action</th>
                                                <th>User Name</th>
                                                <th>Street Address</th>
                                                <th>City</th>
                                                <th>State</th>
                                                <th>Country</th>
                                                <th>Zip Postal Code</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><a class="address-book-edit btn--e-transparent-platinum-b-2"
                                                       href="editAddress">Edit </a></td>
                                                <td>
                                                    <div class="gl-text"> ${sessionScope.user.userName} </div>
                                                </td>
                                                <td>
                                                    <div class="gl-text">${sessionScope.user.address.streetAddress}</div>
                                                </td>
                                                <td>
                                                    <div class="gl-text"> ${sessionScope.user.address.city} </div>
                                                </td>
                                                <td>
                                                    <div class="gl-text"> ${sessionScope.user.address.state}</div>
                                                </td>
                                                <td>
                                                    <div class="gl-text">${sessionScope.user.address.country} </div>
                                                </td>
                                                <td>
                                                    <div class="gl-text">${sessionScope.user.address.zipPostalCode} </div>
                                                </td>

                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div>

                                    <a class="dash__custom-link btn--e-brand-b-2" href="addAddress"><i
                                            class="fas fa-plus u-s-m-r-8"></i>

                                        <span>Add New Address</span></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--====== End - Section Content ======-->
        </div>
        <!--====== End - Section 2 ======-->
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