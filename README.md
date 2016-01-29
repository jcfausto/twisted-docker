# twisted-docker
A basic example to deploy a Twisted application as a Docker container

# Requirements
- Python 2.7
- Docker 1.9.1 or superior
- Docker Compose 1.0.6rc2 or superior

# Dockerfile

The Dockerfile install all necessary requirements to properly run twisted in a *nix environment.

## Server Config

### Port
Just set an environment variable called **ECHO_SERVER_PORT** and define a value.

By default, the server will run at the 8000 port. 

OBS: If you use Vagrant or other VM environment, assure that the portforwarding is properly configured in order to access the server from the host machine.

# Running on Docker

```
git clone https://github.com/jcfausto/twisted-docker.git
export ECHO_SERVER_PORT=5000
cd twisted-docker/server
docker-compose up -d (it will take some time in the firsr run)
```

After the image, the container will be started. Check with:

```
docker ps
```

When the container starts, just access:

(http://192.168.99.100:5000)[http://192.168.99.100:5000] and you should see the responder from the echo server.

* Your docker IP may vary.

# Running locally

You also can run the app locally. Follow this steps:

```
git clone https://github.com/jcfausto/twisted-docker.git
cd twisted-docker
mkvirtualenv twisted-docker #using virtualenvwrapper here.
cd server
pip install -r requirements.txt
export ECHO_SERVER_PORT=5000
twistd --nodaemon --python=run_server.py
```

Access: (http://localhost:5000)[http://localhost:5000] and you should see the responder from the echo server.
