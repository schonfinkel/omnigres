The fastest way to try Omnigres out is by using
its [container image](https://github.com/omnigres/omnigres/pkgs/container/omnigres):

```shell
docker volume create omnigres
# The environment variables (`-e`) below have these set as defaults
docker run --name omnigres \
           -e POSTGRES_PASSWORD=omnigres \
           -e POSTGRES_USER=omnigres \
           -e POSTGRES_DB=omnigres \
           --mount source=omnigres,target=/var/lib/postgresql/data \
           -p 127.0.0.1:5432:5432 -p 127.0.0.1:8080:8080 -p 127.0.0.1:8081:8081 --rm ghcr.io/omnigres/omnigres-17:latest
# Now you can connect to it:
psql -h localhost -p 5432 -U omnigres omnigres # password is `omnigres`
```

You can access the HTTP server at [localhost:8081](http://localhost:8081)

??? tip "What if I need other extensions?"

    Currently, the image ships only base and Omnigres extensions and we're planning to add more
    "import" extensions pre-installed.

    We included a significant amount of extensions, currently sourced from [Pigsty](https://pigsty.io/)
    into the "extra" image: 

    ```
    ghcr.io/omnigres/omnigres-extra-17:latest
    ```

    You can also use `apt` to install more extensions by executing in the running container:

    ```shell
    docker exec -ti <container name> apt-get -y install postgresql-17-<extension name>
    ```

### Building your own image

If you can't use the pre-built image (for example, you are running a fork or made changes), you can build the image
yourself:

```shell
# Build the image
DOCKER_BUILDKIT=1 docker build . -t ghcr.io/omnigres/omnigres
```
