#docker pull ubuntu:18.04
FROM ubuntu:18.04 

# update
RUN apt-get -y update
RUN apt-get install -y sudo wget vim htop python3 python3-pip curl cmake make git libgl1-mesa-dev

# install other library #############################################################
RUN pip3 install -U pip
RUN pip3 install -U setuptools numpy scipy scikit-learn jupyter jupyterlab pandas statsmodels cython seaborn pyarrow \
    catboost gluonts pycaret geopandas lightgbm gensim opencv-contrib-python \
    pyocr pandas-profiling optuna kaggle signate torch torchvision torchaudio 

RUN pip3 install pyreadline

#RUN reboot
WORKDIR /
RUN mkdir /work
ENV PATH /work:$PATH
 
RUN apt clean

# execute jupyterlab as a default command
CMD ["jupyter", "lab","--port","6789","--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]