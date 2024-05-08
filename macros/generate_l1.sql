
{% macro generate_l1(schema_l0) %}
    {% set schema = schema_l0 %}

    {% set primary_key_name = schema["source"] + "_" + schema["short_table_name"] + "_id"%}

    
SELECT {{primary_key_name}} 
from (
    SELECT 
    {% if(schema["primary_key"]|length == 0) %}
        {{ "NEWID()"}}
    {% elif(schema["primary_key"]|length == 1) %}
        {{schema["primary_key"][0] }}
    {% else %}
        CONCAT(
        {% for k in schema["primary_key"] %}
            {{ k }},
        {% endfor %}
        )
    {% endif %}
    
     as {{primary_key_name}},
     ... 

    from {{schema["table_name"]}}
)

{% endmacro %}