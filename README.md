# mri-reface-docker
This repository simply holds the Dockerfile that pulls together all of the dependencies for the [mri_reface](https://www.nitrc.org/projects/mri_reface) program that replaces the face of an individual in a T1, T2 or PET Image. It currently is using v0.3 of mri_reface.

## Build/install
The simplest way to get this is to just pull the Docker image from the [Docker Hub](https://hub.docker.com/repository/docker/dmc2/mri_reface/general)
```
docker pull dmc2/mri_reface:latest
```

If you want to build a Docker image yourself, then you will first need to download and unzip mri_reface from NITRC as well as the [Matlab Compile Runtime](https://ssd.mathworks.com/supportfiles/downloads/R2018a/deployment_files/R2018a/installers/glnxa64/MCR_R2018a_glnxa64_installer.zip).

## Usage
To just get the usage of the mri_reface type
```
docker run --rm dmc2/mri_reface:latest
```

To reface a T1 image called t1.nii stored in /data/in and storing the refaced image in /data/reface, use the following command: 
```
docker run --rm -v /data/in:/in -v /data/reface:/out dmc2/mri_reface:latest /in/t1.nii /out -imType T1 -saveQCRenders 0
```

Please note that only this repository (i.e. the Dockerfile) is under MIT License. It is based on an a [ANTS Docker image](https://hub.docker.com/layers/antsx/ants/v2.4.0/images/sha256-da66bbce391dcca460ecbb37c88b8f2a750566a4b4e0cd8dc66a0cfbd07afcd8?context=explore) and also pulls the code for [NiftyReg](https://github.com/KCL-BMEIS/niftyreg), so please consult their licenses as well. 

The license for mri_reface is as follows:
Copyright 2020-2021 Mayo Foundation for Medical Education and Research. This software is accepted by users "as is" and without warranties or guarantees of any kind. This software was designed to be used only for research purposes, and it is made freely available only for non-commercial research use. Contact the authors to obtain information on purchasing a separate license for commercial use. Clinical applications are not recommended, and this software has NOT been evaluated by the United States FDA for any clinical use. None of the authors or their institutions make or imply any warranty of usefulness of this software for any particular purpose, and do not assume any liability for damages, incidental or otherwise, caused by the installation or use of this software. If these conditions are not acceptable to you or your institution, or are not enforceable by the laws of your jurisdiction, you do not have the right use this software.

Licenses of included libraries:
---
Nifti_tools:
Copyright (c) 2014, Jimmy Shen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---
GetFullPath:
Copyright (c) 2016, Jan Simon
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution
* Neither the name of nor the names of its
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

---
cubeint.m:
Copyright 2016 Matthew R. Eicholtz
