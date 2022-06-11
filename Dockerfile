FROM python:3.9-slim

# https://docs.docker.com/engine/reference/builder/#scope
# "An ARG instruction goes out of scope at the end of the build
# stage where it was defined." This means an ARG declared _before_
# FROM will be out-of-scope after FROM. Thus we declare ARG after FROM.
ARG PANGEO_FORGE_VERSION

# Install beam sdk
RUN pip install --no-cache-dir apache-beam[gcp]==2.39.0

# Install pangeo forge and additional requirements
COPY ./requirements/${PANGEO_FORGE_VERSION}.txt requirements.txt
RUN pip install -r requirements.txt

# Verify that the image does not have conflicting dependencies.
RUN pip check

# Copy files from official SDK image, including script/dependencies.
COPY --from=apache/beam_python3.9_sdk:2.39.0 /opt/apache/beam /opt/apache/beam

# Set the entrypoint to Apache Beam SDK launcher.
ENTRYPOINT ["/opt/apache/beam/boot"]