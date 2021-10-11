# AlphaFold_on_Summit

## Intro

Basic example of running AlphaFold on Summit, utilizing the pre-built Singularity container.

NOTE: This assumes you have access to the OLCF's Summit Supercomputer.

The primary thing being provided here is the container. A common issue for users is the the inability to build containers targeting Summit, themselves, due to the ppcle64 architecture of Summit. 

Most users do not have proper access to a system in which they can build for this architecture. We also do not currently enable users to build containers on Summit, directly, BUT we do provide the Singularity runtime. Therefore, we have decided to provide this AlphaFold container to users, as a pre-built container.

It is worth noting that the container we provide ONLY has the ML/DL portions of AlphaFold. Many of the other components are reliant on x86 architecture. In other words, not all pacakges are in the container for a full AlphaFold application run. These examples assume the pre-procssing phase is done already. You should bring your own data that is ready to run against the AlphaFold model. We will provide an example with some CASP14 data.

Outline of what you can find here:

* `alphafold1103.sif` : Singularity container with ML/DL portions of AlphaFold.
* `alphafold/run_alphafold_summit_dl.py` : Adjusted run_alphafold.py. Essentially comments out alphafold.data and alphafold.relax portions, leaving the model portion.
* `run_af_summit_dl.sh` : Simple wrapper to provide inputs and launch alphafold.
* `batch_submit.sh` : Job submission script example

Thank you to [Dr. Mu Gao](https://biosciences.gatech.edu/people/mu_gao) for his outstanding assistance, enabling us to share these basic examples. 

## Where to get the container

* `/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold1103.sif` 
* You may copy it to your directory or use it from the above location

NOTE: It was built on top of the `cuda-ppc64le:11.0.3-cudnn8-devel-ubuntu18.04` base container.

## Running a basic example

Our provided `batch_submit.sh` can be adjusted as needed. Within that, we provide a target list of sequences to run against (`casp14_fm.lst` in this case). In addtion, we also pass an output directory for the results. Those, in turn, get fed to the `run_af_summit_dl.sh` AlphaFold wrapper (along with some other inputs).

The data for the example can be found here: `/gpfs/alpine/stf007/world-shared/AlphaFold/`.

You can see we set these variables in the `run_af_summit_dl.sh` script:

```
fea_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/casp14
af_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold
data_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold_databases
```

You too can run against these as a test, as they are enaled for world-read. You will need to change your project allocation and the output directory in the `batch_submit.sh` script. 

Creating other datasets to run against is left up to you at this point. But, this should help you run AF against data that is ready for the ML/DL phase.
