# Environment configuration for Bohrdatenmanagementsystem (BDMS)

## Setup Environment

- SSH into DEV, TEST or PROD environment, configure Git and clone the source repository containing the configuration files for the environment. Use a [personal access token](https://github.com/settings/tokens) (PAT) to authenticate with the Git repository.

```bash
# Switch to the pre-configured application user
~$ sudo -u bdms bash
~$ cd $HOME

# Clone source repository
~$ git clone https://[$GIT_USERNAME]:[$GIT_PAT]@github.com/geoadmin/config-bdms.git
~$ cd config-bdms
```

- Use the [.env](./.env.template) template file to configure environment by copying the contents of the file into a new _.env_ file.

```bash
~$ cp .env.template .env
```

- Spin up the Docker containers in detached mode.

```bash
~$ docker-compose up -d
```

## Automatic Updates for Docker Containers

Docker containers automatically get updated with [Watchtower](https://containrrr.dev/watchtower/). If a new image gets pushed to the registry Watchtower will automatically spin up a new container with the same options that were used when it was deployed initially. Refer to the [docker-compose.yml](./docker-compose.yml) for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
