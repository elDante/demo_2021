version: '3.8'
services:
    mongodb-cfg:
        image: 'bitnami/mongodb-sharded:4.4'
        environment:
        - MONGODB_ADVERTISED_HOSTNAME=mongodb-cfg
        - MONGODB_SHARDING_MODE=configsvr
        - MONGODB_ROOT_PASSWORD={{ mongodb_root_password }}
        - MONGODB_REPLICA_SET_MODE=primary
        - MONGODB_REPLICA_SET_KEY={{ mongodb_replica_key }}
        - MONGODB_REPLICA_SET_NAME={{ mongodb_replica_set }}
        volumes:
        - 'cfg_data:/bitnami'
volumes:
    cfg_data:
        driver: local