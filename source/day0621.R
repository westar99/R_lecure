#220621에 한 일들.데이터 불러오기
#경로 설정이 매우 중요
#
getwd()#현재 경로를 확인하는 함수
#setwd("C:/Users/human/Desktop/R_lecure/source/data")
#csv파일/엑셀파일 불어오기
#오늘 할 일 P91
mpg1<-read.csv("mpg1.csv")
mpg1
str(mpg1)
mean(mtcars$mpg)#평균
var(mtcars$mpg)#분산
sd(mtcars$mpg)#표준편차
#기술통계-표준편차를 이용하여 그 데이터의 생김새를 상상할 수 있는 통계법
#사분위수
#IQR:1사분위수와 3사분위수
#통계분석/머신러닝->왜곡된 이상치를 제거할 때 사용

quantile(mtcars$mpg)

#통계 요약 구하기(p90)
summary(iris)
summary(iris$Sepal.Length)
        
table(mpg1$trans)        
table(mpg1$manufacturer)
table(mpg1$trans,mpg1$manufacturer)

#빈도의 비율 구하기
a<-table(mpg1$trans)
prop.table(a)

b<-table(mpg1$trans,mpg1$drv)
prop.table(b)
prop.table(table(mpg1$manufacturer))
#행과 열의 비율 형식 맞추기(각각의 행열을 1이되게)
?prop.table
prop.table(b,margin = 1)#행의 합이 1
prop.table(b,margin = 2)#열의 합이 1

#소수점 아래 자리 지정
round(0.322323,2)#round(정보값,자릿수)
round(prop.table(table(mpg1$manufacturer)),2)

a= table(mpg1$trans)
a
b= prop.table(a)
b
round(b,2)

#시각화 이미지
##보통은 ggplot2 패키지를 사용하지만 테이블 이미지를 이쁘게 사용하고 싶으면 gt table 패키지도 있다.고급 
