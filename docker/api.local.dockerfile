ARG python
FROM python:$python
ARG db_host
ARG db_port
ARG db_name
ARG db_user
ARG db_pass

ENV DB_HOST=${db_host}
ENV DB_PORT=${db_port}
ENV DB_NAME=${db_name}
ENV DB_USERNAME=${db_user}
ENV DB_PASSWORD=${db_pass}

WORKDIR /usr/app
COPY . .

RUN apt-get -y update \
  && apt-get install -y gettext \
  # Cleanup apt cache
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

RUN apt-get install libpq-dev \
    libcairo2 \
    liblcms2-2 \
    libopenjp2-7 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libssl1.1 \
    libtiff5 \
    libwebp6 \
    libxml2


RUN pip install -r requirements.txt

RUN chmod a+x ./fixgraphene.sh
RUN ./fixgraphene.sh


EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "4", "--worker-class", "uvicorn.workers.UvicornWorker", "playground.asgi:application" ]
