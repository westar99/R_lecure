#벡터
num_vector = c(1,2,3)
num_vector2= c(5:7)
num_vector[1]+num_vector[2]
num_vector[1]+num_vector2[2]
a<- 1
class(a)
b<-"hi"
class(b)
#문자형
char_v<- c("hi","he")
char_v
char_v[1]
char_v[2]
class(char_v)
# 명목형 자료형 Factor
locaiton_vector <- c("서울", "인천", "부산")
factor_location_vector <- factor(locaiton_vector)
factor_location_vector

class(factor_location_vector)
help(factor)

# 순서형 자료형 Factor
temperature_factor <- c("기온높음", 
                        "기온보통", 
                        "기온낮음", 
                        "기온높음", 
                        "기온보통", 
                        "기온보통")

temperature_factor

factor_temperature_factor <- factor(temperature_factor, 
                                    ordered = TRUE, 
                                    levels  = c("기온보통", 
                                                "기온낮음", 
                                                "기온높음"))
class(factor_temperature_factor)
class(temperature_factor)

##데이터프레임
#-엑셀데이터 같은 것
no = c(1,2,3,4,5)
sex= c("male","female","male","male","female")
korean= c(87,92,95,81,87)

exam1 <-data.frame(no,sex,korean)
exam

exam $no
exam$no[2]
exam$sex[4]

#데이터 타입
class(exam$sex)
class(exam$no)
class(exam$korean)

str(exam)
no<-c(1,2,3,4,5)
sex<-c("male","female","male","male","female")
korean< -c(87,92,95,81,87)
english<-c(88,95,92,84,86)
math<-c(82,93,90,80,88)
exam<-data.frame(no,sex,korean,english,math)
exam_1<-data.frame(exam,english,math)
view(exam_1)
#데이터 내보내기&불러오기

write.csv(x=exam, file ="temp.csv")
getwd()
#바탕화면에 dataset 폴더 생성 exam객체 저장
temp = read.csv("dataset/temp.csv")
read.csv("exam.csv")
#R에서 예제파일 exam.csv를 객체 exam으로 입력하여 설명함.
exam<-read.csv("exam.csv")
temp
exam
exam_1 <- data.frame(exam,temp)
getwd()
install.packages("ggplot2")
library(ggplot2)
install.packages("data.table")
library(data.table)
install.packages("readxl")
library(readxl)
read_excel("student_xl.xlsx")
read_excel("student1_xl.xlsx")
read_excel("student1_xl.xlsx",sheet=2)
install.packages("foreign")
library(foreign)
student<-read.spss("student.sav")
class(student)
as.data.frame(student)
