FROM summerwind/actions-runner:latest

# install two helper packages we need
RUN sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN sudo add-apt-repository ppa:c2d4u.team/c2d4u4.0+

RUN sudo apt-get install -y \
    r-base \
    r-base-dev \
    r-cran-tidyverse \
    r-cran-furrr \ 
    r-cran-devtools \
    r-cran-rcurl \ 
    r-cran-purrr \
    r-cran-readr \
    r-cran-validate \
    r-cran-rvest \
    r-cran-httr2 \
    r-cran-jsonlite \
    r-cran-forcats \
    r-cran-janitor \
    r-cran-knitr \ 
    r-cran-openxlsx \
    r-cran-data.table \
    r-cran-htmlwidgets \
    r-cran-promises \
    r-cran-sourcetools \
    r-cran-xtable \
    r-cran-shiny \
    r-cran-profvis \
    r-cran-miniui \
    r-cran-httpuv \
    r-cran-later \
    r-cran-pkgdown 
    
RUN sudo chmod 777 /usr/local/lib/R/site-library

RUN Rscript -e 'install.packages("pacman")'
RUN Rscript -e 'pacman::p_load(aws.s3)'


# add build script
COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx

COPY buildkitd.toml /etc/buildkitd.toml
COPY build.sh /bin/build
RUN sudo chmod +x /bin/build
