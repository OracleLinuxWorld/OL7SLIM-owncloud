# OL7SLIM-owncloud
Oracle Linux 7 (slim) Docker container with owncloud. This repo contains a recipe for making Docker container for OwnCloud on Oracle Linux 7. The docker file chooses httpd and sqlite for owncloud. These can easily be changed by changing what rpms get installed. This has been tested with docker 1.0.0

NOTE: Ignore the warning about webdav not being set up properly. This is because the SSL certificates aren’t set up properly.
