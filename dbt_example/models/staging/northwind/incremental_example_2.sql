{{
    config(
        materialized='incremental',
        unique_key='id_pedido' -- chave única para identificar registros duplicados
    )
}}

WITH atualizacoes AS (
    SELECT
        id_pedido,
        data_criacao,
        data_entrega,
        valor
    FROM pedidos
    {% if is_incremental() %}
        WHERE data_criacao >= (SELECT MAX(data_criacao) FROM {{ this }})
    {% endif %}
)

SELECT *
FROM atualizacoes