{{
    config(
        pre_hook=[
            "CREATE TABLE IF NOT EXISTS temp_clientes AS SELECT * FROM clientes LIMIT 100",
            "UPDATE temp_clientes SET ativo = true WHERE ativo = 'ativo'"
        ],
        post_hook=[
            "ANALYZE temp_clientes",
            "DROP TABLE IF EXISTS temp_clientes"
        ]
    )
}}

SELECT *
FROM temp_clientes

---

{{
    config(
        post_hook=[
            "CALL sp_send_email('Processamento concluído', 'O modelo {{ this.name }} foi processado com sucesso. Modelo finalizado em {{ run_started_at }}')"
        ]
    )
}}

SELECT *
FROM vendas

---

{{
    config(
        post_hook=[
            "{% if target.name == 'prod' %} INSERT INTO log_execucoes(modelo, data_execucao, status) VALUES ('{{ this.name }}', '{{ run_started_at }}', 'concluído') {% endif %}"
        ]
    )
}}

SELECT *
FROM vendas