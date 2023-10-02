# To copy all JSON Reference data to same location to s3(open terminal in folder where you have downloaded dataset files):

aws s3 cp . s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics_reference_data/ --recursive --exclude "*" --include "*.json"

# To copy all data files to its own location i.e. by region, following pattern:

aws s3 cp CAvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=ca/
aws s3 cp DEvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=de/
aws s3 cp FRvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=fr/
aws s3 cp GBvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=gb/
aws s3 cp INvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=in/
aws s3 cp JPvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=jp/
aws s3 cp KRvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=kr/
aws s3 cp MXvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=mx/
aws s3 cp RUvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=ru/
aws s3 cp USvideos.csv s3://youtube-data-analysis-raw-us-east-1-eng/youtube/raw_statistics/region=us/