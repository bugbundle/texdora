FROM ubuntu:24.04@sha256:562456a05a0dbd62a671c1854868862a4687bf979a96d48ae8e766642cd911e8	

ENV PATH="${PATH}:/root/.local/bin:/usr/local/texlive/2024/bin/x86_64-linux"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
        git \
        make \
        perl \
        fonts-font-awesome \
        fonts-ibm-plex \
        python3 \
        python3-pip \
        wget \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

ADD https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz ./install-tl-unx.tar.gz

RUN zcat < install-tl-unx.tar.gz | tar xf - && \
    perl ./install-tl-*/install-tl --no-interaction --scheme=minimal && \
    rm -rf ./install-tl-*

RUN tlmgr install \
        amscls \
        beamer \
        beamertheme-tcolorbox \
        biblatex \
        bookmark \
        booktabs \
        caption \
        carlisle \
        circuitikz \
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
        plex \
        ragged2e \
        roboto \
        setspace \
        siunitx \
        sourcesanspro \
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
    && ln -sf python3 /usr/bin/python \
    && pip install --user --no-cache-dir Pygments==2.17.2
