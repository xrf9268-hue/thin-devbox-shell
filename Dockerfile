FROM debian:bookworm-slim@sha256:74d56e3931e0d5a1dd51f8c8a2466d21de84a271cd3b5a733b803aa91abf4421

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
        make \
        openssh-client \
        procps \
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
