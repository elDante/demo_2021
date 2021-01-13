version: '3.8'
services:
    {% for i in range(mongodb_shard_count) -%}
    mongodb-shard{{ i }}:
        image: 'bitnami/mongodb-sharded:4.4'
        environment:
        - MONGODB_ADVERTISED_HOSTNAME=mongodb-shard{{ i }}
        - MONGODB_SHARDING_MODE=shardsvr
        - MONGODB_MONGOS_HOST=mongodb-router
        - MONGODB_ROOT_PASSWORD={{ mongodb_root_password }}
        - MONGODB_REPLICA_SET_MODE=primary
        - MONGODB_REPLICA_SET_KEY={{ mongodb_replica_key }}
        - MONGODB_REPLICA_SET_NAME=shard{{ i }}
        volumes:
        - 'shard{{ i }}_data:/bitnami'
    {% endfor %}

volumes:
    {% for i in range(mongodb_shard_count) -%}
    shard{{ i }}_data:
        driver: local
    {% endfor -%}