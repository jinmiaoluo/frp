set -xe
VERSION=0.27.1.2
cat <<END > frpc-manifest-latest.yaml
image: jinmiaoluo/frpc:latest
manifests:
  -
    image: jinmiaoluo/frpc_linux_arm:${VERSION}
    platform:
      architecture: arm
      os: linux
  -
    image: jinmiaoluo/frpc_linux_arm64:${VERSION}
    platform:
      architecture: arm64
      os: linux
  -
    image: jinmiaoluo/frpc_linux_amd64:${VERSION}
    platform:
      architecture: amd64
      os: linux
  -
    image: jinmiaoluo/frpc_linux_386:${VERSION}
    platform:
      architecture: 386
      os: linux
END

cat <<END > frpc-manifest-${VERSION}.yaml
image: jinmiaoluo/frpc:${VERSION}
manifests:
  -
    image: jinmiaoluo/frpc_linux_arm:${VERSION}
    platform:
      architecture: arm
      os: linux
  -
    image: jinmiaoluo/frpc_linux_arm64:${VERSION}
    platform:
      architecture: arm64
      os: linux
  -
    image: jinmiaoluo/frpc_linux_amd64:${VERSION}
    platform:
      architecture: amd64
      os: linux
  -
    image: jinmiaoluo/frpc_linux_386:${VERSION}
    platform:
      architecture: 386
      os: linux
END

cat <<END > frps-manifest-latest.yaml
image: jinmiaoluo/frps:latest
manifests:
  -
    image: jinmiaoluo/frps_linux_arm:${VERSION}
    platform:
      architecture: arm
      os: linux
  -
    image: jinmiaoluo/frps_linux_arm64:${VERSION}
    platform:
      architecture: arm64
      os: linux
  -
    image: jinmiaoluo/frps_linux_amd64:${VERSION}
    platform:
      architecture: amd64
      os: linux
  -
    image: jinmiaoluo/frps_linux_386:${VERSION}
    platform:
      architecture: 386
      os: linux
END

cat <<END > frps-manifest-${VERSION}.yaml
image: jinmiaoluo/frps:${VERSION}
manifests:
  -
    image: jinmiaoluo/frps_linux_arm:${VERSION}
    platform:
      architecture: arm
      os: linux
  -
    image: jinmiaoluo/frps_linux_arm64:${VERSION}
    platform:
      architecture: arm64
      os: linux
  -
    image: jinmiaoluo/frps_linux_amd64:${VERSION}
    platform:
      architecture: amd64
      os: linux
  -
    image: jinmiaoluo/frps_linux_386:${VERSION}
    platform:
      architecture: 386
      os: linux
END

manifest-tool push from-spec frpc-manifest-latest.yaml
manifest-tool push from-spec frpc-manifest-${VERSION}.yaml
manifest-tool push from-spec frps-manifest-latest.yaml
manifest-tool push from-spec frps-manifest-${VERSION}.yaml

rm frpc-manifest-latest.yaml
rm frpc-manifest-${VERSION}.yaml
rm frps-manifest-latest.yaml
rm frps-manifest-${VERSION}.yaml
