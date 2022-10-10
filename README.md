# Environment configuration for [Bohrdatenmanagementsystem](https://github.com/geoadmin/suite-bdms) (BDMS)

## Configure and run Bohrdatenmanagementsystem

Clone the source repository and cd into the newly created directory

```bash
~$ git clone https://github.com/geoadmin/config-bdms.git
~$ cd config-bdms
```

Use the [dotenv](./.env.template) template file to configure environment by copying the contents of the template file into a new _.env_ file.

```bash
~$ cp ./.env.template ./.env
```

Spin up the Docker containers in detached mode.

```bash
~$ docker-compose up -d
```

## Automatic Updates for Docker Containers

Docker containers automatically get updated with [Watchtower](https://containrrr.dev/watchtower/). If a new image gets pushed to the registry Watchtower will automatically spin up a new container with the same options that were used when it was deployed initially. Refer to the [docker-compose.yml](./docker-compose.yml) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
