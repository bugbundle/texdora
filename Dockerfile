FROM quay.io/fedora/fedora@sha256:a2c59ce2b1b10f290132b4190b6f7ba77e7e9eb705ec4aee043e4bf2b25c069c

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
        texlive-fontawesome5 \
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