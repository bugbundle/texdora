FROM quay.io/fedora/fedora:39@sha256:626f4480c997fb048a7e89a57ff6b270a70c6dc474e7755ec5be6b4815904ae5

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
        texlive-pgfplots \
        texlive-thmtools \
        texlive-todonotes \
        texlive-siunitx \
        fontawesome-fonts \
        python3 \
        python3-pygments \
        && fmtutil -sys --all \
        && ln -sf python3 /usr/bin/python \
        && dnf clean all