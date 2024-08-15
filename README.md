# File share

This is a simple file share application that allows users to download files. The application is built using nginx only.

## How to run the application

1. Clone the repository
2. Run the following command to start the application
```bash
docker compose up -d
```
3. Open your browser and navigate to `http://localhost:8089` or `http://<YOUR_IP>:8089`

## Change the folder to share

By default, the application shares the `~/Documents` folder. You can change the folder to share by updating the `docker-compose.yml` file. Update the `volumes` section of the `nginx` service to point to the folder you want to share.

```yaml
services:
  file-share-nginx:
    ...
    volumes:
      - /path/to/your/folder:/usr/share/nginx/html
    ...
```
