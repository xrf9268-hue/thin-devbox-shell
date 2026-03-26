FROM debian:bookworm-slim@sha256:f06537653ac770703bc45b4b113475bd402f451e85223f0f2837acbf89ab020a

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
        make \
        openssh-client \
        procps \
        ripgrep \
        tini \
        unzip \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 dev \
    && useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash dev \
    && mkdir -p /workspace \
    && touch /home/dev/.bash_history \
    && chown -R dev:dev /home/dev /workspace

ENV HOME=/home/dev

USER dev
WORKDIR /workspace

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["bash"]
