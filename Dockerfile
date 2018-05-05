FROM postgres:10

RUN mkdir /script && mkdir /output
RUN chown postgres /output 
COPY pgdump.sh /script/pgdump
RUN chmod +x /script/pgdump

ENTRYPOINT "/script/pgdump"
