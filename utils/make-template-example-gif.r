################################################################################

# makes a video in .gif format displaying presentation template

# CL Roberts

################################################################################


input <- "template.qmd"
n_slides <- 8
quarto::quarto_render(input = input, quiet = TRUE, execute_params = list(incremental = TRUE))
for (i in 0:n_slides) {
  webshot2::webshot(
    url = sprintf(
      "file:////%s#%s",
      normalizePath(sub("\\.qmd$", ".html", input)),
      i
    ),
    file = sprintf("contents-%02d.png", i),
    vwidth = 1050,
    vheight = 700
  )
}

png_files <- list.files(pattern = "contents-/*")

gifski::gifski(png_files = png_files, gif_file = "template-example.gif", 
                width = 1050, height = 700, delay = 2)

file.remove(png_files)
