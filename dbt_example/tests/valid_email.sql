{% test valid_email(model, column_name) %}

WITH validation AS (
    SELECT {{ column_name }} AS email
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL
    AND {{ column_name }} NOT LIKE '%@%.%'
)

SELECT *
FROM validation

{ % endtest %}