FROM golang AS builder
WORKDIR /frp
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
RUN make -f Makefile.cross-compiles

FROM arm32v7/alpine
WORKDIR /
COPY --from=builder /frp/frpc_linux_arm /usr/local/bin/frpc
COPY --from=builder /frp/conf/frpc.ini /etc/frpc.ini
CMD ["frpc", "--config", "/etc/frpc.ini"]
