SET modulespath="%homedrive%%homepath%\Documents\WindowsPowerShell\Modules\Start-RabbitMQ"
rd /s /q %modulespath%
md %modulespath%
copy *.ps?1 %modulespath%
copy DockerFile %modulespath%