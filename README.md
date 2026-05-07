# 📱 Mobile Insurance System

A Java web application (JSP + Servlets) for registering mobile devices, purchasing insurance plans, and tracking policy status.

---

## 📁 Project Structure

```
MobileInsuranceSystem/
├── src/main/
│   ├── java/com/insurance/
│   │   ├── model/
│   │   │   ├── MobileDevice.java
│   │   │   ├── InsurancePlan.java
│   │   │   ├── Policy.java
│   │   │   └── PlanRegistry.java
│   │   └── servlet/
│   │       ├── PolicyServlet.java      ← POST /register
│   │       └── DashboardServlet.java   ← GET /dashboard
│   └── webapp/
│       ├── index.jsp           ← Registration form
│       ├── policyDetails.jsp   ← Policy issued page
│       ├── dashboard.jsp       ← All policies table
│       ├── css/style.css
│       └── WEB-INF/web.xml
└── pom.xml
```

---

## 🟠 Run on Eclipse (with Tomcat)

### Prerequisites
- Eclipse IDE for Enterprise Java (2021+)
- Apache Tomcat 9.x server configured in Eclipse
- JDK 11+

### Steps

1. **Import project**
   - `File → Import → Maven → Existing Maven Projects`
   - Browse to the `MobileInsuranceSystem` folder → Finish

2. **Add Tomcat Server** (if not done)
   - `Window → Preferences → Server → Runtime Environments → Add`
   - Choose `Apache Tomcat v9.0`, point to your Tomcat folder

3. **Add project to server**
   - Right-click project → `Run As → Run on Server`
   - Select your Tomcat 9 instance → Finish

4. **Access the app**
   - Open browser: `http://localhost:8080/MobileInsuranceSystem/`

---

## 🔵 Run on VS Code

### Prerequisites
- VS Code with extensions:
  - **Extension Pack for Java** (Microsoft)
  - **Community Server Connectors** (Red Hat) — for Tomcat support
- Apache Tomcat 9.x downloaded
- JDK 11+ installed, `JAVA_HOME` set

### Steps

1. **Open folder** in VS Code
   - `File → Open Folder → MobileInsuranceSystem`

2. **Configure Tomcat**
   - Press `Ctrl+Shift+P` → `Servers: Create New Server`
   - Choose `Tomcat 9`, point to your Tomcat folder

3. **Build the WAR**
   ```bash
   # In VS Code terminal or system terminal
   mvn clean package
   ```
   This generates `target/MobileInsuranceSystem.war`

4. **Deploy to Tomcat**
   - In the **Servers** panel (bottom): right-click your Tomcat → `Add Deployment`
   - Select the generated `.war` file → Start server

5. **Access the app**
   - Open: `http://localhost:8080/MobileInsuranceSystem/`

### Alternative — Quick CLI run (Maven Tomcat plugin)
```bash
mvn clean tomcat9:run
# Then open http://localhost:8080/MobileInsuranceSystem/
```

---

## 🚀 Features

| Page | URL | Description |
|------|-----|-------------|
| Register | `/` or `/index.jsp` | Fill IMEI, brand, model, select plan |
| Policy Details | `/register` (POST) | Shows issued policy with status & countdown |
| Dashboard | `/dashboard` | Table of all policies registered this session |

## 💡 Plans Available

| Plan | Price | Duration | Coverage |
|------|-------|----------|----------|
| Basic Shield | ₹4,999 | 6 months | Screen + liquid damage |
| Standard Guard | ₹8,999 | 12 months | + theft protection |
| Premium Armor | ₹14,999 | 24 months | All risks + accidental + extended warranty |

---

## 🛠️ Tech Stack
- Java 11, Servlets 4.0, JSP 2.3
- Apache Tomcat 9.x
- Maven (build tool)
- Pure CSS (no frameworks) + Google Fonts
