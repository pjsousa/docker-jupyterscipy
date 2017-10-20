#!/bin/bash

source /usr/local/bin/virtualenvwrapper.sh

workon cv

cd $HOME/jupyterdata

jupyter notebook --allow-root

