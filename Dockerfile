FROM ubuntu:22.04@sha256:f9d633ff6640178c2d0525017174a688e2c1aef28f0a0130b26bd5554491f0da	

ENV PATH="${PATH}:/root/.local/bin:/usr/local/texlive/2024/bin/x86_64-linux"

RUN apt-get update -y && apt-get install -y --no-install-recommends \
        git=1:2.34.1-1ubuntu1.10 \
        make=4.3-4.1build1 \
        perl=5.34.0-3ubuntu1.3 \
        fonts-font-awesome=5.0.10+really4.7.0~dfsg-4.1 \
        fonts-ibm-plex=6.0.0-1 \
        python3=3.10.6-1~22.04 \
        python3-pip=22.0.2+dfsg-1ubuntu0.4 \
        wget=1.21.2-2ubuntu1 \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

ADD https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz ./install-tl-unx.tar.gz

RUN zcat < install-tl-unx.tar.gz | tar xf - && \
    perl ./install-tl-*/install-tl --no-interaction --scheme=minimal && \
    rm -rf ./install-tl-*

RUN tlmgr install \
        collection-langfrench \
        collection-luatex \
        latex-bin \
        memoir \
        xpatch \
        tools \
        booktabs \
        hyperref \
        infwarerr \
        kvoptions \
        mparhack \
        fontspec \
        carlisle \
        pdftexcmds \
        microtype \
        amscls \
        glossaries-extra \
        xkeyval \
        glossaries \
        biblatex \
        pgf \
        pgfplots \
        tikzfill \
        thmtools \
        todonotes \
        siunitx \
        mathtools \
        pdfpages \
        subfiles \
        float \
        caption \
        circuitikz \
        minted \
        fancyvrb \
        upquote \
        csquotes \
        plex \
        epstopdf-pkg \
        pdflscape \
        enumitem \
        ragged2e \
        geometry \
        fancyhdr \
        xifthen \
        ifmtarg \
        setspace \
        unicode-math \
        fontawesome5 \
        roboto \
        sourcesanspro \
        tcolorbox \
        environ \
        parskip \
        bookmark

RUN fmtutil -sys --all \
    && ln -sf python3 /usr/bin/python \
    && pip install --user --no-cache-dir Pygments==2.17.2
