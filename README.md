# theLook eCommerce: End-to-End RFM Customer Segmentation

This project performs a comprehensive **RFM (Recency, Frequency, Monetary)** analysis using the **theLook eCommerce** dataset on Google Cloud BigQuery. The goal is to segment customers based on their purchasing behavior to drive personalized marketing strategies.

## Project Overview
RFM analysis is a proven marketing model for behavior-based customer segmentation. It evaluates:
* **Recency:** Days since the last purchase.
* **Frequency:** Total number of completed orders.
* **Monetary:** Total revenue generated per customer.

## 🛠 Technical Workflow & SQL Architecture
The analysis is built through a modular 4-step SQL pipeline:

### 1. Metric Calculation
Using `CTEs`, I transformed raw `TIMESTAMP` data into actionable metrics. The analysis date was dynamically set to one day after the latest transaction in the dataset to ensure accurate Recency calculations.

### 2. Scoring with Deciles
Instead of simple ranking, I used `NTILE(10)` to divide the customer base into deciles for each metric. 
* **Score 10:** Top 10% performing customers.
* **Score 1:** Bottom 10% performing customers.

### 3. Total RFM Score
By summing the R, F, and M scores, a **Total RFM Score** (ranging from 3 to 30) was created. This provides a multidimensional view of customer value.

### 4. Business-Logic Driven Segmentation
I applied a `CASE WHEN` logic to categorize customers into fashion-industry specific segments:

| Total Score | Segment Name | Strategy |
| :--- | :--- | :--- |
| **28 - 30** | **Fashion Icons** | VIP rewards and early access to new collections. |
| **24 - 27** | **Trendsetters** | Loyalty programs and frequent buyer incentives. |
| **20 - 23** | **Style Enthusiasts** | Cross-sell and up-sell opportunities. |
| **12 - 19** | **Seasonal Buyers** | Reactivation campaigns during major sales. |
| **8 - 11** | **Window Shoppers** | Engagement-focused newsletters to stay top-of-mind. |
| **3 - 7** | **Out of Style** | Re-engagement or win-back offers for inactive users. |

## Technologies Used
* **Data Warehouse:** Google BigQuery
* **Cloud Storage:** Google Cloud Storage (GCS)
* **Language:** SQL (Standard SQL)
* **Visualization:** Tableau Public

##  Repository Structure
* `rfm_metrics.sql`: Calculation of raw metrics and initial rankings.
* `rfm_scores.sql`: Logic for decile-based scoring (NTILE).
* `rfm_total.sql`: Aggregation of final scores.
* `rfm_segments_final.sql`: Creation of the final BI-ready table with segments.

## How to Use
1.  Run the SQL scripts in BigQuery in chronological order.
2.  Update the Project ID (`coherent-vision-494816-h7`) to match your own GCP environment.
3.  The final table `rfm_segments_final` is optimized for direct connection to Tableau or Looker Studio.
