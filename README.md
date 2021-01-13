# DEMO 

## Requirements
* ansible>=2.10 in your `PATH`
* vagrant>=2.2

## Confituration
* for changing Docker Swarm nodes count change `SWARM_SIZE` in `Vagrantfile`
* for changing Mongodb shards instances count change `MONGODB_SHARD_COUNT` in `Vagrantfile`

## Instruction
* run `vagrant up`

## TODO
* move `SWARM_SIZE` && `MONGODB_SHARD_COUNT` to config file
* docker swarm tests 
* advanced mongodb cluster tests