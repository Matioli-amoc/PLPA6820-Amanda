[Noel, Z.A., Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic fungi
as promising biocontrol agent to protect wheat from Fusarium graminearum
head blight. Plant Disease.](https://doi.org/10.1094/PDIS-06-21-1253-RE)

This assignment will help you practice integrating markdown into your R
scripts for literate programming. It will also involve some more
practice with GitHub. You may collaborate with a partner to enhance your
learning experience. Please ensure the following:

-   Collaboration: If you work with a partner, include both names on the
    final submission by editing the YAML header.
-   Submission: Each person should still submit an assignment to canvas
    in a Word document, html, or .pdf file generated through R markdown.
    Additionally, you should provide a link to your GitHub, where the
    assignment should be viewable by rendering it as a GitHub-flavored
    markdown file.
-   Setup: It is also assumed you already have a GitHub repository for
    this class.

# Code challenging IV

## Question 1

1.  4 pts. Explain the following:

<!-- -->

1.  YAML header

A- Is the section at the top of an R Markdown or Markdown document that
is enclosed between —— lines. It contains the document’s metadata and
configuration settings, such as the title, author, date, and output
format

1.  Literate programming

A- A programming style that includes coding along with annotations, to
make it more readable for humans.

## Question 2

1.  6 pts. Take the code you wrote for coding challenge 3, question 5,
    and incorporate it into your R markdown file. Some of you have
    already been doing this, which is great! Your final R markdown file
    should have the following elements.

<!-- -->

1.  At the top of the document, make a clickable link to the manuscript
    where these data are published. The link is here:  
    i. Noel, Z.A., Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic
    fungi as promising biocontrol agent to protect wheat from Fusarium
    graminearum head blight. Plant Disease.
    <https://doi.org/10.1094/PDIS-06-21-1253-RE>

2.  Read the data using a relative file path with na.strings option set
    to “na”. This means you need to put the Mycotoxin.csv file we have
    used for the past two weeks into your directory, which git tracks.

<!-- -->

    library(tidyverse)

    ## Warning: package 'tidyverse' was built under R version 4.5.2

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.1     ✔ stringr   1.5.2
    ## ✔ ggplot2   4.0.0     ✔ tibble    3.3.0
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.1.0     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    mycotoxin <- read_csv("MycotoxinData.csv", na = "na")

    ## Rows: 375 Columns: 6
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (2): Treatment, Cultivar
    ## dbl (4): BioRep, MassperSeed_mg, DON, X15ADON
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

1.  Make a separate code chunk for the figures plotting the DON data,
    15ADON, and Seedmass, and one for the three combined using
    ggarrange.

<!-- -->

    DON.plot <- ggplot(mycotoxin, aes(x = Treatment, y = DON, color = Cultivar, fill = Cultivar))+
      geom_boxplot() +
      geom_jitter(shape = 21, color = "black", alpha = 0.6,
                  position = position_jitterdodge()) +
      facet_wrap(~Cultivar, scales = "free") +
      theme_classic()+
      theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1))+
      scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]]))+
      scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]))+
      xlab("")+
      ylab("DON(ppm)")
    DON.plot

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Markdown-code-challenging_files/figure-markdown_strict/Don%20Plot-1.png)

    X15ADON.plot <- ggplot(mycotoxin, aes(x = Treatment, y = X15ADON, color = Cultivar, fill = Cultivar))+
      geom_boxplot() +
      geom_jitter(shape = 21, color = "black", alpha = 0.6,
                  position = position_jitterdodge()) +
      facet_wrap(~Cultivar, scales = "free") +
      theme_classic()+
      theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1))+
      scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]]))+
      scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]))+
      xlab("")+
      ylab("15ADON")
    X15ADON.plot

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Markdown-code-challenging_files/figure-markdown_strict/15ADON%20Plot-1.png)

    MassperSeed_mg.plot <- ggplot(mycotoxin, aes(x = Treatment, y = MassperSeed_mg, color = Cultivar, fill = Cultivar))+
      geom_boxplot() +
      geom_jitter(shape = 21, color = "black", alpha = 0.6,
                  position = position_jitterdodge()) +
      facet_wrap(~Cultivar, scales = "free") +
      theme_classic()+
      theme(axis.text.x = element_text(size = 8, angle = 45, hjust = 1))+
      scale_color_manual(values = c(cbbPalette[[1]], cbbPalette[[1]]))+
      scale_fill_manual(values = c(cbbPalette[[3]], cbbPalette[[4]]))+
      xlab("")+
      ylab("Seed Mass (mg)")
    MassperSeed_mg.plot

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Markdown-code-challenging_files/figure-markdown_strict/Seedmass%20Plot-1.png)

    library(ggpubr)

    ## Warning: package 'ggpubr' was built under R version 4.5.2

    plot1 <- DON.plot+
     geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format", p.adjust.method = "fdr")

     plot2<- X15ADON.plot+
      geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format", p.adjust.method = "fdr")

      plot3 <- MassperSeed_mg.plot+
      geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format", p.adjust.method = "fdr")
      
    Final.plot <- ggarrange(
      plot1,
      plot2,
      plot3,
      labels = c("A","B","C"),
      nrow = 1,
      ncol = 3,
      common.legend = T
    )

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    Final.plot

![](Markdown-code-challenging_files/figure-markdown_strict/Three%20combined%20plots-1.png)

## Question 3

1.  6 pts. Knit your document together in the following formats:

<!-- -->

1.  Choose one format: .docx (word document), .pdf, or .html. Make sure
    it includes a table of contents
2.  GitHub flavored markdown (.md file).

## Question 4

1.  2 pts. Push the .docx or .pdf and .md files to GitHub inside a
    directory called Coding Challenge 4.

## Question 5

1.  6 pts. Now edit, commit, and push the README file for your
    repository and include the following elements.

<!-- -->

1.  A clickable link in your README to your GitHub flavored .md file
2.  A file tree of your GitHub repository.

## Question 6

1.  1 pt. Please turn in the file generated in question 3a to canvas
    with a clickable link to your GitHub repository within the document.

[GitHub Repository
Link:](https://github.com/Matioli-amoc/PLPA6820-Amanda.git)
