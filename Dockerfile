FROM golang:1.22 AS builder

WORKDIR /usr/src/app

# Author: Gabriel Cerioni - Gabs the Nerdola

# Here Ill just compile the code and ship it into an executable
COPY . .
RUN go build gabs.go

FROM scratch


COPY --from=builder /usr/src/app/gabs .

ENTRYPOINT ["./gabs"]