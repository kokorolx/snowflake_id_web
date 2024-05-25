# #!/bin/bash

# SERVICE_NAME=snowflake_web

# # Get the current number of replicas
# CURRENT_REPLICAS=$(docker service inspect --format "{{.Spec.Mode.Replicated.Replicas}}" $SERVICE_NAME)

# # Scale the service
# docker service scale $SERVICE_NAME=0

# # Reset the counter
# COUNTER=1

# # Scale the service with updated replica numbers
# while [ $COUNTER -le $CURRENT_REPLICAS ]; do
#   REPLICA_NUMBER=$COUNTER docker service scale $SERVICE_NAME=$COUNTER
#   let COUNTER=COUNTER+1
# done



# #!/bin/bash

# REPLICAS=$(docker service ps snowflake_web | grep desired | awk '{print $NF}')
# export REPLICAS_COUNT=$REPLICAS

# echo "Number of replicas: $REPLICAS_COUNT"