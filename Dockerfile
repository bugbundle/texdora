FROM quay.io/fedora/fedora:39

RUN dnf install -y \
        which \
        git \
        make \
        texlive-2023 \
        texlive-luatex85 \
        texlive-plex-otf \
        texlive-babel-french \
        texlive-glossaries-french \
        texlive-glossaries-extra \
        texlive-hyphen-french \
        texlive-minted \
        texlive-selnolig \
        texlive-colorprofiles \
        texlive-xmpincl \
        texlive-pdfx \
        texlive-appendix \
        texlive-lastpage \
        texlive-multirow \
        texlive-tcolorbox \
        texlive-titlesec \
        texlive-datetime \
        texlive-fontawesome \
        texlive-fontawesome5 \
        texlive-roboto \
        texlive-sourcesanspro \
        texlive-sourceserifpro \
        texlive-sourcecodepro \
        texlive-biblatex \
        texlive-pgfplots \
        texlive-thmtools \
        texlive-todonotes \
        texlive-siunitx \
        texlive-subfiles \
        texlive-circuitikz \
        texlive-pgf \
        fontawesome-fonts \
        python3 \
        python3-pip \
        && dnf clean all

RUN fmtutil -sys --all \
    && ln -sf python3 /usr/bin/python \
    && pip install --user --no-cache-dir Pygments
