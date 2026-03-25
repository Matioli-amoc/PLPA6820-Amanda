[GitHub link](https://github.com/Matioli-amoc/PLPA6820-Amanda.git)

1.  1 pts. Regarding reproducibility, what is the main point of writing
    your own functions and iterations?

A- Using functions and iterations, regarding reproducibility, we can
turn the code more efficient and scalable, allowing us to reuse the
functions in different datasets and this can also reduce the human
errors.

1.  2 pts. Conceptual: In your own words, describe: 1) how to write a
    function in R, and 2) how to write a for loop in R. In your answer,
    be specific about: basic syntax, where the code is written, and how
    results are returned or stored. (Answer in plain text; no code
    required for this question.)

A- To writa a function you use the “function” tool, first you set the
keyword that are going to be your function name, after that you use the
arrow to set (&lt;-) and use the function tool followed by parenthesis
where you list the arguments and variables for your function. The steps
that the function are going to do are written inside curly brackets,
where you write the code using the input to get the results. To get the
results we use the command “return”. To write a for loop in R you need
to use the word “for” followed by one variable, inside parenthesis, that
will be the values from the sequence/list (usually uses ‘i’). The action
that you want to repeat are going to be written inside curly brackets,
and the code will run once for each value in sequence. The results for
the loop usually goes to an variable setted inside the loop, and in the
end we can print that variable to see the result.

This dataset contains the population and coordinates (latitude and
longitude) of the 40 most populous cities in the US, along with Auburn,
AL. Your task is to create a function that calculates the distance
between Auburn and each other city using the Haversine formula. To do
this, you’ll write a for loop that goes through each city in the dataset
and computes the distance from Auburn. Detailed steps are provided
below.

1.  1 pts. Read in the Cities.csv file from Canvas using a relative file
    path.

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

    cities <- read.csv("Cities.csv")

1.  6 pts. Function writing: Write a function that calculates the
    distance (in kilometers) between two pairs of geographic coordinates
    using the Haversine formula.

<!-- -->

1.  Function requirements:
2.  Inputs: lat1, lon1, lat2, lon2

<!-- -->

1.  The function must return a single numeric value called distance\_km
2.  All code shown below must be placed inside the function body

Use the following code inside your function:

convert to radians rad.lat1 &lt;- lat1 \* pi/180 rad.lon1 &lt;- lon1 \*
pi/180 rad.lat2 &lt;- lat2 \* pi/180 rad.lon2 &lt;- lon2 \* pi/180

Haversine formula delta\_lat &lt;- rad.lat2 - rad.lat1 delta\_lon &lt;-
rad.lon2 - rad.lon1 a &lt;- sin(delta\_lat / 2)^2 + cos(rad.lat1) \*
cos(rad.lat2) \* sin(delta\_lon / 2)^2 c &lt;- 2 \* asin(sqrt(a))

Earth’s radius in kilometers earth\_radius &lt;- 6378137

Calculate the distance distance\_km &lt;- (earth\_radius \* c)/1000

    h_distance <- function(lat1, lon1, lat2, lon2) {
      
      # convert to radians
    rad.lat1 <- lat1 * pi/180
    rad.lon1 <- lon1 * pi/180
    rad.lat2 <- lat2 * pi/180
    rad.lon2 <- lon2 * pi/180

    # Haversine formula
    delta_lat <- rad.lat2 - rad.lat1
    delta_lon <- rad.lon2 - rad.lon1
    a <- sin(delta_lat / 2)^2 + cos(rad.lat1) * cos(rad.lat2) * sin(delta_lon / 2)^2
    c <- 2 * asin(sqrt(a))

    # Earth's radius in kilometers
    earth_radius <- 6378137

    # Calculate the distance
    distance_km <- (earth_radius * c)/1000

    return(distance_km)

    }

1.  6 pts. Using your function from question 4, calculate the distance
    between Auburn, AL and New York City.

<!-- -->

1.  Subset or extract only the latitude and longitude values needed from
    Cities.csv
2.  Pass those values into your function
3.  Store the result in an object

