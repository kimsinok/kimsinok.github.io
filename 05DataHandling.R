# Data Handling ----


# 실제 업무에서 가장 많은 시간이 필요한 작업
# data handling = data pre-processing = data wrangling


# 예제 데이터 : ggplot2::diamonds


# 패키지 설치 및 로딩 ----
install.packages("ggplot2")
install.packages("DT")
install.packages("dplyr")
install.packages("writexl")
library(ggplot2)
library(DT)
library(dplyr)
library(writexl)


# 작업공간 설정 ----
setwd("C:/test/easy_r")



# 데이터 읽어오기 ----
diamonds <- ggplot2::diamonds



# 1. 데이터 전체보기  ----
# 1.1. data
# console에 출력
ggplot2::diamonds



# 1.2. View(data)에 출력
View(diamonds)


# 1.3. DT::datatable(data)
# web browser style
DT::datatable(diamonds)



# 2. 데이터의 일부 보기 ----
# 2.1. head(data, n = )
# console에 출력
head(diamonds)
head(diamonds, n = 10)


# 2.1. tail(data, n = )
tail(diamonds)
tail(diamonds, n = 10)


# 2.3. View(head(data) or tail(data))
View(head(diamonds, n = 10))
View(tail(diamonds, n = 10))


DT::datatable(head(diamonds, n = 10))
DT::datatable(tail(diamonds, n = 10))


# 3. 데이터의 구조(Structure) 보기 ----
# 코드표
# str(data)
str(diamonds)



# 4. 기초 통계량 구하기 ----
# 입력 오류가 있는지를 체크한다.
# summary(data)
summary(diamonds)



# 5. 데이터의 속성 ----
# 5.1. 행의 갯수 : nrow(data)
nrow(diamonds)


# 5.2. 열의 갯수 : ncol(data)
ncol(diamonds)


# 5.3. 행의 이름 : rownames(data)
# R은 기본적으로 "1" "2" 행이름을 설정한다.
rownames(diamonds)


# 5.4. 열(변수)의 이름 : colnames(data)
# R은 기본적으로 "1" "2" 행이름을 설정한다.
colnames(diamonds)



# 5.5. 차원 : dim(data)
dim(diamonds)
dim(diamonds)[1] # 행의 개수
dim(diamonds)[2] # 열의 개수



# 5.6. 차원의 이름 : dimnames(data)
dimnames(diamonds)      # List
dimnames(diamonds)[1]   # List : 행의 이름
dimnames(diamonds)[[1]] # Vector : 행의 이름
dimnames(diamonds)[2]   # List : 열의 이름
dimnames(diamonds)[[2]] # Vector : 열의 이름



# 6. 데이터의 Slicing ----
# 전체, 집단별, 타깃별, 개인별
# data[rowIndex , colIndex]


# 6.1. 열(변수) ----
# (1) 열(변수)의 인덱스를 알때
# data[ , colIndex]

diamonds[ , 1] # data.frame 유지

diamonds[ , 2] # data.frame 유지


# 문제1
diamonds[ , c(1, 9, 10)]  # data.frame 유지


# 문제2
diamonds[ , 3:7]



# 문제3
diamonds[ , seq(from=2, to=ncol(diamonds), by=2)]



# (2) 열(변수)의 이름을 알 때 (character)
diamonds[ , "carat"]
diamonds[ , "cut"] 


# 문제3
diamonds[ , c("x", "y", "z")]


# (3) 열 - 변수의 이름에 패턴이 있을때
# i. 특정문자를 포함하는 변수명
# grep(pattern, data, value = FALSE | TRUE)
# value = FALSE : 위치, value = TRUE : 값



diamonds[ , grep("c", colnames(diamonds), value = FALSE)]

diamonds[ , grep("c", colnames(diamonds), value = TRUE)]



# ii. 특정문자 시작하는 변수명

colnames(diamonds)

grep("^c", colnames(diamonds), value = FALSE)
grep("^c", colnames(diamonds), value = TRUE)



