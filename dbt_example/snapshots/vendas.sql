{% snapshot pedido_snapshot %}
    {{
        config(
            target_database='dbt_dw',
            target_schema='historico',
            unique_key='id_pedido',
            strategy='timestamp',
            check_cols="all"
        )
    }}
    
    SELECT 
        id_pedido,
        status,
        valor,
        data_atualizacao
    FROM pedidos

{% endsnapshot %}