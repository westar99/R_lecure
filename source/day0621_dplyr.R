#P.98
#분석 프로세스

#데이터 전처리를 위한 도구 dplyr ->10Gb이내
#데이터 전처리를 위한 도구 data.table ->50GB이상

#디플라이의 장점->쉽다 
#데이터 테이블의 장점-> 용량이 크다.
#라이브러리를 불러오기
#install.packages("dplyr")
library(dplyr)
mpg1<- read.csv("data/mpg1.csv",stringsAsFactors = F)
str(mpg1)
#데이터를 골라내기 ->%>%는 한꺼번에 적을 수 있다.
 data2<- mpg1 %>%
   select(drv,cty,hwy)%>%
   filter(drv=="f")
 data3<-select(mpg1, drv, cty)   
 data3<-filter(data3, drv=="f")
#data3<- v()
#%>%(파이프연산자Ctrl+shift+M)는 함수 뒤에 쳐야 하는 문법이다.
#select:컬럼명 추출
#filter:행 추출 (조건식)
#group by :
#summarize()
#교재 p99-120
#파생변수
#filter, select, rename, mutate 등등
iris
#데이터 미리보기
glimpse(iris)
iris %>%
  #species, setosa, versicolor
  filter(Species !="virginica") %>%
  select(Sepal.Length, Sepal.Width)%>%
  filter(Sepal.Length> 5.0) %>% 
  mutate(total=Sepal.Length+Sepal.Width)->data2
#필터가 겹칠시에 &를 사용해도 똑같은 결과값이 나온다
iris %>%
  #species, setosa, versicolor
  filter(Species !="virginica"&Sepal.Length> 5.0) %>%
  select(Sepal.Length, Sepal.Width)%>%
  mutate(total=Sepal.Length+Sepal.Width)->data4
#P121 집단별 통계량
#group_by() summarise()
mpg1 %>% summarise(avg= mean(cty))
#하나만으로는 의미가 없기에 묶어줘야한다.
mpg1 %>% 
  group_by(trans) %>% 
  summarise(avg    = mean(cty)#평균
            , total= sum(cty) #총합
            , med  = median(cty))#중간값
mpg1 %>% 
  group_by(trans) %>% 
  summarise(avg    = mean(cty)#평균
            , total= sum(cty) #총합
            , med  = median(cty)#중간값
            , count= n()  )#집단데이터숫자를세어빈도를말함
k<-mpg