diamonds[ ,grep("^c", colnames(diamonds), value = FALSE)]

DT::datatable(diamonds[, grep("^c", colnames(diamonds), value = FALSE)])

diamonds[ ,grep("^c", colnames(diamonds), value = TRUE)]



# iii. 특정문자로 끝나는 변수명

grep("e$", colnames(diamonds), value = FALSE)
grep("e$", colnames(diamonds), value = TRUE)

diamonds[ ,grep("e$", colnames(diamonds), value = FALSE)]




# 6.2 행 ----
# data[rowIndex, ]
# 1) 행의 위치를 알때

diamonds[1, ]
diamonds[2, ]


# 문제5
DT::datatable(diamonds[c(1, 9, 10), ])


# 문제6
diamonds[3:10, ]

nrow(diamonds)

diamonds[3:nrow(diamonds), ]



# 문제6
diamonds[seq(from=2, to=nrow(diamonds), by=2), ]

colnames(diamonds)



# 2) 비교 연산자와 논리 연산자를 이용 (중요) 
# cut 중에서 "Ideal"인 것만 추출하기



str(diamonds)

nrow(diamonds)


diamonds$cut

nrow(diamonds)

diamonds[diamonds$cut == 'Ideal', ]




# price가 18000 이상 데이터 추출하기

diamonds[diamonds$price >= 18000, ]


diamonds[(diamonds$cut == 'Ideal') & (diamonds$price >= 18000), ]


diamonds[(diamonds$cut == 'Ideal') | (diamonds$price >= 18000), ]


diamonds[(diamonds$cut == "Ideal") | (diamonds$cut == "Fair"), ]




# %in%
diamonds[diamonds$cut %in% c('Ideal', "Fair"), ]




View(diamonds)

diamonds[diamonds$cut %in% c("Ideal", "Premium"), ]




# 6.3. 행과 열 ----
# data[rowIndex, colIndex]

diamonds[(diamonds$cut == "Ideal") & (diamonds$price >= 18000), c("x", "y", "z")]




# 6.4. dplyr 패키지를 이용하여 슬라이싱 (dplayer) ----
# 1) 열 추출
# dplyr::select(data, variable, ...)


str(diamonds)


dplyr::select(diamonds, carat)

dplyr::select(diamonds, carat, cut)

dplyr::select(diamonds, cut:x)

dplyr::select(diamonds, -(cut:x))



# 2) 행 추출
# dplyr::filter(data, 비교연산자, 논리연산자)


dplyr::filter(diamonds, cut == "Ideal")

dplyr::filter(diamonds, price >= 18000)

dplyr::filter(diamonds, cut == "Ideal", price >= 18000)  # &

dplyr::filter(diamonds, cut == "Ideal" | price >= 18000)  # |



# 3) 행과 열 추출

d1 <- dplyr::filter(diamonds, cut == "Ideal", price >= 18000)
dplyr::select(d1, x:z)



str(diamonds)


head(diamonds, n=20)

test <- dplyr::filter(diamonds, cut == "Ideal"| price == 326)
dplyr::select(test, -carat)



# 4) %>% : pipe == chain 
# 중간 과정에 불필요한 데이터를 생성하지 않도록 해준다.


diamonds %>% 
  dplyr::filter(cut == "Ideal", price >= 18000) %>% 
  dplyr::select(x:z)




diamonds %>% 
  dplyr::filter(cut == "Ideal", price >= 1800) %>% 
  dplyr::select(c(1, 3))




# 7. 새로운 변수 만들기 ----
# 7.1. 연산 ----
# data$new.variable <- 연산

diamonds$xyz.mean <- (diamonds$x + diamonds$y + diamonds$z) / 3


diamonds$xyz.mean2 <- rowMeans(diamonds[ , c("x","y","z")]) 


diamonds$xyz.mean3 <- rowMeans(dplyr::select(diamonds, x:z)) 


