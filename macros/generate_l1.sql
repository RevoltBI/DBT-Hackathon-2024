{% macro generate_l1(schema_l0) %}
    {% set schema = schema_l0 %}

    {% if(schema["primary_key"]|length == 0) %}
        GENERATING UUID
    {% elif(schema["primary_key"]|length == 1) %}
        USING EXISTING
    {% else %}
        JOINING KEYS
    {% endif %}
    END.

{% endmacro %}