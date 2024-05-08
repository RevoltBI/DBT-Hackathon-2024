
{% set schema = {
    "source": "DATA_SAMPLE",
    "short_table_name" : "PIZZA_ORDER_ITEMS",
    "table_name":"HACKATHON.DATA_SAMPLE.PIZZA_ORDER_ITEMS", 
    "primary_key": ["ID", "TOTAL_ORDERED_AMOUNT"], 
    "rows": [
        {"name": "ID", "type":"INT"}, 
        {"name": "TOTAL_ORDERED_AMOUNT", "type": "INT"},
        {"name": "RECENCY_DAYS", "type": "INT"},
    ]
} %}

{{ generate_l1(schema) }}