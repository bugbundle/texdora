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
      - uses: benjaminboboul/texdora@v2.0.2
```
<!-- x-release-please-end -->

## Project status

I'm currently the only maintainer of this docker image, contributions are welcome.
