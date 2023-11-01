docker build -t buildroot .

docker tag buildroot buildroot:latest

docker run -v %cd%:/Buildroot-NUC980/MountedBuildroot -it buildroot:latest bash

PAUSE
