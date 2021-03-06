FROM kbase/sdkbase2:latest
MAINTAINER KBase Developer
# -----------------------------------------

# pin biopython version
RUN pip install --upgrade biopython==1.70

# Copy module files to image
COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
