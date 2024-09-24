FROM swift:6.0

ADD . /src/

WORKDIR /src/

RUN (cd /src/ && swift build)

# > docker build -t bagnotation .
# > docker run -it bagnotation /bin/bash
# $ swift test
