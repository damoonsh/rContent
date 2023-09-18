# Level 1 Exercise - R Bootcamp

"
  This exercise has two parts:
    1. Basics: Very basic questions to check your understanding and 
       some of the topics discussed during the session.
    2. Plotting: Some plotting exercise to check your understanding
"

housing_df <- read.csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")

# Part 1: Basics

# Exercise 1.1: Name two columns with a numeric type in the housing_df

# Exercise 1.2: Import the ggplot2 and tidyverse package
library(ggplot2)
library(tidyverse)

# Exercise 1.3: Given the URLs, import the datasets
# URLs
spoftify_songs_url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv'
pokemon_url <- 'https://www.dropbox.com/s/iq1jk2mxh73bfjn/Pokemon.csv?dl=1'
video_game_sales_url <- 'https://www.dropbox.com/s/7f6zp9lrss3dpot/vgsales.csv?dl=1'
titanic_url <- 'https://www.dropbox.com/s/whhrdrk9t9he8o3/titanic_train.csv?dl=1'

spotify_songs <- 
pokemon <- 
video_game_sales <- 
titanic <-

# Part 2: Plotting
# Note: You should use ggplot for all of the questions.

# Exercise 2.1: Scatter plot with Age as x and Fare as y on the titanic dataframe
ggplot(----, aes(x=---, y=---)) + ----()

# Exercise 2.2: Bar Chart with Genre as x, Platform as fill on video_game_sales 
ggplot(-----, ----(--- = ----, fill = ---- )) + 
  ------(position = "fill")

# Exercise 2.3: Bar Chart with Type.2 as x, Type.1 as fill on pokemon
ggplot(------, aes(x = , fill = )) + -----(---- = "fill")



