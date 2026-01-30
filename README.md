# 🚀 Azure Databricks Portfolio Project – Unity Catalog

![Azure](https://img.shields.io/badge/Azure-Databricks-blue?logo=azure-databricks)
![PySpark](https://img.shields.io/badge/PySpark-Data%20Engineering-orange?logo=apache-spark)
![Delta](https://img.shields.io/badge/Delta-Lake-green?logo=databricks)
![GitHub](https://img.shields.io/badge/GitHub-Repo-black?logo=github)

## 📌 Overview
This project demonstrates the implementation of **Unity Catalog** in Azure Databricks for managing data pipelines across **Raw, Bronze, Silver, and Gold layers**.  
It covers ingestion, transformation, orchestration, monitoring, and visualization, making it a complete end-to-end data engineering solution.

---

## 🔑 Unity Catalog Setup
- **Catalog**: `Dev` (development environment)  
- **Credentials**: `Cred_tracking_dev` (per-environment external location credentials)  
- **External Locations**:  
  - `El_dev_tracking_raw` → Raw layer  
  - `El_dev_tracking_bronze` → Bronze layer  
  - `El_dev_tracking_silver` → Silver layer  
  - `El_dev_tracking_gold` → Gold layer  

---

## 🗂 Schemas & Data Layers
<details>
<summary>Bronze Layer (`tracking_br`)</summary>

- Tables: `Order`, `Ordertracking`, `Invoice`, `Paymentdetail`
</details>

<details>
<summary>Silver Layer (`tracking_sl`)</summary>

- Tables: `Order`, `Ordertracking`, `Invoice`, `Paymentdetail`
</details>

<details>
<summary>Gold Layer (`tracking_gd`)</summary>

**Dimensions**:  
`Dimdate`, `Dimbank`, `Dimorder`, `Diminvoice`, `Dimorganization`, `Dimpayment`, `Dimproduct`, `Dimtracking`, `Dimvehicle`  

**Facts**:  
`Factorder`, `Factinvoice`, `Factpayment`
</details>

---

## 📓 Notebooks & ETL
- **Git Folder**: `Otracking`  
- **Common Utilities**: `Define_path`, `Libs`  
- **Schema Definition Notebooks**: `Bronze_schema`, `Silver_schema`, `Gold_schema`  
- **ETL Master Notebooks**:  
  - `Load_bronze` → Bronze ingestion  
  - `Load_silver` → Silver transformations  
  - `Load_gold_dimensions` → Gold dimensions  
  - `Load_gold_facts` → Gold facts  

---

## 📦 Storage Architecture
- **Storage Account**: `DevStorageDatabricks`  
- **Containers**:  
  - `Raw` → CSV source data  
  - `Tracking-bronze` → Bronze parquet data  
  - `Checkpoint` → Autoloader checkpoint  
  - `Schema` → Autoloader schema  
  - `Tracking-silver` → Silver parquet data  
  - `Tracking-gold` → Gold parquet data (facts & dimensions)  

---

## ⏱ Jobs & Scheduling
- **Job Name**: Daily ETL Execution  
- **Schedule**: Runs daily at 1 AM  
- **Notifications**: Email alerts on start, completion, and failure  
- **Tasks**:  
  1. `bronze_load`  
  2. `silver_load`  
  3. `load_dimensions`  
  4. `load_facts`  

---

## 🔍 Queries
1. **Cost by Month** → Order date, month, estimated cost, delivery cost  
2. **Count by Product Category** → Orders grouped by product category  

---

## 🚨 Alerts
- **Name**: `Alert_ordercount`  
- **Trigger**: Order count > 2500 for *consumables* category  
- **Schedule**: 2 AM, 30th of each month  
- **Notification**: Email alert when triggered  

---

## 📊 Dashboard
- **Name**: `Order Stats`  
- **Visualizations**:  
  - Bar chart → Orders by product category  
  - Area chart → Estimated vs. delivery cost by month  
- **Schedule**: Refresh daily at 5 AM  
- **Subscription**: Admin group  

---

## ⚙️ Technology Stack
- Unity Catalog  
- External Locations  
- Azure Blob Storage  
- Microsoft Databricks Access Connector  
- PySpark  
- Autoloader  
- SparkSQL (`MERGE INTO`)  
- Custom libraries for reusable functions  
- Jobs & Schedules  
- Queries & Alerts  
- Dashboards  
- GitHub (version control)  
- Delta Tables with Partitioning  

---

## 📌 Key Highlights
- End-to-end **data lakehouse pipeline** using Databricks  
- **Layered architecture** (Bronze → Silver → Gold) for clean transformations  
- **Automated orchestration** with jobs & schedules  
- **Monitoring & governance** via queries, alerts, and dashboards  
- **Version control** with GitHub integration  

---



