# The Tidy Tuesday community: https://github.com/rfordatascience/tidytuesday

# https://fivethirtyeight.com/features/scary-movies-are-the-best-investment-in-hollywood/
# https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-10-23
install.packages(gcookbook)

library(palmerpenguins)
library(ggplot2)
library(gcookbook) # Additional Datasets



spotify_songs <- read.csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')
movie_profit <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-10-23/movie_profit.csv")
penguins <- palmerpenguins::penguins
housing_df <- read.csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")

ggplot(housing_df, aes(x = MSSubClass, y = LotArea)) + 
  geom_point()

#Movie_profit
# 1. Scatter Plot Exercise:
# Exercise 1: Scatter plot of domestic_gross (x) vs worldwide_gross (y)
ggplot(movie_profit, aes(x = domestic_gross, y = worldwide_gross)) +
  geom_point()


#Housing_df
# Exercise 2: Scatter plot of MasVnrArea (x) vs LotArea (y)

ggplot(housing_df, aes(x = MasVnrArea, y = LotArea)) +
  geom_point()
  

# 2. Line Chart
# Ex1:
ggplot(housing_df, aes(x = YearBuilt, y= SalePrice)) + geom_line()
#Penguins
# Exercise 1: Plot the line chart flipper_length_mm as x and body_mass_g as y (from the penguins dataset)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g )) +
  geom_line()


# 3. Bar Chart
# Ex1: Time as x and demand as y
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')

#housing_df
# Exercise 1: Plot LotShape as x for SalePrice bar chart
ggplot(housing_df, aes(x=LotShape, y = SalePrice)) + geom_bar(stat='identity')


# Ex2: Which genre has the most repetitions
ggplot(movie_profit, aes(x=genre))+ geom_bar()

# Ex3: Adding the filter to
ggplot(movie_profit, aes(genre, fill= mpaa_rating)) +
  geom_bar()


# Ex4: Scaling the graph to look normalized
ggplot(movie_profit, aes(genre, fill = mpaa_rating)) +
  geom_bar(position = 'fill')



# Ex5: Using fill with position dodge to make seperate graphs
ggplot(movie_profit, aes(x = genre, fill = mpaa_rating)) + 
  geom_bar(position = 'dodge')

diamond <- diamonds

# Exercise 1: plot clarity column of diamonds dataframe with cut as the fill
ggplot(diamond, aes(x = clarity, fill = cut)) + 
  geom_bar(position = 'fill')


# Exercise 2: plot clarity column of diamonds dataframe with color as the fill
ggplot(diamond, aes(x = clarity, fill = color)) + 
  geom_bar(position = 'fill')

# 4. Histogram

# Ex1:
ggplot(movie_profit, aes (x=log(worldwide_gross))) +
  geom_histogram(binwidth = 0.1)


# Ex2:
ggplot(movie_profit, aes (x=log(worldwide_gross))) +
  geom_histogram(binwidth = 2)



# Ex3: What difference does a higher binwidth value make?
# Higher the binwidth, the more grouped/less bars appear on the chart.


#Pengiuns
# Exercise 1: Make a histogram of body_mass_g from penguins
ggplot(penguins, aes(x = body_mass_g))+
  geom_histogram(binwidth = 2)


# Exercise 2: Make a histogram of body_mass_g from penguins with binwidth=500

ggplot(penguins, aes(x = body_mass_g))+
  geom_histogram(binwidth = 500)

#Come back at 3:20 pm












