<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.insurance.model.Policy, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dashboard — Mobile Insurance System</title>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<!-- NAV -->
<nav class="navbar">
  <a href="index.jsp" class="nav-brand">
    <div class="shield-icon">🛡</div>
    <span>MobileShield</span>
  </a>
  <div class="nav-links">
    <a href="index.jsp">Register</a>
    <a href="dashboard" class="active">Dashboard</a>
  </div>
</nav>

<%
  @SuppressWarnings("unchecked")
  List<Policy> policies = (List<Policy>) request.getAttribute("policies");
  int total   = (policies != null) ? policies.size() : 0;
  int active  = 0;
  int expired = 0;
  if (policies != null) {
    for (Policy p : policies) {
      if (p.isActive()) active++; else expired++;
    }
  }
%>

<div class="container">
  <div class="section fade-in">

    <!-- Page header -->
    <div class="flex items-center justify-between flex-wrap gap-16 mb-24">
      <div>
        <h1 style="font-family:'Syne',sans-serif; font-size:1.9rem; font-weight:800;">
          Policy Dashboard
        </h1>
        <p style="color:var(--muted); margin-top:4px;">All registered devices and insurance status</p>
      </div>
      <a href="index.jsp" class="btn btn-primary">➕ New Policy</a>
    </div>

    <!-- Stats row -->
    <div style="display:grid; grid-template-columns:repeat(3,1fr); gap:16px; margin-bottom:32px;">
      <div class="card" style="padding:20px; text-align:center;">
        <div style="font-size:1.8rem; font-weight:800; font-family:'Syne',sans-serif; color:var(--text);">
          <%= total %>
        </div>
        <div style="color:var(--muted); font-size:.8rem; text-transform:uppercase; letter-spacing:.5px; margin-top:4px;">
          Total Policies
        </div>
      </div>
      <div class="card" style="padding:20px; text-align:center; border-color:rgba(0,200,168,.3);">
        <div style="font-size:1.8rem; font-weight:800; font-family:'Syne',sans-serif; color:var(--teal);">
          <%= active %>
        </div>
        <div style="color:var(--muted); font-size:.8rem; text-transform:uppercase; letter-spacing:.5px; margin-top:4px;">
          Active
        </div>
      </div>
      <div class="card" style="padding:20px; text-align:center; border-color:<%= expired > 0 ? "rgba(224,90,106,.3)" : "var(--border)" %>;">
        <div style="font-size:1.8rem; font-weight:800; font-family:'Syne',sans-serif; color:<%= expired > 0 ? "var(--danger)" : "var(--muted)" %>;">
          <%= expired %>
        </div>
        <div style="color:var(--muted); font-size:.8rem; text-transform:uppercase; letter-spacing:.5px; margin-top:4px;">
          Expired
        </div>
      </div>
    </div>

    <!-- Table or empty state -->
    <div class="card">
      <% if (policies == null || policies.isEmpty()) { %>

      <div class="empty-state">
        <div class="icon">📋</div>
        <h3>No policies yet</h3>
        <p style="margin-bottom:24px;">Register your first device to get started.</p>
        <a href="index.jsp" class="btn btn-primary">Register a Device</a>
      </div>

      <% } else { %>

      <div style="overflow-x:auto;">
        <table class="policy-table">
          <thead>
            <tr>
              <th>Policy ID</th>
              <th>Device</th>
              <th>Plan</th>
              <th>Premium</th>
              <th>Start Date</th>
              <th>Expiry Date</th>
              <th>Days Left</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <% for (Policy p : policies) { %>
            <tr>
              <td style="font-family:'Syne',sans-serif; color:var(--teal); font-weight:700;">
                <%= p.getPolicyId() %>
              </td>
              <td><%= p.getDevice().getDetails() %></td>
              <td><%= p.getPlan().getPlanName() %></td>
              <td>₹<%= String.format("%,.0f", p.getPlan().getPremium()) %></td>
              <td><%= p.getStartDate() %></td>
              <td style="<%= !p.isActive() ? "color:var(--danger);" : "" %>">
                <%= p.getExpiryDate() %>
              </td>
              <td>
                <% if (p.isActive()) { %>
                  <span style="color:var(--teal); font-weight:600;">
                    <%= p.getDaysRemaining() %>d
                  </span>
                <% } else { %>
                  <span style="color:var(--danger);">—</span>
                <% } %>
              </td>
              <td>
                <% if (p.isActive()) { %>
                <span class="status-badge status-active" style="font-size:.75rem; padding:4px 10px;">
                  <span class="pulse"></span> Active
                </span>
                <% } else { %>
                <span class="status-badge status-expired" style="font-size:.75rem; padding:4px 10px;">
                  ⛔ Expired
                </span>
                <% } %>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>

      <% } %>
    </div>

  </div>
</div>

<footer>
  &copy; 2025 <span>MobileShield Insurance</span> · Secure. Simple. Smart.
</footer>

</body>
</html>
