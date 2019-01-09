# OctoSearch

Search Github repositories

## How to Install

Project uses `docker-compose` so if you already have Docker, follow the below instructions.

- Clone the project
- Copy `.env.sample` to `.env.dev`
- Run `make setup` which will build the Docker image and install gems
- Run `make up` which will run the web server in docker image.

Visit `localhost:3000`

For running tests, run `make test`.
