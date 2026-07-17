SELECT
    id_cliente,
    dbt_utils.star(from=ref('clientes'), except=["id_cliente"]) -- Seleciona todas las columnas excepto id_cliente
FROM {{ ref('clientes') }}