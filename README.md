# DBT Project – Intus Windows Assessment

## Project Overview

This project is a comprehensive solution for transforming and aggregating sales and marketing data using dbt. The objective was to refactor an existing SQL query into a modular, maintainable dbt model, implement robust data quality tests, and create a reusable macro. The final output is a summary table of key performance metrics that supports further business analysis.

## Virtual Environment

A dedicated virtual environment named **dbt-venv** was created to manage project dependencies. All required packages are listed in the `requirements.txt` file, ensuring the environment can be easily reproduced.

## Data Sources & Schemas

- **Source Data:**  
  Sample data was generated and loaded into a PostgreSQL database under the **New** schema. The source tables are:
  - **sales_transactions:** Contains transaction details, including timestamps, revenue, and cost.
  - **product_catalog:** Contains product information and associated categories.
  - **marketing_events:** Contains marketing event data, including costs and event details.

- **Transformed Data:**  
  The final aggregated output is built in the **Dbt_Test** schema as the table **mkt_sales_summary**.

## Transformation Model

The core dbt model, **mkt_sales_summary**, aggregates data by:
- Extracting the year and month from transaction timestamps.
- Joining sales data with product and marketing information.
- Computing key metrics such as:
  - Unique customer count
  - Total revenue and total cost
  - Total marketing cost and number of marketing events
  - Revenue-to-cost ratio (computed using a reusable macro)

The model is materialized as a table in the **Dbt_Test** schema, ensuring it is replaced on each run.

## Reusable Macro

The **safe_div** macro safely computes the revenue-to-cost ratio by:
- Handling division-by-zero errors (returning zero if total cost is zero).
- Casting both the revenue and cost to numeric values to avoid integer division.
- Rounding the result to two decimal places for a consistent numeric format.

## Data Quality Testing

Four custom SQL tests are implemented to ensure data integrity:
- A test to verify that key fields (year, month, category) are not null.
- A test to confirm that the revenue-to-cost ratio is not null.
- A test to ensure that the revenue-to-cost ratio is correctly rounded to two decimal places.
- A test to verify that each (year, month, category) combination is unique.

These tests are executed before running the transformation model to ensure only high-quality data is processed.

## Project Configuration

The project is organized with the following key configuration files:
- **dbt_project.yml:** Defines the folder structure for models, tests, seeds, macros, analyses, and snapshots.
- **profiles.yml:** Contains connection profiles for sourcing raw data from the **New** schema and building the transformed output in the **Dbt_Test** schema. (Note: The actual `profiles.yml` file is excluded from the repository for security reasons; please refer to `profiles.template.yml` for a template.)
- **requirements.txt:** Lists all project dependencies.

## Execution Workflow

1. **Environment Setup:** Activate the **dbt-venv** virtual environment.
2. **Data Loading:** Load the sample data into the PostgreSQL database under the **New** schema.
3. **Data Quality Testing:** Run `dbt test` to validate data integrity.
4. **Model Execution:** Run `dbt run` to build the **mkt_sales_summary** table in the **Dbt_Test** schema.

## Conclusion

This project delivers a structured dbt solution for transforming and aggregating sales and marketing data. It ensures data integrity through rigorous testing and employs a reusable macro for accurate calculations. The final output, stored in the **Dbt_Test** schema, is optimized for analysis. All necessary files and documentation are included in this repository for review and execution.
