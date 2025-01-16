FROM debian:12-slim
LABEL org.opencontainers.image.description="Your texlab environment in a docker container."
ARG TEXLIVE_MIRROR=https://mirrors.mit.edu/CTAN/systems/texlive/tlnet/
ENV PATH="${PATH}:/root/.local/bin:/usr/local/texlive/2024/bin/x86_64-linux"

RUN <<EOS
apt-get update -y
apt-get install -uy --no-install-recommends \
        ca-certificates \
        git \
        curl \
        make \
        perl \
        python3 \
        python3-pygments
rm -rf /var/lib/apt/lists/*
EOS

WORKDIR /tmp

ADD ${TEXLIVE_MIRROR}/install-tl-unx.tar.gz ./install-tl-unx.tar.gz

RUN <<EOS
tar xzf install-tl-unx.tar.gz
perl ./install-tl-*/install-tl -v --no-interaction --scheme=minimal --no-doc-install --repository=${TEXLIVE_MIRROR}
rm -rf ./install-tl-*
EOS

RUN tlmgr install --repository=${TEXLIVE_MIRROR} \
        amscls \
        beamer \
        beamertheme-tcolorbox \
        biblatex \
        bookmark \
        booktabs \
        caption \
        carlisle \
        circuitikz \
        stix2-otf \
        collection-langfrench \
        collection-luatex \
        csquotes \
        enumitem \
        environ \
        epstopdf-pkg \
        fancyhdr \
        fancyvrb \
        float \
        fontawesome5 \
        fontspec \
        geometry \
        glossaries \
        glossaries-extra \
        hyperref \
        ifmtarg \
        infwarerr \
        kvoptions \
        latex-bin \
        mathtools \
        memoir \
        microtype \
        minted \
        mparhack \
        parskip \
        pdflscape \
        pdfpages \
        pdftexcmds \
        pgf \
        pgfplots \
        ragged2e \
        roboto \
        setspace \
        siunitx \
        sourcesanspro \
        sourcecodepro \
        subfiles \
        tcolorbox \
        thmtools \
        tikzfill \
        todonotes \
        tools \
        unicode-math \
        upquote \
        xifthen \
        xkeyval \
        xpatch

RUN fmtutil -sys --all \
    && ln -sf python3 /usr/bin/python

WORKDIR /texdora
