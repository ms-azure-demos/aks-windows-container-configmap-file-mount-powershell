# aks-windows-container-configmap-file-powershell
Demos how the file can be mounted from config map to windows container. Also shows how PowerShell can read it

# Running

## Docker run

- docker build -t config-map-file-mounting:lts-7.2-nanoserver-1809 .
- docker run config-map-file-mounting:lts-7.2-nanoserver-1809

This will be showing the below message from the file present inside the container image as no mounting happened.

*I am from Dockerfile generated image*

## Docker run with -v

Unfortunately it is not working. Below are commands
- docker run --mount type=bind,source=C:\source\repos\ms-azure-demos\aks-windows-container-configmap-file-powershell\appsettings-mount.json,target=c:\app\appsettings.json cm-file:latest
- docker run -v 'C:\source\repos\ms-azure-demos\aks-windows-container-configmap-file-powershell\appsettings-mount.json:c:\app\appsettings.json' cm-file:latest

Both the commands error out with message `source path must be a directory.`

As per some [links](https://stackoverflow.com/a/61177242/181832), this is not supported in Windows container. But it works in Kubernetes

## Kubernetes deploy

- Deploy the configMap-pod.yaml file
  - `kubectl apply -f .\configMap-pod.yaml`

Here it works. The pod logs will show the below message from the configMap-pod.yaml file, instead of the file inside the image. 

*I am from K8s config file*