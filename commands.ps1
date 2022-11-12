########## Building & running locally ##########
docker build -t cm-file:latest .
"Build completed. Starting container"
docker run cm-file:latest

sleep 30

docker run -v .\appsettings-mount.json:c:\app\appsettings.json cm-file:latest