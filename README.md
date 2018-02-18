# football_fixture_selector

## Explanation

The Football Fixture Selector is an R script that scrapes data off FiveThirtyEight's Club Soccer predictions: https://projects.fivethirtyeight.com/soccer-predictions/?ex_cid=rrpromo

In particular, it scrapes data relating to each team's SPI Rating and fixture predictions. This allows each fixture to be rated using three variables:

* Quality: The total SPI Rating of the two teams competing in a given fixture.
* Competitiveness: The difference between each team's win prediction percentages in a given fixture.
* Enjoyment: Calculcated by equally weighting the two previous variables.

Each variable is normalised to fit a range from 0 to 1.

The script then produces a responsive datatable using the DT package, which is initally ordered by the Enjoyment variable to find fixtures that should be high in Quality and Competitiveness.

## Required Packages

* plyr
* tidyverse
* rvest
* lubridate
* DT
