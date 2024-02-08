import snowflake.snowpark.functions as F
import datetime


def model(dbt, session):
    df = dbt.ref("final")
    df1 = dbt.ref("final_py")
    df2=df.join(df1,df.col("city")== df1.col("C_BIRTH_COUNTRY"))

    return df2