version: '3.8'
services:
    mongodb-router:
        image: 'bitnami/mongodb-sharded:4.4'
        ports:
        - "27017:27017"
        environment:
        - MONGODB_ADVERTISED_HOSTNAME=mongodb-router
        - MONGODB_SHARDING_MODE=mongos
        - MONGODB_CFG_PRIMARY_HOST=mongodb-cfg
        - MONGODB_CFG_REPLICA_SET_NAME={{ mongodb_replica_set }}
        - MONGODB_REPLICA_SET_KEY={{ mongodb_replica_key }}
        - MONGODB_ROOT_PASSWORD={{ mongodb_root_password }}