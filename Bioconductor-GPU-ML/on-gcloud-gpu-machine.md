# Shell commands within the Gcloud GPU VM
 
- Login

```
gcloud compute ssh test-gpu-scratch --zone=us-central1-a --project=ldmbio
```

- VM requires NVidia GPU to be installed: (y)

```
This VM requires Nvidia drivers to function correctly.   Installation takes ~1 minute.
Would you like to install the Nvidia driver? [y/n] y
```

- Install docker (required) and NVidia Docker (comes with it)

```
wget -O - -q 'https://gist.githubusercontent.com/allenday/c875eaf21a2b416f6478c0a48e428f6a/raw/f7feca1acc1a992afa84f347394fd7e4bfac2599/install-docker-ce.sh' | sudo bash
```

- Verify GPU is visible from Docker container

```
nvidia-docker-plugin &
```

Should see an output like this

```
nvidia-docker-plugin | 2022/04/01 13:29:27 Loading NVIDIA unified memory
nvidia-docker-plugin | 2022/04/01 13:29:28 Loading NVIDIA management library
nvidia-docker-plugin | 2022/04/01 13:29:29 Discovering GPU devices
nvidia-docker-plugin | 2022/04/01 13:29:30 Provisioning volumes at /var/lib/nvidia-docker/volumes
nvidia-docker-plugin | 2022/04/01 13:29:30 Serving plugin API at /run/docker/plugins
nvidia-docker-plugin | 2022/04/01 13:29:30 Serving remote API at localhost:3476
```

- Pull Bioconductor ML image

```
sudo  docker pull nitesh1989/bioconductor_ml:devel
```

- Run image

```
 sudo docker run --gpus all --rm -ti nitesh1989/bioconductor_ml:devel bash
 ```
 
## Within the Docker image

 
- Start with creating a new python environment

```

## Check pyenv installation
pyenv --version

## List python versions 
pyenv install --list

## Create a virtual env
pyenv virtualenv vaexprs

## activate the virtual env
pyenv local vaexprs

## Install deep learning libraries
pip3 install keras tensorflow

```

- Within R install VAExprs

```
BiocManager::install(c('SC3', 'VAExprs'))
```

- Set virtual env

```
reticulate::use_virtualenv('.pyenv/versions/vaexprs/vaexprs/')

keras::is_keras_available() & reticulate::py_available()
```
