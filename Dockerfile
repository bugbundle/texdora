FROM quay.io/fedora/fedora@sha256:b14af4b4e7abb04e3dd4d7194d9415cedc6f587b6e446581d4ec110f94f9a75f

RUN dnf install -y \
        make \
        texlive-2022 \
        texlive-luatex85 \
        texlive-plex-otf \
        texlive-babel-french \
        texlive-glossaries-french \
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
        texlive-roboto \
        texlive-sourcesanspro \
        texlive-sourceserifpro \
        texlive-sourcecodepro \
        fontawesome-fonts \
        python3 \
        python3-pygments \
        && fmtutil -sys --all \
        && ln -sf python3 /usr/bin/python \
        && dnf clean all \
        && useradd -m texdora 