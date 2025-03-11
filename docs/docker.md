# docker

https://www.docker.com/get-started/

Установили docker, у vscode установили расширения

- Docker
- Dev Containers

На рабочем столе создали папку Project, внутри папки добавили 2 файла

- Dockerfile

```
FROM python:3.12-alpine
ENV PYTHONUNBUFFERED=1
WORKDIR /python-app
COPY . .
CMD [ "python", "project.py" ]
```

- project.py

```python
import time

total = 5
count = 0
while count < total:
    count += 1
    print("Line: ", count)
    time.sleep(0.4)
```

Построили образ (image) с помощью команды 

`docker build . -t myapp:0.2`

Создали контейнер из образа

`docker run --name myprog -it myapp:0.2`

Запустили уже существующий контейнер, который только что создали

`docker start -i myprog`

