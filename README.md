# TeXdora

Fedora docker image with `texlive` & `pandoc` installed.
Available as a GitHub Action too !

## Getting started

Use this image to build your LaTeX document easily. Here is an example of integration as a github action.

<!-- x-release-please-start-version -->
```yaml
jobs:
  compile:
    runs-on: ubuntu-latest
    steps:
      - uses: bugbundle/texdora@v3.5.0
```

An alternative would be to use it directly as a docker image:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: docker://ghcr.io/bugbundle/texdora@v3.5.0
    steps:
    - uses: actions/checkout@v4
    - run: dnf install -y ibm-plex-fonts-all
    - run: make papers.pdf

    - uses: actions/upload-artifact@v3
      with:
        name: document
        path: papers.pdf
```

<!-- x-release-please-end -->

## Project status

I'm currently the only maintainer of this docker image, contributions are welcome.
