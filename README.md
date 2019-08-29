# hello-ampd

[![Build Status][badge_ci]][5]

Basic tutorial for the EPA Clean Air Markets Division to go through the process of creating a small web app, in the problem space of AMPD, with automated tests and deployment to cloud.gov.

Currently, `hello-ampd` is a very simple API backend, providing a "Hello World" style response to HTTP GET calls.

## Development

### Initial setup

#### Dependencies

- [git][1]
- [docker][2]
- [docker-compose][3]

This project uses [Docker][2] containers to provide a self-contained build and test environment, as well as to locally run the `hello-ampd` web service. These instructions assume some familiarity with the command-line (e.g., Windows Terminal under Windows 10, Terminal under macOS, etc.).

#### Clone the repository

Clone the repository and `cd` into it:

```shell
git clone https://github.com/18F/hello-ampd
cd hello-ampd
```

#### Tests

Run the initial setup and ensure that all tests pass locally:

```shell
docker-compose run --rm api make
```

### Running a local server

Start the web service:

```shell
docker-compose up --abort-on-container-exit --build
```

Log messages will be printed to the console's `stdout`.

Once the `Starting hello-ampd` debug log message appears, a web browser can be directed to `http://localhost:8080` to access the web service.

### Stopping and cleaning up the local server

`Ctrl+C` will shutdown the server, if performed in the same console window as it was started. 

Using a different console window — on the same host OS, from the `hello-ampd` project tree — the local server can be stopped and cleaned up with:
```shell
docker-compose down
```

### Adding/updating Go packages

Whenever the packages used by `hello-ampd` change, update the [Dep][4] files:

```shell
docker-compose run --rm api dep ensure -no-vendor
docker-compose build
```

Be sure to commit the `dep`-generated updates to `src/Gopkg.toml` and `src/Gopkg.lock`.


[badge_ci]: https://circleci.com/gh/18F/hello-ampd.svg?style=shield
[1]: https://git-scm.com/
[2]: https://docker.com
[3]: https://docs.docker.com/compose
[4]: https://golang.github.io/dep/
[5]: https://circleci.com/gh/18F/hello-ampd
