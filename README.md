# Ola Ride-Hailing Data Analysis

An end-to-end analysis of Ola ride-booking data using Python, MySQL, SQL, and Power BI. The project explores booking outcomes, vehicle performance, cancellations, ratings, payment methods, ride distance, and booking value.

## Project contents

| File | Description |
| --- | --- |
| [`Ola.xlsx`](./Ola.xlsx) | Source ride-booking dataset |
| [`Project-2.ipynb`](./Project-2.ipynb) | Python data-cleaning and MySQL-loading workflow |
| [`Project-2.sql`](./Project-2.sql) | SQL queries for business questions |
| [`Project-2.pbix`](./Project-2.pbix) | Power BI report |
| [`Ola-ppt.pptx`](./Ola-ppt.pptx) | Presentation of the analysis |

## Dataset

The source workbook contains 103,024 records and 16 columns. The populated records describe rides across fields including:

- Booking date and booking status
- Vehicle type
- Pickup and drop locations
- Vehicle and customer turnaround time (`V_TAT` and `C_TAT`)
- Customer- and driver-cancellation details
- Incomplete-ride indicators and reasons
- Booking value and payment method
- Ride distance
- Driver and customer ratings

The notebook output indicates that 40,539 rows contain populated analytical data. Check the source workbook before drawing conclusions if the populated-row count changes in a later version.

## Analysis workflow

1. Load `Ola.xlsx` into a pandas DataFrame.
2. Inspect structure, data types, and missing values.
3. Fill missing driver and customer ratings with the median rating for the corresponding vehicle type.
4. Fill missing payment methods with `Cash`.
5. Fill missing incomplete-ride fields with `No`.
6. Fill missing cancellation-detail fields with `No`.
7. Load the cleaned data into a local MySQL database named `ola`, in a table named `customer_data`.
8. Query the cleaned table with the SQL statements in [`Project-2.sql`](./Project-2.sql).
9. Review the results in the Power BI report and presentation.

## Prerequisites

- Python 3.9 or later
- Jupyter Notebook or JupyterLab
- MySQL Server
- A MySQL database named `ola`
- Python packages:
  - `pandas`
  - `numpy`
  - `sqlalchemy`
  - `pymysql`
- Power BI Desktop to open the `.pbix` report

Install the Python dependencies with:

```bash
python -m pip install pandas numpy sqlalchemy pymysql openpyxl jupyter
```

## Running the notebook

1. Start MySQL and create the database:

   ```sql
   CREATE DATABASE ola;
   ```

2. Open [`Project-2.ipynb`](./Project-2.ipynb) in Jupyter.
3. Update the input Excel path to the location of [`Ola.xlsx`](./Ola.xlsx).
4. Configure the MySQL connection with local credentials supplied securely through environment variables or a local configuration mechanism.
5. Run the notebook cells in order. The final database-loading step writes the cleaned DataFrame to `customer_data`.

> **Security note:** Do not commit database passwords or other secrets to the notebook or repository. Rotate any credential that may previously have been stored in a project file, and use environment variables or a secrets manager instead.

## SQL analysis

[`Project-2.sql`](./Project-2.sql) contains queries covering:

- Successful bookings
- Total ride distance by vehicle type
- Customer-cancellation counts
- Driver cancellations caused by personal or car-related issues
- Minimum and maximum driver ratings for Prime Sedan
- UPI payments
- Average customer ratings by vehicle type
- Total booking value from successful rides
- Reasons for incomplete rides

The script expects MySQL syntax and the following table:

```text
ola.customer_data
```

Run it after the notebook has created and populated the table.

## Outputs

- [`Project-2.pbix`](./Project-2.pbix) contains the interactive Power BI report.
- [`Ola-ppt.pptx`](./Ola-ppt.pptx) contains the presentation-ready summary.

## Notes and limitations

- The notebook uses vehicle-type medians to impute missing ratings. This changes the raw values and should be documented when comparing results with the source data.
- Missing payment methods and ride-status detail fields are filled with categorical defaults. Treat these values as imputed, not as confirmed observations.
- The SQL script includes one question marked as unavailable because the required data is not present in the dataset.
- Paths and database settings are machine-specific and must be updated before rerunning the workflow.
