package controllers;

import constants.UrlMappingConstants;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import constants.enums.PageNames;
import models.orm.ProductCategory;
import models.orm.User;
import providers.repositories.CategoryRepo;
import providers.repositories.ProductRepo;
import providers.repositories.UserRepo;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    ServletConfig myConfig;

    public void init(ServletConfig config) throws ServletException {
        myConfig = config;
    }

    public ServletConfig getServletConfig() {
        return null;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // do preparing
        //todo get all categories
        CategoryRepo categoryRepo = CategoryRepo.getInstance();
        List<ProductCategory> categories = categoryRepo.readAll();
        request.setAttribute("categories",categories);
        //todo try to use pagination while getting products
        //todo get new arrivals
        System.out.println("HomeController.doGet");
        request.getRequestDispatcher(UrlMappingConstants.getInstance().getViewUrl(PageNames.HOME_PAGE)).include(request, response);
        // do verifying
    }

    public String getServletInfo() {
        return null;
    }

    public void destroy() {

    }
}