The expected output is 1367.854 km (small rounding differences are
acceptable).

    auburn <- cities[cities$city == "Auburn",]
    ny <- cities[cities$city == "New York",]

    dist_result <- h_distance(
      lat1 = auburn$lat,
      lon1 = auburn$long,
      lat2 = ny$lat,
      lon2 = ny$long
    )

    dist_result

    ## [1] 1367.854

1.  4 pts. Use your distance function inside a for loop to calculate the
    distance between Auburn, AL and every other city in Cities.csv. Each
    iteration should calculate the distance for one city

The first 9 distances printed should match the values shown below \##
\[1\] 1367.854 \## \[1\] 3051.838 \## \[1\] 1045.521 \## \[1\] 916.4138
\## \[1\] 993.0298 \## \[1\] 1056.022 \## \[1\] 1239.973 \## \[1\]
162.5121 \## \[1\] 1036.99

    distances <- NULL

    for (i in seq_along(cities$city)) {
      dist <- h_distance(
      lat1 = auburn$lat,
      lon1 = auburn$long,
      lat2 = cities$lat[[i]],
      lon2 = cities$long[[i]]
      )
      
    print(dist)
    distances <- c(distances, dist)
      
    }

    ## [1] 1367.854
    ## [1] 3051.838
    ## [1] 1045.521
    ## [1] 916.4138
    ## [1] 993.0298
    ## [1] 1056.022
    ## [1] 1239.973
    ## [1] 162.5121
    ## [1] 1036.99
    ## [1] 1665.699
    ## [1] 2476.255
    ## [1] 1108.229
    ## [1] 3507.959
    ## [1] 3388.366
    ## [1] 2951.382
    ## [1] 1530.2
    ## [1] 591.1181
    ## [1] 1363.207
    ## [1] 1909.79
    ## [1] 1380.138
    ## [1] 2961.12
    ## [1] 2752.814
    ## [1] 1092.259
    ## [1] 796.7541
    ## [1] 3479.538
    ## [1] 1290.549
    ## [1] 3301.992
    ## [1] 1191.666
    ## [1] 608.2035
    ## [1] 2504.631
    ## [1] 3337.278
    ## [1] 800.1452
    ## [1] 1001.088
    ## [1] 732.5906
    ## [1] 1371.163
    ## [1] 1091.897
    ## [1] 1043.273
    ## [1] 851.3423
    ## [1] 1382.372
    ## [1] 0

1.  4 pts. Modify your loop so that each iteration appends one new row
    to a dataframe with the following columns:

• City1 (the other city) • City2 (Auburn) • Distance\_km

The dataframe should grow inside the loop, and the first six rows should
look like this: \## City1 City2 Distance\_km \## 1 New York Auburn
1367.8540 \## 2 Los Angeles Auburn 3051.8382 \## 3 Chicago Auburn
1045.5213 \## 4 Miami Auburn 916.4138 \## 5 Houston Auburn 993.0298 \##
6 Dallas Auburn 1056.0217

    df_dist <- NULL

    for (i in seq_along(cities$city)) {
      dist <- h_distance(
      lat1 = auburn$lat,
      lon1 = auburn$long,
      lat2 = cities$lat[[i]],
      lon2 = cities$long[[i]]
      )
      
      new_row <- data.frame(
        City1 = cities$city[[i]],
        City2 = "Auburn",
        Distance_Km = dist
      )
      
    df_dist <- rbind.data.frame(df_dist, new_row)
      
    }

    head(df_dist)

    ##         City1  City2 Distance_Km
    ## 1    New York Auburn   1367.8540
    ## 2 Los Angeles Auburn   3051.8382
    ## 3     Chicago Auburn   1045.5213
    ## 4       Miami Auburn    916.4138
    ## 5     Houston Auburn    993.0298
    ## 6      Dallas Auburn   1056.0217

1.  1 pts. Commit and push a gfm .md file to GitHub inside a directory
    called Coding Challenge 6. Provide me a link to your github written
    as a clickable link in your rendered .pdf, .docx, or .html
