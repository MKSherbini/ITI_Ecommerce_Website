package controllers;

import constants.UrlMappingConstants;
import constants.WebsiteConstants;
import jakarta.json.Json;
import jakarta.json.JsonObjectBuilder;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import constants.enums.PageNames;
import managers.CookiesManager;
import models.orm.User;
import providers.repositories.UserRepo;
import utilities.Hashator;

import java.io.*;
import java.net.CookieManager;
import java.util.Base64;
import java.util.Optional;

@WebServlet("/signin")
public class SignInController extends HttpServlet {
    ServletConfig myConfig;

    public void init(ServletConfig config) throws ServletException {
        myConfig = config;
    }

    public ServletConfig getServletConfig() {
        return null;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // do preparing
        System.out.println("SignInController.doGet");
        CookiesManager.getInstance().readUserInfoCookie(request);
        // todo if already logged in, redirect to home page
        request.getRequestDispatcher(UrlMappingConstants.getInstance().getViewUrl(PageNames.SIGN_IN_PAGE)).include(request, response);
        System.out.println("SignInController.doGet");
        // do verifying
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // do preparing
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        UserRepo userRepo = UserRepo.getInstance();
        Optional<User> user = userRepo.findByEmailPassword(email,password);
        if (email != null &&
                password != null &&
                user.isPresent()) {
            if (rememberMe != null && rememberMe.equals("true")) {
                String hashedPassword = Hashator.getInstance().hash(password);
                // todo hash both email and password together in one String with reversible hashing before saving it in cookie
                CookiesManager.getInstance().writeUserInfoCookie(response, email, hashedPassword);
            }
            HttpSession session = request.getSession();
            session.setAttribute("user",user.get());
            response.sendRedirect(UrlMappingConstants.getInstance().getControllerUrl(PageNames.HOME_PAGE));
            return;
        } else {
            request.setAttribute("userError", true);
            response.sendRedirect(UrlMappingConstants.getInstance().getControllerUrl(PageNames.NOT_FOUND_404));

        }

        request.getRequestDispatcher(UrlMappingConstants.getInstance().getViewUrl(PageNames.SIGN_IN_PAGE)).include(request, response);
        // do verifying
    }

    public String getServletInfo() {
        return null;
    }

    public void destroy() {

    }
}
