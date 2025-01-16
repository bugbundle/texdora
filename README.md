# TeXdora

Docker image with `texlive` installed.
Available as a GitHub Action too !

## Getting started

Use this image to build your LaTeX document easily. Here is an example of integration as a github action.

<!-- x-release-please-start-version -->
```yaml
jobs:
  compile:
    runs-on: ubuntu-latest
    steps:
      - uses: bugbundle/texdora@v4.5.0
```

An alternative would be to use it directly as a docker image:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: docker://ghcr.io/bugbundle/texdora@v4.5.0
    steps:
    - uses: actions/checkout@v4
    - run: make papers.pdf

    - uses: actions/upload-artifact@v3
      with:
        name: document
        path: papers.pdf
```

<!-- x-release-please-end -->

## Advanced uses cases

### Use stix2 fonts

In order to use the stix2 fonts provided by ctan, copy the following snippet:

```tex
\usepackage{unicode-math}
\setmainfont{STIXTwoText}[
  /usr/local/texlive/2024/texmf-dist/fonts/opentype/public/stix2-otf/,
  Extension       = .otf,
  UprightFont     = *-Regular,
  ItalicFont      = *-Italic,
  BoldFont        = *-Bold,
  BoldItalicFont  = *-BoldItalic ]
\setmathfont{STIXTwoMath-Regular}[
  /usr/local/texlive/2024/texmf-dist/fonts/opentype/public/stix2-otf/,
  Extension       = .otf ]
```

## Project status

I'm currently the only maintainer of this docker image, contributions are welcome.
