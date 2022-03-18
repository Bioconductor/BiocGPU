# Bioconductor on AnVIL GPU

Bioconductor has been recieving R packages that use an interface to run python libraries. These packages
use machine learning and deep learning libraries that are commonly used such as `scikit-learn`, `tensorflow`, 
and `keras`.

- 'Scikit-learn' is an open source machine learning library that supports supervised and unsupervised learning. 

- 'TensorFlow' is an end-to-end open source platform for machine learning.

- 'Keras' is an open-source software library that provides a Python interface for artificial neural networks

Some of the Bioconductor packages that use "reticulate" to interface with are listed below

- VAExprs

- DeepPINCS

- BiocSklearn

This workspace demonstrates the how to use the AnVIL environment to run a Bioconductor package on a GPU based 
    
![Enable GPU on cloud environment](./enable-gpu-on-anvil)