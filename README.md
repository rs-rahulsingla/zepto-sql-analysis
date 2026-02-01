# 🛒 Zepto SQL Assignment Project

## 📌 Project Description
This repository contains a **complete MySQL assignment solution** based on a retail inventory dataset inspired by **Zepto** (quick-commerce platform).

The project includes:
- A real-world dataset (CSV)
- A question paper (PDF)
- Fully written SQL solutions
- Proper database schema design
- Analysis using basic, intermediate, and advanced SQL concepts

This project was created as part of an **academic SQL assignment** and demonstrates practical database skills.

---

## 📂 Repository Contents

zepto-sql-assignment/
│
├── dataset/ → CSV dataset used for analysis
├── questions/ → Assignment question PDF
├── solutions/ → Complete SQL solution file
├── screenshots/ → Query output screenshots (optional)
└── README.md

---

## 🗂 Dataset Overview
**File Name:** `zepto_v2.csv`

The dataset contains product-level inventory and pricing information.

### 📄 Columns Description

| Column Name | Description |
|------------|------------|
| Category | Product category |
| name | Product name |
| mrp | Maximum Retail Price |
| discountPercent | Discount percentage |
| availableQuantity | Available stock |
| discountedSellingPrice | Final selling price |
| weightInGms | Product weight in grams |
| outOfStock | Stock status |
| quantity | Unit quantity |

---

## 🛠 Tools & Technologies Used
- **Database:** MySQL  
- **Interface:** MySQL Workbench  
- **Language:** SQL  
- **Data Format:** CSV  
- **Version Control:** Git & GitHub  

---

## 🧱 Database Schema Design

```sql
CREATE TABLE zepto_products (
    Category VARCHAR(100),
    name VARCHAR(255),
    mrp DECIMAL(10,2),
    discountPercent INT,
    availableQuantity INT,
    discountedSellingPrice DECIMAL(10,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);