View(diamonds)


diamonds$xzy.sum <- rowSums(dplyr::select(diamonds, x:z))




# 참고 : rowSums(), colMeans(), colSums()


# 변환 : Box-Cox Transformation 
# 1. 루트 변환 : sqrt()

diamonds$price.root <- sqrt(diamonds$price)

View(diamonds)


diamonds$price.root <-  sqrt(diamonds$price)


# 2. 로그 변환 : log10()
# 참고 : log2(), logb(), log() : 자연로그

diamonds$price.log10 <- log10(diamonds$price)


# 3. 1/X 변환

diamonds$price.inverse <- 1 / diamonds$price


# 4. scale() : 표준화 함수

diamonds$price.scale <- scale(diamonds$price)



# 7.2. cut() ----
# 양적 자료를 질적 자료로 변환할 때 사용한다 
# data$new.variable <- cut(data$new.variable, 
#                          breaks = 구간의 정보,
#                          right = FALSE or TRUE )
            

diamonds$price.group <- cut(diamonds$price, 
                            breaks = seq(from = 0, to = 20000, by = 5000),
                            rigth = FALSE )  # 이상 ~ 미만


str(diamonds)


levels(diamonds$price.group) <- c("5000미만", 
                                  "5000이상 ~ 10000미만", 
                                  "10000이상 ~ 15000미만", 
                                  "15000이상")


View(diamonds)

mode(diamonds$price.group)


# 7.3. ifelse() ----

# 기본은 변수가 2개의 값만 갖도록 해 줌.

# data$new.variable <- ifelse(data$variable 조건, 
#                             조건이 참일때에 가지는 값,
#                             조건이 거짓일때에 가지는 값)


diamonds$price.group <- ifelse(diamonds$price < 5000,
                               "cheap",
                               "not-cheap")


View(diamonds)



diamonds$price.group1 <- ifelse(diamonds$price < 5000,
                               "cheap",
                               ifelse(diamonds$price < 15000,
                                      "medium",
                                      "expensive"))


# 8. 기존 변수 삭제하기 ----
# data$Variable <- NULL

# diamonds$xyz.mean2 <- NULL


diamonds$price.group <- NULL
diamonds$price.group1 <- NULL



# 9. 외부 데이터로 저장하기 ----
# 9.1. txt  ----
# write.table(data,
#             file = "directory/filename.txt",
#             sep = ","
#             row.names = FALSE)



getwd()


write.table(diamonds,
            file      = "diamonds_0713.txt",
            sep       = ",",
            row.names = FALSE)



# 9.2. csv ----
# write.csv(data,
#           file = "directory/filename.csv",
#           row.names = FALSE)


write.csv(diamonds,
          file      = "diamonds_0713.csv",
          row.names = FALSE)


# 9.3. excel ----
# writexl::write_xlsx(data, 
#                     path = "directory/filename.xlsx")


writexl::write_xlsx(diamonds,
                    path = "diamonds.xlsx")



# 10. 데이터 목록 보기 ----
# 사용자가 만든 데이터의 목록
# ls()
# ls : list segment
ls()



# 11. 데이터를 RData로 저장하기 ----
# save(data,
#      file = "directory/filename.RData")


save(diamonds, file = "diamonds_0713.RData")




# 12. RData 불러오기 ----
# load(file = "directory/filename.RData")

load(file = "diamonds_0713.RData")


# 13. 데이터 삭제하기 ----
# 1) 하나 또는 몇개 지우기
# rm(data1, data2 ...) == remove(data1, data2 ...)


x <- 10
y <- "Buil Lee"
z <- 1:10


ls()

rm(x, y, z)

# 2) 모두 지우기
# rm(list = ls())

rm(list = ls())

ls()
View(diamonds)


# 14. 데이터 정렬하기 ----
# 14.1 Vector ----
# sort(vector, decreasing = FALSE)  # 오름차순 정렬
# sort(vector, decreasing = TRUE)   # 내림차순 정렬


