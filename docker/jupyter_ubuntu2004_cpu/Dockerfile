FROM ubuntu:20.04

#分析環境の設定
ARG env_name=py38
ARG ver_python=3.8

#シェルの設定
SHELL ["/bin/bash", "-c"]

RUN apt -y update
RUN apt install -y tzdata
RUN apt install -y sudo wget vim htop curl cmake make git 

# install miniconda 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh -O ~/Miniconda.sh
RUN bash ~/Miniconda.sh -b -p /opt/miniconda3
RUN rm -r ~/Miniconda.sh

ENV PATH /opt/miniconda3/bin:$PATH
RUN echo "export PATH=/opt/miniconda3/bin:$PATH" >> ~/.bashrc 

#環境のアップデート
RUN pip install --upgrade pip
RUN conda update -y conda
RUN conda install -y -c conda-forge mamba

#分析環境の作成
RUN conda create -y -n "${env_name}" python=${ver_python}
RUN echo "conda activate ${env_name}" >> ~/.bashrc
RUN echo "export PATH=/opt/miniconda3/envs/${env_name}/bin:$PATH" >> ~/.bashrc 
ENV PATH /opt/miniconda3/envs/${env_name}/bin:$PATH
RUN conda init bash 
RUN . ~/.bashrc

#分析環境のアクティベート
ENV CONDA_DEFAULT_ENV ${env_name}

#ライブラリのインストール
RUN pip install \
    jupyter-contrib-nbextensions \
    jupyter_nbextensions_configurator \
    lckr-jupyterlab-variableinspector \
    ipython-sql \
    jupyterlab-git \
    ipywidgets \
    jupyterlab-lsp

#plotlyの環境を作成
RUN mamba install -y -c plotly plotly jupyter-dash
RUN mamba install -y -c conda-forge nodejs gcc
RUN jupyter lab build
RUN jupyter labextension install jupyterlab-plotly

# install other library #############################################################
RUN mamba install -y -c conda-forge cython numpy scipy sympy tqdm memory_profiler 
RUN mamba install -c vpython vpython
RUN pip install Flask
#preprocessing
RUN mamba install -y -c conda-forge pandas pyarrow h5py category_encoders
#geodata
RUN mamba install -y -c conda-forge cartopy geopandas
#RUN mamba install -y -c johannr scitools
#DB
RUN mamba install -y -c conda-forge sqlalchemy psycopg2
#visualization
RUN mamba install -y -c conda-forge seaborn matplotlib dash python-graphviz pandas-profiling
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN mamba install -y -c districtdatalabs yellowbrick
RUN pip install japanize-matplotlib
#statistics
RUN mamba install -y -c conda-forge statsmodels filterpy lifelines u8darts-all
#ML
RUN mamba install -y -c conda-forge pycaret scikit-learn lightgbm xgboost ngboost imbalanced-learn mlxtend mlflow
RUN mamba install -y -c conda-forge fastcluster
#graph
RUN mamba install -y -c conda-forge networkx
RUN mamba install -y -c ankurankan pgmpy
#optimization
RUN mamba install -y -c conda-forge optuna pulp cvxpy scikit-optimize hyperopt
#bayes
RUN mamba install -y -c conda-forge pystan pymc3 prophet
#OCR
RUN mamba install -y -c conda-forge tesseract pdf2image pyocr
#image
RUN mamba install -y -c conda-forge opencv albumentations pillow scikit-image
#NLP
RUN apt install -y mecab libmecab-dev mecab-ipadic-utf8
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
    bin/install-mecab-ipadic-neologd -n -y -a && \
    rm -rf ./mecab-ipadic-neologd
RUN mamba install -y -c conda-forge nltk gensim mecab emoji
RUN mamba install -y -c huggingface transformers
RUN pip install fugashi ipadic
#sound
RUN mamba install -y -c conda-forge pyaudio
#DL
RUN mamba install -y pytorch torchvision torchaudio cpuonly -c pytorch 
RUN mamba install -y -c conda-forge tensorboard tensorboardx pytorch-lightning 
#RUN mamba install -y pyg -c pyg -c conda-forge
RUN pip install pytorch-tabnet tensorflow
#RUN pip install -qr https://raw.githubusercontent.com/ultralytics/yolov5/master/requirements.txt

#RL
#RUN git clone https://github.com/DeNA/HandyRL.git
#RUN cd HandyRL
#RUN pip install -r requirements.txt
RUN mamba install -y -c conda-forge deap
RUN pip install gym

#parallel
RUN mamba install -y -c bjrn pandarallel
RUN mamba install -y -c conda-forge joblib
RUN mamba install -y dask-core

#causal inferrence
RUN pip install tfcausalimpact 
#RUN git clone https://github.com/uber/causalml.git
#RUN cd causalml
#RUN pip install -r requirements.txt
#RUN pip install causalml
RUN pip install cdt

#libraryのアップデート
RUN mamba update -y --all

WORKDIR /
RUN mkdir /work
WORKDIR /work

RUN mamba clean -i


