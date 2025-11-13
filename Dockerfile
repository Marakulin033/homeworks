FROM rocker/r-ver:latest
WORKDIR /usr/src/app
COPY src/ ./src/
RUN R -e "install.packages(c('readxl','data.table','dplyr','lubridate', 'ggplot2'), repos='https://cloud.r-project.org')"
RUN mkdir -p /output
VOLUME ["/output"]
CMD ["Rscript", "src/HW_R2_Marakulin.R"]
