{{
    config(
        materialized='incremental'
    )
}}

SELECT
    id_pedido,
    data_criacao,
    data_entrega,
    valor
FROM pedidos
WHERE
{% if is_incremental() %}
    AND data_criacao >= (SELECT MAX(data_criacao) FROM {{ this }})
{% endif %}