function Start-RabbitMQ() {
	# Change the 'rstests' values below to use the name you want for the container
	
	# Start Docker and Prepare Shell
	start-docker
	# Check if the image exists
	$imageExists = docker images | grep rabbitmq | grep rstests
	if ($containerId -eq $null) {
		Write-Host "Creating image..."
		docker build --rm=true -t rabbitmq:rstests $PSScriptRoot
	}
	# Check if container exists
	$existingContainerId = docker --tlsverify=false ps -a -q --filter="name=rabbitmq-rstests"
	if ($existingContainerId -eq $null) {
		# Creates and starts the container
		Write-Host "Creating and starting container..."
		docker run --name=rabbitmq-rstests -d -p 5672:5672 -p 15672:15672 rabbitmq:rstests
	} else {
		$runningContainerId = docker ps -q --filter="name=rabbitmq-rstests"
		if ($runningContainerId -ne $null) {
			# Stop the existing container
			Write-Host "Stopping container..."
			docker stop $runningContainerId
		}
		# Starts the existing container
		Write-Host "Starting container..."
		docker start $existingContainerId
	}
}