<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.insurance.model.PlanRegistry, com.insurance.model.InsurancePlan, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register Device — Mobile Insurance System</title>
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
    <a href="index.jsp" class="active">Register</a>
    <a href="dashboard">Dashboard</a>
  </div>
</nav>

<!-- HERO -->
<div class="hero fade-in">
  <div class="hero-tag">📱 Smart Device Protection</div>
  <h1>Insure Your<br/>Mobile Device</h1>
  <p>Get comprehensive coverage in minutes. Choose a plan, register your device, and stay protected.</p>
</div>

<!-- FORM -->
<div class="container">
  <div class="section">
    <form action="register" method="POST" class="fade-in">

      <!-- Error Alert -->
      <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-error">
        ⚠ <%= request.getAttribute("error") %>
      </div>
      <% } %>

      <!-- Device Info -->
      <div class="card mb-24">
        <div class="card-title"><span class="dot"></span> Device Information</div>
        <div class="form-grid">
          <div class="field">
            <label for="imei">IMEI Number</label>
            <input type="text" id="imei" name="imei"
                   placeholder="Enter 15-digit IMEI"
                   maxlength="15" pattern="\d{15}"
                   value="<%= request.getParameter("imei") != null ? request.getParameter("imei") : "" %>"
                   required/>
          </div>
          <div class="field">
            <label for="brand">Brand</label>
            <input type="text" id="brand" name="brand"
                   placeholder="e.g. Samsung, Apple, OnePlus"
                   value="<%= request.getParameter("brand") != null ? request.getParameter("brand") : "" %>"
                   required/>
          </div>
          <div class="field">
            <label for="model">Model</label>
            <input type="text" id="model" name="model"
                   placeholder="e.g. Galaxy S24, iPhone 15"
                   value="<%= request.getParameter("model") != null ? request.getParameter("model") : "" %>"
                   required/>
          </div>
        </div>
      </div>

      <!-- Plan Selection -->
      <div class="card mb-24">
        <div class="card-title"><span class="dot"></span> Choose Insurance Plan</div>
        <div class="plan-grid">
          <%
            Map<String, InsurancePlan> plans = PlanRegistry.getAll();
            boolean first = true;
            for (Map.Entry<String, InsurancePlan> entry : plans.entrySet()) {
              InsurancePlan p = entry.getValue();
              String checked = first ? "checked" : "";
              first = false;
          %>
          <div class="plan-option">
            <input type="radio" name="plan" id="plan_<%= p.getPlanId() %>"
                   value="<%= p.getPlanId() %>" <%= checked %>/>
            <label for="plan_<%= p.getPlanId() %>">
              <% if (p.getPlanId().equals("PREMIUM")) { %>
              <div class="plan-badge">⭐ Best Value</div>
              <% } %>
              <div class="plan-name"><%= p.getPlanName() %></div>
              <div class="plan-price">₹<%= String.format("%,.0f", p.getPremium()) %> <span>one-time</span></div>
              <div class="plan-duration">Coverage: <%= p.getDurationMonths() %> months</div>
              <div class="plan-coverage"><%= p.getCoverage() %></div>
            </label>
          </div>
          <% } %>
        </div>
      </div>

      <!-- Submit -->
      <button type="submit" class="btn btn-primary btn-full">
        🔐 Purchase & Generate Policy
      </button>

    </form>
  </div>
</div>

<footer>
  &copy; 2025 <span>MobileShield Insurance</span> · Secure. Simple. Smart.
</footer>

<script>
  // Highlight plan on click
  document.querySelectorAll('.plan-option input').forEach(radio => {
    radio.addEventListener('change', () => {
      document.querySelectorAll('.plan-option label').forEach(l => l.style.transform = '');
      if (radio.checked) {
        radio.nextElementSibling.style.transform = 'scale(1.02)';
      }
    });
  });
</script>
</body>
</html>
