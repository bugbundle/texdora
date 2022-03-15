FROM quay.io/fedora/fedora 

ENV PYTHONUNBUFFERED=1
RUN useradd -m texdora
RUN dnf install -y \
        texlive \
        texlive-plex-otf \
        texlive-babel-french \
        texlive-glossaries-french \
        texlive-hyphen-french \
        texlive-minted \
        texlive-colorprofiles \
        texlive-xmpincl \
        texlive-pdfx \
        texlive-appendix \
        texlive-lastpage \
        texlive-multirow \
        texlive-tcolorbox \
        texlive-titlesec \
        ibm-plex-mono-fonts \
        ibm-plex-sans-fonts \
        ibm-plex-serif-fonts \
        python3 \
        pandoc \
        && fmtutil -sys --all \
        && ln -sf python3 /usr/bin/python

WORKDIR /home/texdora
USER texdora

RUN python3 -m ensurepip
RUN python3 -m pip install pip --upgrade
RUN python3 -m pip install Pygments>=2.11.2
