# Data Engineering Project: YouTube Data Analysis using AWS Managed Services

## Detaild Architecture Diagram

![Detaild Architecture Diagram by Maaz Ahmed](journal%20/assets/YouTube%20Data%20Analysis.png "Detaild Architecture Diagram by Maaz Ahmed")

## Dashboard
![Dashboard](journal%20/assets/YouTube%20Data%20Analysis.png "Dashboard")

### Step 1:

- Download Dataset from Kaggle: https://www.kaggle.com/datasets/datasnaek/youtube-new
- Upload this data to s3 bucket as per instructions [aws_s3_cp.sh](https://github.com/maaz-ahmed-ansari/youtube-data-analysis-project/blob/main/aws_s3_cp.sh)

### Step 2:

- Create a Glue Crawler and Crawl over s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/
- Catalog this Table into DB by creating in advance with name (e.g.) "youtube_data_analysis_raw"

### Step 3:

- Once "raw_statistics" table is cataloged into "youtube_data_analysis_raw" database, try to preview it usig Athena
- To use athena, create one sandbox bucket and configure it as output location in athena

### Step 4:

- Write a Glue job to convert csv files into parquet and drop null values if exists for data associated with table "youtube_data_analysis_raw.raw_statistics"
- Store this parquet data into Cleansed Layer (i.e. s3://youtube-data-analysis-cleansed-us-east-1-eng/youtube/raw_statistics/)
- Use this script: [csv_to_parquet_glue_job_script.py](https://github.com/maaz-ahmed-ansari/youtube-data-analysis-project/blob/main/csv_to_parquet_glue_job_script.py) and run the job to perform this data cleaning and file conversion operation

### Step 5:

- Create one more AWS Glue Crawler to crawl through s3://youtube-data-analysis-cleansed-us-east-1-eng/youtube/raw_statistics/
- Register/catalog this data into different database (good practice to isolate raw and cleansed tables) e.g. "youtube_data_analysis_cleansed" database
- After successful run, preview data using athena

### Step 6:

- Create a lambda function to clean json data from s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics_reference_data/ and convert it into parquet
- At the same time register it into Glue Data Catalog
- Use this script for Lambda function: [json_to_parquet_lambda.py](https://github.com/maaz-ahmed-ansari/youtube-data-analysis-project/blob/main/json_to_parquet_lambda.py)
- After successful run, try to preview table using athena

### Step 7:

- Join the two tables created on Cleansed Layer Data i.e. under "youtube_data_analysis_cleansed" database with "category_id" and "id" and also partition by keys "region" and "category_id"
- Use Glue Visual ETL for this purpose
- Store this new joined and partitoned data in parquet format to Curated Layer (e.g. in this case s3://youtube-data-analysis-analytics-us-east-1-eng/)
- Catalog the table into new database e.g. table "youtube_data_analysis.youtube_analysis"

### Step 8:

- Create Visualisation using AWS QuickSight
- Connect to AWS QuickSight and create DataSet connection with Athena connection
- Give suffiecient s3 access to QuickSight
- Create Visuals and Publish Dashboard

#### Reference: https://github.com/darshilparmar/dataengineering-youtube-analysis-project
