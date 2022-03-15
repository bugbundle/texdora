# TeXdora

Fedora docker image with `texlive` & `pandoc` installed.

## Getting started

Use this image to build your LaTeX document easily. Here is an example of gitlab-ci pipeline using our image.

```yaml
image: registry.gitlab.com/benjaminboboul/texdora:latest
compile: 
  script:
  - lualatex --shell-escape document.tex
  - lualatex --shell-escape document.tex
  artifacts:
    paths:
    - $SUBJECT/document.pdf
    - $SUBJECT/document.log
```

## Project status

I'm currently the only maintainer of this docker image, contributions are welcome.
