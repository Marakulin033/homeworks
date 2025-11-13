# Hemoglobin Analysis Docker Container

Этот проект содержит R-скрипт для анализа гемоглобина  пациентов, а также Dockerfile для воспроизводимого запуска на любом сервере с установленным Docker.

## Структура проекта

hemoglobin-analysis/
├── data/
│ └── Пациенты.xlsx # исходные данные
├── src/
│ └── HW_R2_Marakulin.R # R-скрипт анализа
├── output/ # сюда будет сохраняться результат
├── Dockerfile
└── README.md

## Шаг 1. Подготовка данных

1. Поместите ваш файл `Пациенты.xlsx` в папку `data/`.
2. Создайте пустую папку `output/` для сохранения результатов.

## Шаг 2. Сборка Docker-образа

Откройте терминал в корневой папке проекта `hemoglobin-analysis` и выполните команду:

```bash
docker build -t hemoglobin-analysis:1.0 .

## Шаг 3. Запуск контейнера
```bash
docker run --rm \
  -v "/путь/к/hemoglobin-analysis/data:/data:ro" \
  -v "/путь/к/hemoglobin-analysis/output:/output" \
  hemoglobin-analysis:1.0