# Bioconductor on AnVIL GPU

## Authors

Nitesh Turaga - nitesh@ds.dfci.harvar.edu

## Introduction

Bioconductor has been recieving R packages that use an interface to run python libraries. Some of these packages use machine learning and deep learning libraries that are commonly used such as  `tensorflow`, and `keras`.

- 'TensorFlow' is an end-to-end open source platform for machine learning.

- 'Keras' is an open-source software library that provides a Python interface for artificial neural networks

Some of the Bioconductor packages that use "reticulate" to interface with are listed below

- VAExprs

- DeepPINCS

These machine learning packages run faster when using GPU based cloud environments. This workspace demonstrates the how to use the AnVIL environment to run a Bioconductor package on a GPU enabled cloud environment.


## Steps 

1. Start a GPU enabled cloud environment from the Cloud environment launcher. Select **Customize** in the menu. 
 The cloud environment should be a **R / Bioconductor** based Jupyter environment. It will have an option to **Enable GPUs**.
 
2. Choose a GPU type, and the number of GPUs. The default setting will work for this workspace. 

![env](https://raw.githubusercontent.com/nturaga/BiocGPU/master/enable-gpu-on-anvil.jpg)

3. Go to the Notebooks tab, and run the **VAExprs_Bioconductor_on_terra_GPU** notehook with the GPU Enabled cloud environment just launched. 


## More information on GPU

[GPU Support page](https://support.terra.bio/hc/en-us/articles/4403006001947)