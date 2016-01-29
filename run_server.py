from twisted.application import service, internet
from server import HTTPEchoFactory
import os

# default port in case of the env var not was properly set.
ECHO_SERVER_PORT = 8000

proxy_port = int(os.environ.get('ECHO_SERVER_PORT', ECHO_SERVER_PORT))

application = service.Application('TwistedDockerized')
factory = HTTPEchoFactory()
server = internet.TCPServer(proxy_port, factory)
server.setServiceParent(application)