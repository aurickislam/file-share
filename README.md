# File share

This is a simple HTTP based file share application that allows users to download files. The application is built using nginx only.

## How to run the application

1. Clone the repository
2. Run the following command to start the application
```bash
docker compose up -d
```
3. Open your browser and navigate to `http://localhost:8089` or `http://<YOUR_IP>:8089`.  You will see a list of files in the shared folder. Click on the file you want to download and the file will be downloaded to your local machine.

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

## Download files using script

You can also download files using the `download.sh` script. The script is available in the `scripts` folder. The script requires `curl` to be installed on your machine. You can run the script using the following command:

```bash
./download.sh
```

Before running the script please change the `HOST_URL` variable. And also change the file path. This script creates folder of the downloaded files.

## download.sh

```shell
#!/bin/bash

HOST_URL="http://192.168.1.2:8089"

# declare a download function that takes a path as an argument
download() {
  # fetch directory path from file path
  dir=$(dirname $1)

  # create the directory if it doesn't exist
  mkdir -p $dir

  # download the file from the given path
  curl "$HOST_URL/$1" > $1
}

# call the download function with the given path
download src/file/path/file1.html
download src/file/path/file2.html

```
