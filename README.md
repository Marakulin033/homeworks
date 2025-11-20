
# hw9: Dockerized Data Joins

Проект выполняет INNER, LEFT, RIGHT и OUTER джоины для трёх CSV:
- input/metadata.csv
- input/ms_results.csv
- input/quality.csv

Выход:
- output/inner_join.csv
- output/left_join.csv
- output/right_join.csv
- output/outer_join.csv

## Как использовать

1. Собрать Docker-образ:
docker build -t joins-image .
2. Запустить контейнер:
docker run --rm -v $(pwd)/input:/app/input -v $(pwd)/output:/app/output joins-image
3. Проверить файлы в output/
