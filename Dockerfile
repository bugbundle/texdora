FROM quay.io/fedora/fedora@sha256:1972716109b1c906120061063bd4cb50a46c2138d95002ccb90126928d98e013

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