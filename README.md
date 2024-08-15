# zephyrdocker
Example how to build a freestanding Zephyr app with a Docker container.

First clone the repository, create the Docker container, run it, and start a bash shell:

```
git clone https://github.com/FrankBuss/zephyrdocker
cd zephyrdocker
docker pull zephyrprojectrtos/zephyr-build:latest
docker run -it --rm -u $(id -u):$(id -g) -v $(pwd)/workdir:/workdir -w /workdir zephyrprojectrtos/zephyr-build /bin/bash
```

This mounts the workdir from the host as "/workdir" in the container, and also sets it as the current workdir.

Now from within the container, run the build script:

```
./build_script.sh
```

Note, this is the freestanding configuration, as explained [here](https://docs.zephyrproject.org/latest/develop/application/index.html#zephyr-freestanding-app). This is fine for a Docker container, but I think a [Zeohyr workspace application](https://docs.zephyrproject.org/latest/develop/application/index.html#zephyr-workspace-app) is better, if you also develop natively on your host, because you don't need to set the $ZEPHYR_BASE environment variable, and you can have multiple instances and Zephyr versions for multiple projects.

For CI etc. it might be also better to create a Dockerfile, with "RUN" statements for the build_script.sh steps, and referencing the right Docker hub entry. And you can create your own west.yml file, with a "name-blocklist" section to remove all libs which are not used for your project, to make "west update" faster and require less downloads. 
