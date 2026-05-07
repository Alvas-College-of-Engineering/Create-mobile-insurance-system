package com.insurance.servlet;

import com.insurance.model.Policy;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        @SuppressWarnings("unchecked")
        List<Policy> policies = (session != null)
                ? (List<Policy>) session.getAttribute("policies")
                : null;

        req.setAttribute("policies", policies);
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
}
