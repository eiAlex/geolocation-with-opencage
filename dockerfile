FROM jupyter/datascience-notebook

RUN python --version

RUN conda install --quiet --yes -c \
    conda-forge osmnx dask

COPY requirements.txt ./requirements.txt 
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt



ADD fonts /usr/share/fonts/truetype/

ADD scripts /opt/scripts/
#RUN chmod 777 /opt/scripts/ 

RUN fc-cache
RUN fc-list

VOLUME /notebooks
WORKDIR /notebooks