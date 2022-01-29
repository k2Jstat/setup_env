FROM  gcr.io/kaggle-images/python:latest

WORKDIR /
RUN mkdir /work
WORKDIR /work

# ライブラリの追加インストール
RUN pip install -U pip
RUN pip install fastprogress japanize-matplotlib lckr-jupyterlab-variableinspector
RUN pip install fairlearn 
RUN pip install cvxpy 
RUN pip install pdf2image
RUN pip install mlflow
RUN pip install PuLP
RUN pip install staticmap
RUN pip install dash
RUN pip install pytorch-tabnet
#RUN pip install causalml
RUN pip install yolov5
RUN pip install msoffcrypto-tool
RUN pip install openpyxl
RUN pip install psycopg2
RUN pip install darts
RUN pip install pykalman
RUN pip install dowhy
RUN pip install causalnex
RUN pip install pgmpy
RUN pip install lingam
RUN pip install pyvis
RUN pip install dtreeviz

RUN apt -y install graphviz graphviz-dev
RUN pip install pygraphviz

#fugashi
RUN pip install fugashi 
RUN pip install fugashi[unidic]
RUN python -m unidic download

RUN pip install sudachipy
RUN pip install sudachidict_core
RUN pip install mecab-python3
RUN pip install ipadic
RUN pip install unidic-lite 
RUN pip install neologdn 
RUN pip install Janome
#RUN pip install cabocha-python 
RUN pip install pyLDAvis
RUN pip install scattertext
RUN pip install ginza

#RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
#    cd mecab-unidic-neologd && \
#    ./bin/install-mecab-unidic-neologd -n
#RUN yes yes | mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -a

#重いからやめておく
#RUN apt -y install mecab libmecab-dev file
#RUN git clone --depth 1 https://github.com/neologd/mecab-unidic-neologd.git && \
#    echo yes | mecab-unidic-neologd/bin/install-mecab-unidic-neologd -n

RUN pip install dlib

#transformers
RUN mkdir /model
WORKDIR /work/model
RUN python -c \
"from transformers import BertJapaneseTokenizer; \
tokenizer = BertJapaneseTokenizer.from_pretrained('cl-tohoku/bert-base-japanese-v2'); \
dir_name = 'bert_base_japanese_v2'; \
tokenizer.save_pretrained(dir_name) "

WORKDIR /work

RUN git clone https://github.com/DeNA/HandyRL.git
WORKDIR /work/HandyRL
RUN pip install -r requirements.txt

RUN pip install dgl -f https://data.dgl.ai/wheels/repo.html

RUN apt -y install poppler-utils
RUN apt -y install tesseract-ocr tesseract-ocr-jpn libtesseract-dev libleptonica-dev tesseract-ocr-script-jpan tesseract-ocr-script-jpan-vert 

RUN pip install JLDracula
RUN jupyter labextension install jupyterlab-plotly
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget

WORKDIR /work
RUN jupyter lab build






