{% macro print_rows(schema, fmt) %}

    {% for row in schema["rows"] %}
        {% if (schema["primary_key"]|length != 1) or (row["name"] != schema["primary_key"][0] ) %}
            {{ fmt.format(row["name"]) }}
        {% endif %}

    {% endfor %}

{% endmacro %}


{% macro generate_l1(schema_l0) %}
    {% set schema = schema_l0 %}

    {% set primary_key_name = schema["source"] + "_" + schema["short_table_name"] + "_id"%}

    
SELECT {{primary_key_name}}, 
    {{print_rows(schema, "{0},")}} 
from (
    SELECT 

    {# generate primary key #}
    {% if(schema["primary_key"]|length == 0) %}
        {{ "UUID_STRING()"}}
    {% elif(schema["primary_key"]|length == 1) %}
        {{schema["primary_key"][0] }}
    {% else %}
        CONCAT(
        {% for k in schema["primary_key"] %}
            {{ k }} {% if k != schema["primary_key"][-1] %},{% endif %}
        {% endfor %}
        )
    {% endif %}
    as {{primary_key_name}},
    
    {# loop over the rest of values #}
    {{print_rows(schema, "{0} as {0},")}}

    from {{schema["table_name"]}}
)

{% endmacro %}