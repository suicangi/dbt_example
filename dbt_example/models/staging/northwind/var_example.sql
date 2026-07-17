SELECT *
FROM vendas
WHERE data_venda >= '{{ var("data_minima"), "2024-06-01" }}'

---

{{
    config(
        schema=var("schema_nome", "desenvolvimento_schema")
    )
}}

SELECT *
FROM vendas

{{ this }}
{{ target.name }}

SELECT 
    id_pedido,
    data_venda
    '{{ this }}' AS nome_tabela,
    '{{ target.name }}' AS ambiente_atual
FROM vendas

