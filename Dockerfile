# In progress. A docker container to mount a directory of bag files and compile one of them to pdf.
#
# Usage:
# > docker build -t bagnotation .
# > docker run -it -v $(pwd):/pdfs/ bagnotation path/to/file.bag
#

FROM swift:6.0

RUN apt-get update && apt-get install -y make gcc ghostscript
RUN mkdir /src_abc/
RUN git clone https://github.com/p3l6/abcm2ps.git /src_abc/abcm2ps

RUN cd /src_abc/abcm2ps && ./configure && make

ADD . /src/

RUN (cd /src/ && swift build)

RUN cp /src/$(swift build --show-bin-path -c debug)/bag /bin/bag
RUN cp /src_abc/abcm2ps/abcm2ps /bin/abcm2ps

COPY <<"EOF" /bin/make_pdf.sh
#! /bin/bash

FILE=$1
FILE_NO_EXT="${FILE%.*}"

/bin/bag abc "$FILE" --out "$FILE_NO_EXT.abc"
/bin/abcm2ps -p "$FILE_NO_EXT.abc" -O "$FILE_NO_EXT.ps"
ps2pdf "$FILE_NO_EXT.ps" "$FILE_NO_EXT.pdf"

rm "$FILE_NO_EXT.abc" "$FILE_NO_EXT.ps"
EOF

RUN chmod +x /bin/make_pdf.sh

RUN mkdir /pdfs/
WORKDIR /pdfs/

ENTRYPOINT ["/bin/make_pdf.sh"]
