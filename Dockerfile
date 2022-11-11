FROM golang


# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/nader-ziada/helloworldgo

RUN go install github.com/nader-ziada/helloworldgo

RUN  /usr/bin/curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl  \
    &&  mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT /go/bin/helloworldgo

# Document that the service listens on port 8080.
EXPOSE 8080