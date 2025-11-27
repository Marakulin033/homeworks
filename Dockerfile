FROM rocker/r-base:latest

RUN R -e "install.packages('dplyr', repos='https://cloud.r-project.org')"

COPY run_anti_joins.R /usr/local/bin/run_anti_joins.R
RUN chmod +x /usr/local/bin/run_anti_joins.R

ENTRYPOINT ["Rscript", "/usr/local/bin/run_anti_joins.R"]