# Bank-Customer-Churn-Analysis
This projects consists of anaysis of 10,000 bank customers to get insights about customer churn behavior, using Python, SQL, and Power BI.
## Project Intro/Objective
The purpose of this project is to gather insights about customer churn behavior. This project analyzes churn patterns for 10,000 bank customers, using demographic, account, and service data to identify who leaves and why.

-- Project Status: Completed

Methods Used
    
    Exploratory Data Analysis,
    Handled Missing Data,
    Feature Engineering,
    Column Standardization, 
    etc.

Technologies

    Python
    PostgreSQL
    Pandas, jupyter
    Power BI

## About the Dataset
The dataset consists of 10,000 rows of synthetic customer data and 18 columns. The columns are in following categories :-
    i) Customer Demographics – Age, Gender, Geography 
    ii) Banking Related – Has Cr Card, Is Active Member, Card Type, Tenure, Balance, Num of Products
    iii) Financial Profile – Credit Score, Estimated Salary, Balance
    iv) Service and Loyalty – Complain, Satisfaction Score, Point Earned 
    v) Target Variable – Exited

## Workflow
    Exploratory Data Analysis (EDA) using Python -> Structured Analysis using SQL -> Data Visualization -> Recommendations

## EDA using Python
  1. Data Loading and Initial Exploration- Imported the dataset into Python and checked the structure and summary statistics with       .info() and .describe() using Pandas.
  2. Handling Missing Values - Checked whether there were any null values within the data, there weren't any, so no imputation needed.
  3. Standardized the Column Names - Converted the column names to snake case. (Eg- Has Cr Card -> has_cr_card).
  4. Feature Engineering - Created 2 new columns, age_group and credit_score_range.
  5. Data Quality Check - Checked for duplicates within the data, there weren't any. Also, dropped 2 columns, row_number and surname.
  6. Database Connection - Connected to PostgreSQL and Loaded the cleaned dataframe into it for further analysis.

## Structured Analysis using PostgreSQL
  Answered the following business questions using PostgreSQL:-
    1. No of Active Customers who Churn
    2. No of Churners and Non-Churners by Gender
    3. No of Churners and Non-Churners by Geography
    4. Customer Churn by Age Group
    5. No of Churners and Non-Churners by Tenure
    6. Customer Churn based on the number of products they use from the Bank
    7. No of Customers and Churners by Complaint Status
    8. Customer Churn based on whether or not they own a Credit Card
    9. Customer Churn based on Balance (highest, lowest and average balance)
    10. Top 3 Age Groups by Churn Rate in each Country
    11. Churn Rate by Balance Quartile within Each Country

## Dashboard
<img width="579" height="353" alt="image" src="https://github.com/user-attachments/assets/ff730db6-6370-45cf-a496-e6f434239237" />

## Key Findings
  1. Overall churn: 2,038 of 10,000 customers left, a churn rate of 20.38%.
  2. Age is the strongest driver: Seniors churn at 44.62% versus 7.63% for young adults, and they make up 1,044 of the 2,038 churners   (about 51%). Seniors also rank first in every country (Germany 61.63%, France 38.70%, Spain 35.31%).
  3. Germany churns at double the rate of the other countries: 32.44% versus 16.17% for France and 16.67% for Spain. It holds about a   quarter of customers but about 40% of churners (814).
  4. Number of products:
      i) Customers with 2 products churn the least (7.60%).
      ii) Customers with 1 product churn at 27.71%, and they account for about 69% of all churners (1,409).
      iii) Customers with 3 or 4 products churn at 82.71% and 100%, though these groups are small (326 customers combined).
  5. Inactive members churn about twice as much as active ones: For women it's 32.09% versus 18.13%, and for men 22.32% versus 11.20%.
  6. Gender: female customers churn at 25.07% (1,139 of 4,543) versus 16.47% for male customers (899 of 5,457).
  7. Balance within each country:
      i) In France and Spain, churn rises steadily with balance quartile (France 14.11% to 19.47%, Spain 13.06% to 19.22%).
      ii) In Germany, churn peaks in the middle quartiles (44.18% and 37.96%).
  8. Complaints and exits almost coincide: 2,034 of 2,044 customers who complained churned (99.5%), versus 4 of 7,956 who didn't.       This suggests complaints were recorded at or after the exit, so treat it as a data caveat, not a driver.
  9. Weak or no effect: tenure (about 17-23% in every year, with no clear trend), credit card ownership (about 20% either way), and     credit score (18-22% across bands).

## Business Recommendations
  1. Gender Targeted Efforts – Female customers make up 55.89% of all churners vs 44.11% for male customers, and churn at 25.07%        versus 16.47% for male customers, investigate the reason for it and apply some targeted retention schemes based on customer           behavior and needs.
  2. Product Depth Strategy – Customers with 2 products tend to have the lowest churn rate, 7.6%, while those who purchase 3 or 4       products have the highest churn rate, 82.71% and 100%. Though the last 2 categories have lesser amount of customers, it is still      worth investigating the cause behind this (for example – price, fees, product fit etc.), before promoting any selling further than    2 products.
  3. Region Based Efforts – Germany’s churn rate is 32.44% as compared to Spain and France’s 16.67% and 16.17%, look into the reasons   for it and rectify it using some targeted retention strategies, and track the churn rate quarterly.

### The churn rates can all be found within the dashboard.
