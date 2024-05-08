
{% set schema = {
    "source": "DATA_SAMPLE",
    "short_table_name" : "PIZZA_CUSTOMERS",
    "table_name":"HACKATHON.DATA_SAMPLE.PIZZA_CUSTOMERS", 
    "primary_key": ["ID", "SEX"], 
    "rows": [
        {"name": "ID", "type":"INT"}, 
        {"name": "TOTAL_ORDERED_AMOUNT", "type": "INT"},
        {"name": "RECENCY_DAYS", "type": "INT"},
        {"name": "SEX", "type":"VARCHAR(2)", "filter": 0.8}
    ]
} %}

{{ generate_l1(schema) }}