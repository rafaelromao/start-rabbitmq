FROM rabbitmq:management
MAINTAINER Rafael Romão
# Change the commands below to configure rabbitmq users the way you want
CMD rabbitmq-server -detached ; \
    sleep 10 ; \  
	rabbitmqctl add_user rstests rstests ; \ 
	rabbitmqctl set_user_tags rstests management ; \ 
	rabbitmqctl set_permissions -p / rstests ".*" ".*" ".*" ; \
	rabbitmqctl stop ; \
	sleep 5 ; \  
	rabbitmq-server