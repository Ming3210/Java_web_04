package com.example.java_web_04;

import com.example.java_web_04.model.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    private String message;
    private List<Product> products = new ArrayList<>();
    public void init() {
        products.add(new Product(1, "Product 1", "Product 1 description", 10.0));
        products.add(new Product(2, "Product 2", "Product 2 description", 20.0));
        products.add(new Product(3, "Product 3", "Product 3 description", 30.0));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", products);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/B1.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}