# totally based on wrdalib docker
# had a problem with docker-compose running from the provided images
# due to the fact that it was setting user rights and other things
FROM centos:7

USER root

# Update und install needed system dependencies
RUN yum update -y && \
    yum install -y mesa-libGL mesa-dri-drivers qt5-qtbase-gui Xvfb xterm && \
    yum clean -y all

# Install su-exec from github-repo
RUN buildDeps="gcc \
               unzip \
               make" && \
    yum install -y ${buildDeps} && \
    DIR=$(mktemp -d) && cd ${DIR} && \
    curl -LO https://github.com/ncopa/su-exec/archive/master.zip && \
    unzip master.zip && cd su-exec-master && \
    make && \
    cp su-exec /usr/local/bin/su-exec && \
    cd / && \
    rm -rf ${DIR} && \
    yum history -y undo last && \
    yum clean all && \
    rm -rf /var/lib/yum/*

# Configure environment
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# Configure Miniconda3
ENV MINICONDA_VER 4.6.9
ENV MINICONDA Miniconda3-$MINICONDA_VER.rc1-Linux-x86_64.sh
# ENV MINICONDA_URL https://repo.continuum.io/miniconda/$MINICONDA
ENV MINICONDA_URL https://repo.anaconda.com/pkgs/misc/previews/miniconda/$MINICONDA_VER/$MINICONDA
ENV MINICONDA_MD5_SUM 121f634fe7b3cf00ede8abf6c1f21b9f

# Install Miniconda3
RUN buildDeps="bzip2" && \
    yum install -y ${buildDeps} && \
    curl -LO $MINICONDA_URL && \
    /bin/bash $MINICONDA -f -b -p $CONDA_DIR && \
    echo "$MINICONDA_MD5_SUM  $MINICONDA" | md5sum -c && \
    rm $MINICONDA && \
    yum history -y undo last && \
    yum clean all && \
    rm -rf /var/lib/yum/* && \
    conda config --set show_channel_urls True && \
    conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda update --all --yes && \
    conda clean -tipy


# Install wradlib + runtime dependencies
RUN conda create --yes -n wradlib \
    python=3.7 \
    wradlib=1* \
    gdal \
    numpy \
    scipy \
    matplotlib \
    netcdf4 \
    h5py \
    xarray \
    cartopy \
    xmltodict \
    semver \
    deprecation && \
    conda clean -tipy

# Install jupyter and dependencies
RUN source activate wradlib && \
    conda install --yes notebook \
    ipyparallel \
    jupyter && \
    conda clean -tipy

RUN source activate wradlib && \
    conda install --yes sphinx \
    sphinx_rtd_theme \
    sphinxcontrib-bibtex \
    pandoc \
    nbconvert \
    nbsphinx \
    flake8 \
    coverage \
    codecov \
    pytest \
    pytest-cov \
    pytest-xdist \
    pytest-sugar \
    git \
    unzip && \
    conda clean -tipy

WORKDIR /root

COPY ./data ./data
COPY ./src ./src
COPY ./out ./out
# RUN source activate wradlib

CMD ["tail", "-f", "/dev/null"]