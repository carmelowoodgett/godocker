FROM golang

ARG app_env
ENV APP_ENV $app_env

# Remember to update project name (godocker) as applicable
COPY ./app /go/src/github.com/mello151/godocker/app
WORKDIR /go/src/github.com/mello151/godocker/app

# Install depedencies
RUN go get ./

# Build the app
RUN go build

CMD if [ ${APP_ENV} = production ]; \
    then \
    app; \
    else \
    go get github.com/pilu/fresh && \
    fresh; \
    fi

EXPOSE 8080