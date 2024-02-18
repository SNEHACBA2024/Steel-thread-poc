import snowflake.snowpark.functions as F
import datetime


def model(dbt, session):
    df = dbt.ref("customer")
    year = datetime.datetime.today().year
    df1=df.select("c_birth_country","c_birth_year")
    df2=df1.withColumn("current_age",F.year(F.current_timestamp())-F.col("c_birth_year"))
 
    return df2