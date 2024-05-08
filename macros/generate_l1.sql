{% macro print_rows(schema, fmt) %}
    {% for row in schema["rows"] %}
        {% set filter_threshold = row["filter"]%}
        {% if filter_threshold %}
            {% set null_count = dbt_utils.get_single_value("SELECT COUNT(*) from " + schema["table_name"] + " WHERE "+ row["name"]+ " IS NULL", 0) %}
            {% set total_count = dbt_utils.get_single_value("SELECT COUNT(*) from " + schema["table_name"], 1) %}
            {% set should_stay = ((null_count|float)/(total_count|float)) <= filter_threshold %}
        {% else %}
            {% set should_stay = True %}
        {% endif %}

        {% if ( should_stay and ((schema["primary_key"]|length != 1) or (row["name"] != schema["primary_key"][0] ))) %}
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