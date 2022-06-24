library(dplyr)
library(ggplot2)
library(foreign)
mental <- read.spss ("data/2019_korean.sav")

class(mental)

mental<- as.data.frame(mental)

class(mental)
str(mental)

mental1<- mental %>% 
  select(q32_2,q1_4,q32_1,q34_1,q52,d17,d1,d2,ara) %>% 
  rename(suicide=q32_2,
         satisfaction=q1_4,
         loneliness=q32_1,
         family_belief=q34_1,
         wealth=q52,
         health=d17,
         sex=d1,
         age=d2,
         area=ara)
str(mental1)

table(mental1$suicide)

table(mental1$health)

table(mental1$satisfaction)

table(mental1$loneliness)

table(mental1$wealth)

table(mental1$sex)

table(mental1$area)

mental1$suicide1<-as.integer(mental1$suicide)
mental1$satisfaction1<-as.integer(mental1$satisfaction)
mental1$loneliness1<-as.integer(mental1$loneliness)
mental1$family_belief1<-as.integer(mental1$family_belief)
mental1$wealth1<-as.integer(mental1$wealth)
mental1$health1<-as.integer(mental1$health)

table(mental1$suicide1)
table(mental1$health1)
table(mental1$satisfaction1)

mental1$satisfaction1<-mental1$satisfaction1-1
mental1$wealth1<-mental1$wealth1-1
mental1$health1

mental1$age1<-as.character(mental1$age)
mental1$sex1<-as.character(mental1$sex)
mental1$area1<-as.character(mental1$area)
mental1$age1<-ifelse(mental1$age1=="19~29세","20대",
                     ifelse(mental1$age1=="60~69세","60대",mental1$age1))

summary(mental1)

mental1 %>% 
  group_by(sex1) %>% 
  summarise(n=n()) %>% 
  mutate(total=sum(n),
         pct=round(n/total*100,1))

mental1 %>% 
  group_by(age1) %>% 
  summarise(n=n()) %>% 
  mutate(total=sum(n),
         pct=round(n/total*100,1))

table(mental1$sex1, mental1$age1)
round(prop.table(table(mental1$sex1,mental1$age1),1)*100,1)

chisq.test(mental1$sex1,mental1$age1)

mental1 %>% 
  summarise(m1=mean(suicide1),m2=mean(satisfaction1),m3=mean(loneliness1),m4=mean(family_belief1),m5=mean(wealth1),m6=mean(health1))

RA<-lm(data=mental1,suicide1~satisfaction1+loneliness1)
ra
summary(RA)

cor.test(mental1$satisfaction1,mental1$loneliness1)

RA<-lm(data=mental1,satisfaction1~family_belief1+wealth1+health1)
summary(RA)

RA<-lm(data=mental1,loneliness1~family_belief1+wealth1+health1)
summary(RA)

t.test(data=mental1,satisfaction1~sex1)

mental1 %>% 
  group_by(age1) %>% 
  summarise(m=mean(satisfaction1)) %>% 
  arrange(desc(m))

area_satisfaction <- mental1 %>% 
  group_by(area1) %>% 
  summarise(m=mean(satisfaction1)) %>% 
  arrange(desc(m))

ggplot(data=area_satisfaction,aes(x=reorder(area,m),y=m))+
  geom_col()+
  ggtitle("")