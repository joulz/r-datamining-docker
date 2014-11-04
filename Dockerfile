FROM ubuntu:14.10

RUN apt-get update

RUN apt-get install -y \
    r-base \
    r-recommended \
    r-cran-ggplot2 \
    r-cran-zoo \
    r-cran-rodbc \
    r-cran-xml \
    r-cran-tkrplot \
    r-cran-rsprng \
    r-cran-scales \
    r-cran-tseries \
    r-cran-sandwich \
    r-cran-lme4 \
    r-cran-robustbase \
    r-cran-gplots \
    r-cran-rjava \
    r-cran-rjson \
    r-cran-plyr \
    r-cran-testthat \
    r-cran-evaluate \
    r-cran-abind \
    r-cran-foreach \
    r-cran-domc \
    r-cran-iterators \
    r-cran-memoise \
    r-cran-numderiv \
    r-cran-mvtnorm \
    r-cran-plotrix \
    r-cran-combinat \
    r-cran-strucchange \
    r-cran-car \
    r-cran-randomforest

# Set default mirror to avoid requiring user input during automatic installs
RUN echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site

RUN Rscript -e 'install.packages(c("lubridate", "svMisc", "svTools", "RWeka", "caret"), dependencies = TRUE, quiet = TRUE)'

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
