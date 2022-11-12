########## Building & running locally ##########
docker build -t config-map-file-mounting:lts-7.2-nanoserver-1809 .
"Build completed. Starting container"
docker run config-map-file-mounting:lts-7.2-nanoserver-1809

sleep 30

docker run -v .\appsettings-mount.json:c:\app\appsettings.json config-map-file-mounting:lts-7.2-nanoserver-1809

# Replace with your registry details
docker tag config-map-file-mounting:lts-7.2-nanoserver-1809 joymon/config-map-file-mounting:lts-7.2-nanoserver-1809
docker push joymon/config-map-file-mounting:lts-7.2-nanoserver-1809