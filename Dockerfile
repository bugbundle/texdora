FROM quay.io/fedora/fedora:38@sha256:242d1f52519f56bb9cee9658c39a8d9978e927260330ce92b830ea2f9460d750

RUN dnf install -y \
        make \
        texlive-2022 \
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
        fontawesome-fonts \
        python3 \
        python3-pygments \
        && fmtutil -sys --all \
        && ln -sf python3 /usr/bin/python \
        && dnf clean all