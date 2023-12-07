FROM postgres:15-alpine
WORKDIR /java-db
COPY words.sql /docker-entrypoint-initdb.d/
RUN chmod +r /docker-entrypoint-initdb.d/words.sql
ENV POSTGRES_PASSWORD: postgres
ENV POSTGRES_URL: jdbc:postgresql://db:5432/postgres
ENV POSTGRES_USER: postgres
EXPOSE 5432
