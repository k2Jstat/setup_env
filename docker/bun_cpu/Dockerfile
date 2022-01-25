FROM  gcr.io/kaggle-images/python:latest

WORKDIR /
RUN mkdir /work
WORKDIR /work

# ライブラリの追加インストール
RUN pip install -U pip
RUN pip install fastprogress japanize-matplotlib lckr-jupyterlab-variableinspector
RUN pip install Janome 
#RUN pip install cabocha-python 
RUN pip install neologdn 
RUN pip install fairlearn 
RUN pip install fugashi 
RUN pip install ipadic
RUN pip install cvxpy 
RUN pip install mecab-python3
RUN pip install dtreeviz
RUN pip install pyocr
RUN pip install pytesseract
RUN pip install pdf2image
RUN pip install mlflow
RUN pip install darts
Run pip install staticmap
RUN pip install dash
RUN pip install pytorch-tabnet
#RUN pip install causalml
RUN pip install yolov5
RUN pip install msoffcrypto-tool


RUN git clone https://github.com/DeNA/HandyRL.git
RUN cd HandyRL
RUN pip install -r requirements.txt

#RUN jupyter labextension install jupyterlab-plotly



