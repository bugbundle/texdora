FROM docker.io/redhat/ubi9-minimal:9.6-1755695350
ARG TEXLIVE_MIRROR=https://mirrors.mit.edu/CTAN/systems/texlive/tlnet/
ENV PATH="${PATH}:/root/.local/bin:/usr/local/texlive/2025/bin/x86_64-linux"

RUN microdnf update -y \
  && microdnf install -y \
        ca-certificates \
        git \
        tar \
        make \
        perl-interpreter \
        python3 \
        python3-pygments \
  && microdnf clean all

WORKDIR /tmp

RUN curl -L ${TEXLIVE_MIRROR}/install-tl-unx.tar.gz | tar xz
RUN perl ./install-tl-*/install-tl -v --no-interaction --scheme=minimal --no-doc-install --repository=${TEXLIVE_MIRROR} && rm -rf ./install-tl-*

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
        lineno \
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
        xpatch  \
        xstring

RUN fmtutil -sys --all \
    && ln -sf python3 /usr/bin/python

WORKDIR /texdora
