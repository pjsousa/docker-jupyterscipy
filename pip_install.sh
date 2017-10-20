#!/bin/bash

source /usr/local/bin/virtualenvwrapper.sh

workon cv

pip install \
  pandas pandas-datareader\
  matplotlib seaborn plotly\
  scikit-learn scikit-image scipy\
  jupyter\
  h5py\
  tensorflow theano keras\
  numpy pymongo bcolz pymongo tqdm tables nltk\
  requests statsmodels pymc=2.3.6

