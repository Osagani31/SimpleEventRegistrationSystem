# 🎉 Simple Event Management System (Java Servlet + JSP)

A basic *Event Management System* built with *Java Servlets, **JSP, and **MySQL. This project allows an **Admin* to register events and view all listed events. Designed for learning the basics of web development using Java EE technologies.



---

## 🚀 Features

- 🔐 Admin-only access(username-admin/password-admin123)
- 📝 Add/Register events (title, date, description, etc.)
- 📋 View all listed events
- 📝 Assign Event Manager and allocated Hall to Co-ordinate event
- 📋 View all Assign Event Manager and Hall 
- 📝 Add Event Status with Customer Comments to Analyze data about the business and for Marketing purposes
- 📋 View all Event Status
- 💾 MySQL database integration (via phpMyAdmin)
- 🖥 Hosted on Apache Tomcat server

---

## 🛠 Tech Stack

- *Frontend*: JSP, HTML, CSS, Bootstrap 
- *Backend*: Java Servlets
- *Database*: MySQL (managed using phpMyAdmin)
- *Server*: Apache Tomcat (recommended: v9+)
- *Build Tool*: Manual setup or IDE (Apache)

---
## 🔐 Admin Login Page

Here is the admin login page of the Event Management System:
![image](https://github.com/user-attachments/assets/345c6eea-de86-4f0c-8712-7f48c26a7c47)

### 📝 Register Event Form
Allows the admin to enter event title, date, description, etc.
![image](https://github.com/user-attachments/assets/ee153f46-36eb-45b0-8135-f750c772d4fd)

### 📋 View All Events
Displays a list of all registered events.


### 🧑‍💼 Assign Manager & Hall
Admin assigns an event manager and hall to a specific event.


### 📊 Event Status Page
Admin updates status with customer feedback.


---

## 🎬 Demo Video

▶️ 
---

## 📁 Folder Structure

EventManagementSystem/
│
├── src/
│ ├── LoginServlet.java
│ ├── EventServlet.java
│ ├── AssignmentServlet.java
│ ├── StatusServlet.java
│ └── DBConnection.java
│
├── web/
│ ├── login.jsp
│ ├── registerEvent.jsp
│ ├── viewEvents.jsp
│ ├── assignEvent.jsp
│ ├── viewAssignments.jsp
│ ├── updateStatus.jsp
│ └── viewStatus.jsp
│
├── images/
│ ├── admin-login.png
│ ├── register-event.png
│ ├── view-events.png
│ ├── assign-manager-hall.png
│ ├── event-status.png
│ └── demo.gif
│
└── README.md

---

## 📦 How to Run

1. Clone or download the repo
2. Import project into Apache NetBeans
3. Set up Tomcat Server (v9+)
4. Import the `event_management.sql` file into phpMyAdmin
5. Update DB connection info in `DBConnection.java`
6. Run on `http://localhost:8080/EventManagementSystem`

---

## 📧 Contact

For suggestions or queries:

**GitHub**: [@Osagani31](https://github.com/Osagani31)

---


