# 🏆 dbt Project: Sales and Marketing Insights

## **1. Overview**
This dbt project processes **raw sales and marketing data** from the `New` schema and transforms it into useful business insights in the `Dbt_Test` schema.

- ✅ Sources: `sales_transactions`, `product_catalog`, and `marketing_events`
- ✅ Transformation Model: `mkt_sales_summary`
- ✅ Tests: Ensures data quality before processing
- ✅ Analysis Queries: Extracts key insights

## **2. Data Flow**
1️⃣ **Raw Data Source:**
   - `New.sales_transactions` → Contains revenue and cost per product.
   - `New.product_catalog` → Stores product categories.
   - `New.marketing_events` → Logs marketing spend and events.

2️⃣ **Transformation (dbt Model):**
   - Aggregates data by **year, month, and category**.
   - Summarizes:
     - Unique customers
     - Total revenue & costs
     - Marketing spend & event counts
     - **Revenue-to-Cost Ratio** (Rounded to 2 decimal places)
   
3️⃣ **Transformed Table (`Dbt_Test.mkt_sales_summary`)** is used for reporting and analysis.

---

## **3. Key Metrics Explained**
| Metric | Description |
|--------|------------|
| **Total Revenue** | Sum of sales revenue in a given period. |
| **Total Cost** | Sum of all associated costs in a given period. |
| **Revenue-to-Cost Ratio** | Revenue divided by cost (rounded to 2 decimal places). |
| **Marketing ROI** | Revenue generated per dollar spent on marketing. |
| **Unique Customers** | Number of unique buyers in each period. |

---

