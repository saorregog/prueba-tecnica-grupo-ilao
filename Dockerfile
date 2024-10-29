# syntax=docker/dockerfile:1
FROM debian:bookworm-slim AS builder

WORKDIR /opt

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]
RUN curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

COPY ./.python-version ./pyproject.toml ./requirements* ./
RUN rye pin "$(cat .python-version)" && \
    rye sync

# Stage 2: Final stage
FROM debian:bookworm-slim AS final
COPY --from=builder /opt/rye /opt/rye

ENV PNPM_HOME="/usr/local/bin/" \
    PNPM_VERSION="9.3.0" \
    NODE_VERSION="20" \
    RYE_HOME="/opt/rye" \
    PYTHONUNBUFFERED=True
ENV PATH="$RYE_HOME/shims:$PATH"

RUN rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

RUN mkdir /code
WORKDIR /code

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_VERSION}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends sudo libmagic-dev libproj-dev libc6-dev gcc git nodejs gettext && \
    npm install --global pnpm@${PNPM_VERSION} && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man && \
    apt-get clean
