#!/bin/bash

if [ "$1" = "--help" ] ; then
  echo "Usage: ./c2d.sh <notebook>"
  echo "where <notebook> is the name of the Jupyter notebook that you wish to"
  echo "run in a local Jupyterlab instance via Docker. The resultant tar archive"
  echo "will be created as <notebook>.tar in this directory."
  exit 0
fi

if [ -z "$1" ] && [ -z "$2" ]; then
  echo "Error - please execute './c2d.sh --help' for usage info." 
  exit 1
fi

conda env export > environment.yml

nb_name=$1
nb_name=${nb_name%".ipynb"}
sed '2i\'"ARG nb_name=${nb_name}.ipynb" Dockerfile.base > Dockerfile

env_name=($(head -n 1 environment.yml))
env_name=${env_name[1]}
sed -i '27i\'"ENV env_name=${env_name}" Dockerfile

tar -cf ${nb_name}.tar Dockerfile environment.yml ${nb_name}.ipynb
rm Dockerfile environment.yml

