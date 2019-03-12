FROM rocker/shiny:3.5.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  default-jre \
  default-jdk \
  lzma-dev \
  liblzma-dev \
  openssl \
  libbz2-dev \
  libicu-dev \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssl-dev \
  libcurl4-openssl-dev \
  libssh2-1-dev \
  libgeos-dev \
  unixodbc-dev \
  && R -e "source('https://bioconductor.org/biocLite.R')" \
  && install2.r --error \
    --deps TRUE \
    tidyverse \
    dplyr \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools \
    plotly \
    DT \
    readr \
    randomForest \
    forecast \
    hydroGOF \
    DataExplorer \
    xlsx \
    tictoc \
    shinyjs \
    readxl \
    quantregForest 

# not clear why selectr needs explicit re-install, see https://github.com/rocker-org/rocker-versioned/pull/63
