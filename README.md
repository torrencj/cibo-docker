# cibo-docker
Build and push images for https://github.com/RM-Terrell/cibo

Docker compose:
```
services:
  cibo:
    container_name: cibo
    image: image: ghcr.io/torrencj/cibo-docker:latest
    environment:
      API_KEYS_CONFIG_PATH: '/keys/api_keys.toml'
    ports:
      - '8000:8000'
    restart: unless-stopped
    volumes:
      - <path-to-api-key-file-dir>:/keys
```