age <- c(30, 24, 24, 25, 28)
sort(age, decreasing = FALSE)
sort(age, decreasing = TRUE)



# 14.2 Data.Frame ----
# (1) order ----
# order(data$variable, decreasing = FALSE)  # 오름차순 정렬
# order(data$variable, decreasing = TRUE)   # 내림차순 정렬


order(age) # 인덱스를 반환한다.


order(age, decreasing = FALSE)

age[order(age, decreasing = FALSE)]


View(diamonds)


diamonds[order(diamonds$price, decreasing = FALSE), ]


diamonds[order(diamonds$cut, decreasing = FALSE ) , ]

diamonds[order(diamonds$cut, decreasing = TRUE ) , ]

View(diamonds[order(diamonds$cut, decreasing = TRUE ) , ])


diamonds[order(diamonds$cut, diamonds$price, decreasing = FALSE ) , ]


View(diamonds[order(diamonds$cut, diamonds$price, decreasing = FALSE ) , ])


diamonds[order(diamonds$cut, diamonds$price, decreasing = TRUE ) , ]



diamonds[order(diamonds$cut, -diamonds$price, decreasing = FALSE), ]


diamonds[order(diamonds$cut, -diamonds$price, decreasing = TRUE), ]




# (2) dplyr::arrange ----
# dplyr::arrange(data, variable, desc(variable)) 
# cut : 오름차순, color : 내림차순
dplyr::arrange(diamonds, cut,  desc(color))




View(diamonds)




# 15. 데이터 합치기 ----
# 15.1 rbind(data1, data2) ----
d1 <- data.frame(id = 1:3,
                 age = c(10, 20, 30),
                 bt = c("a", "a", "b"))


d2 <- data.frame(id = 4:6,
                 age = c(40, 50, 60),
                 bt = c("a", "b", "b"))

d3 <- rbind(d1, d2)

d3

# 15.2 cbind(data1, data2) ----

d4 <- data.frame(id = 1:3,
                 age = c(10, 20, 30))



d5 <- data.frame(bt = c("a", "b", "b"),
                 address = c("서울", "서울", "대전"))

d6 = cbind(d4, d5)

d6


# 15.3 merge(data1, data2, by = ) ----


d7 <- data.frame(id = c(1, 2, 4, 7),
                 age = c(10, 20, 40, 70))



d8 <- data.frame(id = c(1, 3, 4, 10),
                 bt = c("a", "a", "b", "ab"))


d7
d8


# 1) inner join
# merge(data1, data2, by = "primary key")

merge(d7, d8, by = "id")



# 2) outer join : full join
# merge(data1, data2, by = "primary key", all = TRUE)

merge(d7, d8, by = "id", all = TRUE)



# 3) outer join : left join
# merge(data1, data2, by = "primary key", all.x = TRUE)



merge(d7, d8, by = "id", all.x = TRUE)



# 4) outer join : right join
# merge(data1, data2, by = "primary key", all.y = TRUE)


merge(d7, d8, by = "id", all.y = TRUE)






# 16. package ----
# 16.1 인테넷이 안될 때에 패키지 설치하기
# install.packages("package 다운로드 파일", repos = NULL)  # 로컬
# https://cran.r-project.org/


getwd()


install.packages("basicTrendline_1.0.1.zip", repos = NULL)


# 16.2 모든 패키지 다운로드 하기
# package.list <- avalilable.packages()
# download.packages(pkgs = packagelist, destdir = "directory/") 


package.list <- available.packages()


# 16.3 현재 설치된 패키지 확인하기
# installed.packages()


# 16.4 패키지 업데이트하기
# update.packages()



# 16.5 패키지 삭제하기
# remove.packages()


# 16.6 설치된 패키지 목록보기(로딩)
# search()
# searchpaths()

search()
searchpaths()


# 17. R의 정보 알기
R.home()

R.version


# 18. directory
# dir()

dir()
































































































































































































