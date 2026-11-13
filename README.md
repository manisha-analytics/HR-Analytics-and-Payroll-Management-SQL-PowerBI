<img width="1600" height="900" alt="Screenshot (32)" src="https://github.com/user-attachments/assets/2bcb5347-4a83-4c15-a34c-91e98eb8e8b5" />
# 📊 HR Analytics & Payroll Management System (SQL & Power BI)

## 📌 Project Overview
An end-to-end HR Analytics and Payroll Management solution designed to track employee headcount, department-wise payroll budgets, attendance consistency, and salary distributions across multiple locations (Bengaluru, Chennai, Hyderabad, Mumbai).

## 🛠️ Tech Stack & Tools
* **Database & Querying:** SQL (Joins, Window Functions, Aggregations, Composite Key Filtering)
* **Data Modeling & BI:** Power BI (Star Schema Architecture, DAX Measures, Interactive Visuals)

## 🗂️ Database Architecture (Star Schema)
The relational database consists of 5 core tables connected via a clean Star Schema:
* `department` (Dimension)
* `employee` (Central Dimension/Fact)
* `attendance` (Fact - Daily punch logs)
* `payroll` (Fact - Monthly net salary, bonuses, deductions)
* `leaves` (Fact - Leave allocations)

<img width="1600" height="900" alt="Screenshot (32)" src="https://github.com/user-attachments/assets/146197c5-ee3c-4065-99f3-7e9d68bac063" />



## 💡 Key SQL & DAX Implementations
* **Resolved Data Multiplication Bugs:** Implemented composite joins (`department_id` & `location`) with `COUNT(DISTINCT)` to prevent cross-joining multiplication across duplicate branch records.
* **Departmental Salary Ranking:** Utilized `DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC)` to rank employee salaries within each department.
* **Cyclical Payroll Tracking (DAX):** Built custom `CALCULATE` measures to isolate monthly payroll expenses (e.g., September Payroll).

## 📈 Key Business Insights
* **Workforce & Payroll:** Managed **40 active employees** across **5 departments** with a total monthly payroll budget of **$2,559,000** and an average base salary of **$63,975**.
* **Salary Range:** Highest salary recorded at **$120,000** (HR) and lowest at **$35,000** (Sales).
* **Attendance Consistency:** Achieved an overall **92.5% attendance rate** with zero chronic absenteeism (no employee exceeded 3 absences).

## 📊 Dashboard Preview
*(Tip: Add your Power BI Dashboard screenshot link here)*
