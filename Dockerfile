FROM ubuntu:24.04@sha256:562456a05a0dbd62a671c1854868862a4687bf979a96d48ae8e766642cd911e8	

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
        amscls \
        beamer \
        beamer-tcolorbox \
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
