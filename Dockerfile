FROM baileyjm02/markdown-to-pdf:latest

COPY publish.sh /publish.sh
COPY publish.css /publish.css
RUN chmod +x publish.sh

ENTRYPOINT ["/publish.sh"]
