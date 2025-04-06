# psql

docker pull postgers:17-alpine

docker network create dbnet

docker network ls

docker run -d --rm --name psgr --network dbnet -e POSTGRES_DB=mydata -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=1234 -v postgres-data:/var/lib/postgresql/data postgres:17-alpine

docker exec -it psgr psql -U postgres

SELECT * FROM pg_user

\q

docker pull adminer

docker run --rm -d --network dbnet --link psqr:db -p 8080:8080 adminer

На рабочем столе создаём папку Project

Внутри неё создаём файл Dockerfile

```
FROM python:3.12-slim
RUN groupadd -r groupflask && useradd -r -g groupflask userflask

RUN pip install --upgrade pip
RUN pip install flask psycopg2-binary

EXPOSE 4000

WORKDIR /app
COPY ./flaskprj .

USER userflask
CMD ["python", "site.py"]
```

Рядом с этим файлом создаём папку flaskprj

Внутри папки создаём файл site.py

```python
from flask import Flask
import os, psycopg2

app = Flask(__name__)

@app.route("/")
def index():
    conn = psycopg2.connect(dbname='mydata', user='postgres',password='1234',host='dbps')
    cursor = conn.cursor()

    cursor.execute('SELECT * FROM women')
    records = cursor.fetchall()

    cursor.close()
    conn.close()

    return f'{"<p>".join(map(str,records))}'


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 4000))
    app.run(debug=True,host='0.0.0.0',port=port)
```

Возвращаемся к файлу Dockerfile и в терминале запускаем

docker build . -t flask-back


`docker run --rm --network dbnet --link psgr:dbps --name web -dp 8000:4000 -v ${PWD}/flaskprj:/app flask-back`


https://youtu.be/fdnP8i08vOk