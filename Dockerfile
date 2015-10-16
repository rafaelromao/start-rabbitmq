FROM rabbitmq:management
MAINTAINER Rafael Romão
# Change the commands below to configure rabbitmq users the way you want
CMD rabbitmq-server -detached ; \
    sleep 10 ; \  
	rabbitmqctl add_user dev dev ; \ 
	rabbitmqctl set_user_tags dev management ; \ 
	rabbitmqctl set_permissions -p / dev ".*" ".*" ".*" ; \
	rabbitmqctl stop ; \
	sleep 5 ; \  
	rabbitmq-server