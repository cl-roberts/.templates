# SoA-theme

This repository contains a theme and template for making slide show presentations
using Quarto Reveal.js. A preview of the theme is shown below.

![SoA theme template](template-example.gif)


## Installation and usage

To simply install the theme, run the following shell command:

```bash
quarto install extension cl-roberts/ADFG-theme
```

This will download the theme into your local computers file system and enable
usage via the following entry to your Reveal.js presentation's YAML:

```yaml
format:
  SoA-theme-revealjs: default 
```

Alternatively, the following shell command

```bash
quarto use template cl-roberts/ADFG-theme
```

will install the extension and create a template qmd file that you can use as a starting place for your presentation.

## Customization

If this theme does not meet your needs, I recommend customizing the `css` code
contained in `_extensions\ADFG-theme\ADFG-theme.scss`


## Example

Here is the source code for the template slide show: [template.qmd](template.qmd).
