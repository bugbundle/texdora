FROM quay.io/fedora/fedora@sha256:1fcb4b8b5d3fcdba78119734db03328fb3b8463bbcc83e1dda3e4ffb0ffe3b34

ENV PYTHONUNBUFFERED=1
RUN useradd -m texdora
RUN dnf install -y \
        make-4.3 \
        texlive-2021 \
        texlive-luatex85 \
        texlive-plex-otf-svn47562 \
        texlive-babel-french-svn56607 \
        texlive-glossaries-french-svn42873 \
        texlive-hyphen-french-svn58652 \
        texlive-minted-svn44855 \
        texlive-selnolig-svn38721 \
        texlive-colorprofiles-svn49086 \
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
        python3-3.10.0 \
        pandoc-2.14.0.3 \
        && fmtutil -sys --all \
        && ln -sf python3 /usr/bin/python \
        && dnf clean all

WORKDIR /home/texdora
USER texdora

RUN python3 -m ensurepip
RUN python3 -m pip install pip==22.0.4 --upgrade
RUN python3 -m pip install Pygments==2.11.2
