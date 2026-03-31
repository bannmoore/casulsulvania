# Casulsulvania Infrastructure

## Dependencies

- [Docker Desktop](https://docs.docker.com/desktop/)

## Quick Start

```sh
# casulsulvania-infra
brew bundle

./bin/local/db_up.sh
./bin/local/app_up.sh

# casulsulvania-db
brew bundle

./bin/migrate.sh
```

## Deploy

### Prerequisites

This Terraform configuration expects the following resources to already exist:

- A container app registry called "bam"
- An API token
- A Digital Ocean Spaces Access Key

### Deployment

#### Deploy NextJS app by publishing new Docker image

```sh
./bin/deploy/app.sh
```

#### Deploy DigitalOcean infrastructure

Before deploying, be sure to copy `terraform.tfvars.template` to `terraform.tfvars` in the same directory, and fill out the sensitive values.

```sh
./bin/terraform.sh login

./bin/terraform.sh plan
./bin/deploy/infra.sh

# ONLY DO THIS IF YOU WANT TO BLOW EVERYTHING UP
./bin/terraform.sh destroy
```

#### (First Time) Set up Jump Server

**Heads up**: This assumes you're running these steps in the applied terraform workspace, with outputs available.

```sh
./bin/jump/connect.sh

# On jump server, generate ssh key.
ssh-keygen -t rsa -C "<EMAIL>"
cat ~/.ssh/id_rsa.pub
# (copy the public key and add it to GitHub)

# Clone database repo
cd /mnt/cas_jump_server_volume
git clone --no-checkout https://github.com/bannmoore/casulsulvania
cd casulsulvania
git sparse-checkout init --cone
git sparse-checkout set db
cd db

# Run migrations
source ../../.env
./bin/jump_setup.sh
./bin/migrate.sh
```

To run new migrations:

```sh
./bin/jump/connect.sh

cd /mnt/cas_jump_server_volume/casulsulvania/db
git pull
source ../../.env
./bin/migrate.sh
```

### Dump Remote Database

This will produce a local `.dump` file, which can be restored locally.

```sh
./bin/jump/connect_and_dump.sh
```

To restore a dump file present on the server:

```sh
cd /mnt/cas_jump_server_volume
source .env
psql "$DATABASE_URL" < cas_db.dump
```

## Gotchas

### ./bin/deploy/app.sh fails: Error: Unable to use supplied token to access API: GET https://cloud.digitalocean.com/v1/oauth/token/info: 401 (request "###") Unable to authenticate you

```sh
doctl auth init --access-token $DO_TOKEN
```

### DigitalOcean expects the amd64 platform

If the published image is built on the arm64 platform, it won't work on Digital Ocean. Check it like so:

```sh
docker image ls | grep bam
docker inspect <IMAGE_ID> --format '{{.Architecture}}'
```

This _should_ print out amd64. If not, the image needs to be rebuilt with the `--platform=linux/amd64` flag.

### Can not delete default VPCs

If your digitalocean_vpc resource is the first one for a region, it will automatically become the default. In order to run terraform destroy, create another one via the console and set it to default.

## Gratitude to these Resources

- https://tonitalksdev.com/deploying-clojure-like-a-seasoned-hobbyist
- https://slugs.do-api.dev/
- https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-registry/#:~:text=Even%20though%20they're%20related,your%20images%20based%20on%20projects
- https://docs.digitalocean.com/products/volumes/how-to/mount/
- https://docs.digitalocean.com/products/spaces/how-to/use-aws-sdks/
