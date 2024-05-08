/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?

    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/
{% set rows = ["ID", "CUSTOMER_STATUS", "CUSTOMER_TYPE", "CUSTOMER_CREATED", "FIRST_NAME_HASH", "SEX", "CUSTOMER_EMAIL_HASH", "CUSTOMER_PHONE_HASH", "LAST_ORDER_DATE", "RECENCY_DAYS", "TRANSACTION_COUNT", "TOTAL_ORDERED_AMOUNT", "RECENCY_SCORE", "FREQUENCY_SCORE", "MONETARY_SCORE", "RFM_SCORE"] %}
{% set primary_key = ["ID"] %}
{% set foreign_keys = [] %}

{% set q = run_query('select * from HACKATHON.DATA_SAMPLE.PIZZA_ORDER_ITEMS' ) %}
{% set q2 = run_query("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_CATALOG = 'HACKATHON.DATA_SAMPLE.PIZZA_ORDER_ITEMS'" ) %}

with
    source_data as (
        
        {% for e in q2 %}
            {{ e["COLUMN_NAME"] }},
        {% endfor %}
        {{ "TNMFKODM" }}
        select {{ q|length + 3 }} as id
        union all
        select null as id

    )

select *
from source_data
where id is not null
