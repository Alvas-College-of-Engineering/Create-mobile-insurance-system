<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.insurance.model.Policy" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Policy Details — Mobile Insurance System</title>
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
  Policy policy = (Policy) request.getAttribute("policy");
  if (policy == null) {
    response.sendRedirect("index.jsp");
    return;
  }
  int progress = policy.getProgressPercent();
%>

<div class="container">
  <div class="section fade-in">

    <!-- Success Banner -->
    <div style="text-align:center; margin-bottom:40px;">
      <div style="font-size:3rem; margin-bottom:12px;">✅</div>
      <h1 style="font-family:'Syne',sans-serif; font-size:2rem; font-weight:800; color:var(--text); margin-bottom:8px;">
        Policy Issued Successfully!
      </h1>
      <p style="color:var(--muted);">Your device is now covered. Save your policy ID for future reference.</p>
    </div>

    <div class="card">

      <!-- Header row -->
      <div class="flex items-center justify-between flex-wrap gap-16 mb-24">
        <div>
          <div class="info-label" style="margin-bottom:4px;">Policy ID</div>
          <div style="font-family:'Syne',sans-serif; font-size:1.6rem; font-weight:800; color:var(--teal);">
            <%= policy.getPolicyId() %>
          </div>
        </div>
        <div>
          <% if (policy.isActive()) { %>
          <span class="status-badge status-active">
            <span class="pulse"></span> Active
          </span>
          <% } else { %>
          <span class="status-badge status-expired">⛔ Expired</span>
          <% } %>
        </div>
      </div>

      <!-- Detail grid -->
      <div class="detail-grid">
        <div class="info-row">
          <span class="info-label">📱 Device</span>
          <span class="info-value"><%= policy.getDevice().getDetails() %></span>
        </div>
        <div class="info-row">
          <span class="info-label">📋 Plan</span>
          <span class="info-value"><%= policy.getPlan().getPlanName() %></span>
        </div>
        <div class="info-row">
          <span class="info-label">💰 Premium Paid</span>
          <span class="info-value">₹<%= String.format("%,.0f", policy.getPlan().getPremium()) %></span>
        </div>
        <div class="info-row">
          <span class="info-label">⏱ Duration</span>
          <span class="info-value"><%= policy.getPlan().getDurationMonths() %> months</span>
        </div>
        <div class="info-row">
          <span class="info-label">📅 Start Date</span>
          <span class="info-value"><%= policy.getStartDate() %></span>
        </div>
        <div class="info-row">
          <span class="info-label">⏰ Expiry Date</span>
          <span class="info-value"><%= policy.getExpiryDate() %></span>
        </div>
      </div>

      <!-- Coverage -->
      <div class="info-row mb-24" style="margin-bottom:24px;">
        <span class="info-label">🔒 Coverage</span>
        <span class="info-value" style="font-size:.95rem; color:var(--muted);">
          <%= policy.getPlan().getCoverage() %>
        </span>
      </div>

      <!-- Progress -->
      <% if (policy.isActive()) { %>
      <div class="progress-wrap">
        <div class="progress-label">
          <span>Policy elapsed</span>
          <span style="color:var(--teal);"><%= policy.getDaysRemaining() %> days remaining</span>
        </div>
        <div class="progress-bar">
          <div class="progress-fill" id="progressFill" style="width:0%"></div>
        </div>
      </div>
      <% } %>

      <!-- Actions -->
      <div class="flex gap-16 flex-wrap mt-32">
        <a href="index.jsp" class="btn btn-primary">➕ Register Another Device</a>
        <a href="dashboard" class="btn btn-outline">📊 View Dashboard</a>
      </div>

    </div>
  </div>
</div>

<footer>
  &copy; 2025 <span>MobileShield Insurance</span> · Secure. Simple. Smart.
</footer>

<script>
  // Animate progress bar on load
  window.addEventListener('load', () => {
    const fill = document.getElementById('progressFill');
    if (fill) {
      setTimeout(() => { fill.style.width = '<%= progress %>%'; }, 200);
    }
  });
</script>
</body>
</html>
