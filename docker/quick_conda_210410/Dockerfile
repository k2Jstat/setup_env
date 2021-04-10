FROM ubuntu:18.04 

# update
RUN apt-get -y update
RUN apt-get install -y sudo wget vim htop curl cmake make git 
# libgl1-mesa-dev

# install miniconda 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh

# make work_env
RUN ~/miniconda3/bin/conda init bash
RUN source -y ~/.bashrc

RUN conda create -y -n "workenv" python=3.8
RUN conda activate -y workenv
RUN conda update -y -n base -c defaults conda

# install other library #############################################################
RUN conda install -y pandas lightgbm statsmodels matplotlib jupyterlab seaborn cython
RUN conda install -y -c conda-forge imbalanced-learn mlxtend pyarrow optuna
#RUN opencv　pycaret  

#RUN conda install -c conda-forge opencv 

#pytoch
RUN conda install pytorch torchvision torchaudio cpuonly -c pytorch

#RUN reboot
WORKDIR /
RUN mkdir /work
ENV PATH /work:$PATH


# execute jupyterlab as a default command
CMD ["jupyter", "lab","--port","9999","--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]


