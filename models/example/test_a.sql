
{% set schema = {
    "source": "DATA_SAMPLE",
    "short_table_name" : "PIZZA_CUSTOMERS",
    "table_name":"HACKATHON.DATA_SAMPLE.PIZZA_CUSTOMERS", 
    "primary_key": ["ID", "SEX"], 
    "rows": [
        {"name": "ID", "type":"INT"}, 
        {"name": "CUSTOMER_STATUS", "type":"VARCHAR(16)", "filter": 0.01},
        {"name": "CUSTOMER_TYPE", "type":"VARCHAR(16)", "filter": 0.01},
        {"name": "CUSTOMER_CREATED", "type":"TIMESTAMP", "filter": 0.01},
        {"name": "FIRST_NAME_HASH", "type":"INT", "filter": 0.01},
        {"name": "SEX", "type":"VARCHAR(2)", "filter": 0.01},
        {"name": "RECENCY_DAYS", "type":"INT", "filter": 0.01},
        {"name": "TOTAL_ORDERED_AMOUNT", "type": "INT", "filter": 0.01},
    ]
} %}

{{ generate_l1(schema) }}