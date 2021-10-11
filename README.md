# AlphaFold_on_Summit

## Intro

Basic example of running AlphaFold on Summit, utilizing the pre-built Singularity container. 

The primary thing being provided here is the container. A common issue for users is the the inability to build containers targeting Summit, themselves, due to the ppcle64 architecture of Summit. 

Most users do not have proper access to a system in which they can build for this architecture. We also do not currently enable users to build containers on Summit, directly, BUT we do provide the Singularity runtime. Therefore, we have decided to provide this AlphaFold container to users, as a pre-built container.

It is worth noting that the container we provide ONLY has the ML/DL portions of AlphaFold. Many of the other components are reliant on x86 architecture. In other words, not all pacakges are in the container for a full AlphaFold application run. 

Outline of what you can find here:

* Singularity container with ML/DL portions of AlphaFold (where to get it on the filesystem)
* Tweaked run_alphafold.py (essentially comments out alphafold.data and alphafold.relax portions, leaving the model portion)
* Example application run

Thank you to [Dr. Mu Gao](https://biosciences.gatech.edu/people/mu_gao) for his outstanding assistance, enabling us to share these basic examples. 

## Where to get the container

* `/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold1103.sif` 
* You may copy it to your directory or use it from the above location

NOTE: It was built on top of the cuda-ppc64le:11.0.3-cudnn8-devel-ubuntu18.04 base container.

## 
