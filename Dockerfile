FROM scratch
COPY demo_app1 /
ENTRYPOINT [ "/demo_app1" ]