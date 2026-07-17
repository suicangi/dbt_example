-- query comum

SELECT *
FROM vendas
WHERE data_venda >= '2023-01-01' -- Primeiro dia do mês atual

-- query com jinja

SELECT *
FROM vendas
WHERE data_venda >= '{{ var("data_venda") }}'

-- query com jinja2

SELECT *
FROM vendas
WHERE data_venda >= '{{ (execute_at | as_timestamp).strftime("%Y-%m-%d") }}'

-- loop com jinja

SELECT
    cliente_id,
    {% for i in range(1, 13) %}
        SUM(CASE WHEN EXTRACT(MONTH FROM data_venda) = {{ mes }} THEN valor_venda ELSE 0 END) AS valor_mes_{{ mes }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM vendas
GROUP BY cliente_id

-- condicional com jinja

SELECT *
FROM vendas
WHERE 
{% if flag_ativo == true %}
    data_venda >= CURRENT_DATE - INTERVAL
{% else %}
    data_venda IS NOT NULL
{% endif %}