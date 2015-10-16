function Start-RabbitMQ($machinename, $imagetag) {
	if ($machinename -eq $null) {
		$machinename = "dev"
	}
	if ($imagetag -eq $null) {
		$imagetag = "dev"
	}
	# Start Docker and Prepare Shell
	start-docker $machinename
	# Check if the image exists
	$imageExists = docker images | grep rabbitmq | grep $imagetag
	if ($imageExists -eq $null) {
		Write-Host "Creating RabbitMQ rabbitmq-$imagetag image..."
		docker build --rm=true -t rabbitmq:$imagetag $PSScriptRoot 2> $null | Out-Null
	}
	# Check if container exists
	$existingContainerId = docker ps -a -q --filter="name=rabbitmq-$imagetag"
	if ($existingContainerId -eq $null) {
		# Creates and starts the container
		Write-Host "Creating and starting RabbitMQ rabbitmq-$imagetag container..."
		docker run --name=rabbitmq-$imagetag -d -p 5672:5672 -p 15672:15672 rabbitmq:$imagetag 2> $null | Out-Null
	} else {
		$runningContainerId = docker ps -q --filter="name=rabbitmq-$imagetag"
		if ($runningContainerId -ne $null) {
			# Stop the existing container
			Write-Host "Stopping RabbitMQ rabbitmq-$imagetag container..."
			docker stop $runningContainerId 2> $null | Out-Null
		}
		# Starts the existing container
		Write-Host "Starting RabbitMQ rabbitmq-$imagetag container..."
		docker start $existingContainerId 2> $null | Out-Null
	}
}