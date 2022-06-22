mean(exam_na$korean,na.rm = T)
mean(exam_na$korean,na.rm = F)
mpg1<- read.csv("data/mpg1.csv")
boxplot(mpg1$cty)
boxplot(mpg1$cty)$stats
str(iris)
glimpse(iris)
str(iris)
ggplot(iris, aes( x = Sepal.Length,
                  y = Sepal.Width,
                  size = Petal.Width,
                  colour =Species))+
  geom_point(alpha = 0.5)
?ggplot
library(dplyr)
str(who_disease)
who_disease %>% 
  filter(region == 'AMR',
         year == 1980,
         disease == 'pertussis',
         cases >0) -> data5

ggplot(data5, aes(x = cases))+
  geom_histogram(fill ="pink")

ggplot(data5, aes(x = country, y = cases))+
  geom_col(fill ="blue")+
  #옵션
  coord_flip()

