# 🚗 Car Sales Analysis

An end-to-end data analytics project on a used-car dataset: data inspection and cleaning in **Python**, business analysis in **SQL (MySQL)**, and an interactive dashboard in **Power BI**.

![Dashboard Preview](dashboard%20preview.png)

---

## 📌 Project Overview

The goal of this project is to understand what drives used-car prices and which brands, fuel types, locations and segments dominate the market. The workflow has three stages:

1. **Data Cleaning & Exploration** – inspecting the raw data, checking missing values and duplicates (Python / Pandas).
2. **SQL Analysis** – answering business questions on brands, fuel, transmission, location, age and price segments.
3. **Dashboard** – presenting the key metrics and trends in an interactive Power BI report.

---

## 🗂️ Dataset

- **Size:** 32,200 rows × 14 columns
- **Columns:** `brand`, `model`, `transmission`, `age`, `fuel`, `engine`, `km`, `owner`, `price`, `location`, `mileage`, `power`, `seats`, `type`
- **Duplicates:** none found
- **Missing values:**

| Column | Missing |
|--------|--------:|
| type | 24,185 |
| location | 18,399 |
| owner | 15,381 |
| power | 10,927 |
| mileage | 10,820 |
| engine | 8,132 |
| seats | 2,847 |
| brand, model, age | 1 each |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas), Jupyter / Google Colab | Data loading, inspection and cleaning |
| SQL (MySQL) | Exploratory and business analysis |
| Power BI | Interactive dashboard |
| GitHub | Version control and hosting |

---

## 📂 Repository Structure

```
car_sales_analysis/
│
├── car_csv_cleaned_file_pynb.ipynb   # Python notebook: cleaning & exploration
├── cleaned_car.csv.csv               # Cleaned dataset
├── Car_Sales_Analysis.sql            # SQL queries (database setup + analysis)
├── car sales dashboard.pbix          # Power BI dashboard
├── dashboard preview.png             # Dashboard screenshot
└── README.md
```

---

## 🧹 Data Cleaning (Python)

Done in `car_csv_cleaned_file_pynb.ipynb`:

- Loaded the data with `pd.read_csv()` and previewed it with `head()` / `tail()`
- Checked structure and data types with `info()` and `shape`
- Reviewed numeric ranges and spotted outliers with `describe()`
- Counted missing values per column with `isnull().sum()`
- Checked for duplicate rows (0 found) and applied `drop_duplicates()`
- Saved the final file with `to_csv(index=False)`

---

## 🔍 SQL Analysis

All queries are in `Car_Sales_Analysis.sql`, which creates the `car_db` database and `cars` table, then explores the data in these sections:

| Section | What it answers |
|---------|-----------------|
| **Basic Exploration** | Total number of cars in the dataset |
| **Brand Analysis** | Cars per brand, average price per brand, top 10 most expensive cars, min / max / average price per brand |
| **Fuel & Transmission** | Cars per fuel type, manual vs automatic (count and price), fuel + transmission combinations |
| **Location & Owner** | Cars and average price by location; effect of number of owners on price |
| **Age, Model & Usage** | Price vs age, top 10 brand-model combinations, high-mileage cars (> 100,000 km) by brand |
| **Budget & Premium Segments** | 20 cheapest young, low-usage cars (≤ 5 years, ≤ 50,000 km); premium cars priced ≥ ₹10 lakh by brand |

**SQL concepts used:** `GROUP BY`, `ORDER BY`, aggregate functions (`COUNT`, `AVG`, `MIN`, `MAX`), `ROUND`, `WHERE` with multiple conditions, `LIMIT`, aliases.

---

## 📊 Power BI Dashboard

`car sales dashboard.pbix` presents the findings visually. Open it in Power BI Desktop to explore the interactive visuals.

<!-- Add a short list of the visuals/KPIs/slicers your dashboard contains -->

---

## 💡 Key Insights

<!-- Replace with your real findings from the SQL results / dashboard, for example: -->

- Which brand has the most cars listed, and which has the highest average price
- How price drops as car age increases
- How fuel type and transmission affect price
- Which locations have the most listings

---

## ▶️ How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/Yashagarg7689/car_sales_analysis.git
   ```
2. **Cleaning notebook** – open `car_csv_cleaned_file_pynb.ipynb` in Jupyter or Google Colab.
   > Note: the last cell uses `google.colab`, which works only in Colab.
3. **SQL** – import the cleaned CSV into MySQL as the `cars` table and run `Car_Sales_Analysis.sql`.
4. **Dashboard** – open `car sales dashboard.pbix` in Power BI Desktop.

---

## 🙋 Author

**Yasha**
GitHub: [@Yashagarg7689](https://github.com/Yashagarg7689)
