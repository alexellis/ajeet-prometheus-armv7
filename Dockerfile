FROM armbuild/debian
MAINTAINER "Ajeet Singh Raina" <ajeetraina@gmail.com>

COPY prometheus		 /bin/prometheus
COPY promtool		 /bin/promtool
COPY console_libraries/	 /usr/share/prometheus/console_libraries/
COPY consoles/		 /usr/share/prometheus/consoles/

RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/

EXPOSE 9090
VOLUME [ "/prometheus" ]
WORKDIR /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD ["-config.file=/etc/prometheus/prometheus.yml", \
     "-storage.local.path=/prometheus", \
     "-web.console.libraries=/usr/share/prometheus/console_libraries", \
     "-web.console.templates=/usr/share/prometheus/consoles" ]