package com.insurance.servlet;

import com.insurance.model.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.*;

@WebServlet("/register")
public class PolicyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String imei   = req.getParameter("imei").trim();
        String brand  = req.getParameter("brand").trim();
        String model  = req.getParameter("model").trim();
        String planId = req.getParameter("plan").trim();

        // Basic validation
        if (imei.isEmpty() || brand.isEmpty() || model.isEmpty() || planId.isEmpty()) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }
        if (!imei.matches("\\d{15}")) {
            req.setAttribute("error", "IMEI must be exactly 15 digits.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }

        InsurancePlan plan = PlanRegistry.getById(planId.toUpperCase());
        if (plan == null) {
            req.setAttribute("error", "Invalid plan selected.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }

        MobileDevice device = new MobileDevice(imei, brand, model);
        String policyId = "POL-" + System.currentTimeMillis() % 100000;
        Policy policy = new Policy(policyId, device, plan);

        // Store in session list
        HttpSession session = req.getSession();
        @SuppressWarnings("unchecked")
        List<Policy> policies = (List<Policy>) session.getAttribute("policies");
        if (policies == null) policies = new ArrayList<>();
        policies.add(policy);
        session.setAttribute("policies", policies);

        req.setAttribute("policy", policy);
        req.getRequestDispatcher("policyDetails.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("index.jsp");
    }
}
