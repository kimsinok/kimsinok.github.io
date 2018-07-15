# Data Analysis
# EDA(Exploratary Data Analysis)
# 기초 데이터 분석


# 패키지 설치 및 로딩
install.packages("ggplot2")
install.packages("RColorBrewer")
library(ggplot2)
library(RColorBrewer)



# 작업 공간 설정
setwd("C:/test/easy_r")


# 데이터 불러오기
#ggplot2::diamonds

diamonds <- ggplot2::diamonds


str(diamonds)

# 질적자료 : cut, color, clarity
# 양적자료 : carat, depth, table, price, x, y, z


# 1. 일변량(Uni-variate) 질적자료의 분석 ----
# 1.1. 표 = 빈도표(Frequency table) ----
# 1) 빈도(Frequency) ----
# table(data$variable)

table(diamonds$cut)          # 품질
table(diamonds$color) 
table(diamonds$clarity)      # 투명도



sort(table(diamonds$cut), decreasing = TRUE)
sort(table(diamonds$color), decreasing = TRUE)
sort(table(diamonds$clarity), decreasing = TRUE)


# for clause

for(i in 2:4) {
  print(sort(table(diamonds[ , i]), decreasing = TRUE))
}



for(i in c("cut", "color", "clarity")) {
  print(sort(table(diamonds[ , i]), decreasing = TRUE))
}
  

View(diamonds)


# 2) 백분율(Percent) ----
# prop.table(frequency) * 100  # 비율 테이블
# 소수점 한자리 까지 표현

prop.table(table(diamonds$cut)) * 100
round(sort(prop.table(table(diamonds$cut)) * 100, decreasing = TRUE), digits = 1)



round(sort(prop.table(table(diamonds$cut)), decreasing = TRUE) * 100, digits = 1)

str(diamonds)


colnames(diamonds)



# 문제1]


for(i in c("cut", "color", "clarity")) {
  print(sort(table(diamonds[ , i]), decreasing = TRUE))
  print(round(sort(prop.table(table(diamonds[ , i])) * 100, decreasing = TRUE), digits = 1))
  print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
}



# 1.2 Graph ----
# 1) 막대 그래프 (Bar Chart) ----
# barplot(frequency or percent)
# 막대 색상 : col = "color"
# 색상 패키지 : RColorBrewer
# 차트 제목 : main
# y축 제목 : ylab : a label for the x axis
# y축 눈금 : ylim : c(min, max) : limits for the y axis

?barplot

barplot(sort(table(diamonds$cut), decreasing = TRUE),
        col = "blue")



barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = c("blue", "green", "red", "pink", "yellow"))


color.palatte <- RColorBrewer::brewer.pal(n = 5,
                                          name = "GnBu")

barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col =  color.palatte)


barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = c("blue", "green"))


barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = color.palatte,
        main = "Cut of Diamonds")


barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "blue",
        main = "Cut of Diamonds",
        ylab = "Frequency")



barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col  = "blue",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        ylim = c(0, 25000))




# 가로 막대 그래프 : horiz = TRUE

barplot(sort(table(diamonds$cut), decreasing = FALSE), 
        col  = "blue",
        main = "Cut of Diamonds",
        xlab = "Frequency",
        xlim = c(0, 25000),
        horiz = TRUE)



# 문제2

for(i in c(c("cut", "color", "clarity"))) {
    barplot(sort(table(diamonds[, i]), decreasing = FALSE), 
        col   = "blue",
        main  = paste(i, "of Diamonds"),
        xlab  = "Frequency",
        xlim  = c(0, 25000),
        horiz = TRUE)
}




colnames(diamonds)

max(table(diamonds$clarity))

length(unique(diamonds$cut))



color.palatte <- RColorBrewer::brewer.pal(n = 5,
                                    name = "GnBu")


length(unique(diamonds[, "cut"]))


for(i in c("cut", "color", "clarity")) {
  
  barplot(sort(table(diamonds[, i]), decreasing = TRUE),
          col = color.palatte)
  
}


max(table(diamonds[, "cut"]))


for(i in 2:4) {
    
    size <- length(unique(diamonds[, i]))
    color.palatte <- RColorBrewer::brewer.pal(n = size, 
                                              name = "GnBu")
    
    max <- max(table(diamonds[, i]))
    
  
    barplot(sort(table(diamonds[, i]), decreasing = TRUE), 
          col   = color.palatte,
          main  =  paste(colnames(diamonds)[i], "Of Diamonds"),
          ylab  = "Frequency",
          ylim  = c(0, max + 5000),
          horiz = FALSE)
}




paste ("Love", "is", "choice.")

paste(1, 1, 1)

paste(1, 1, 1, sep = "-")


# 문제3
# var1, var2, var3 ... var100 출력하기

paste("var", seq(from = 1, to = 100, by = 2), sep = "")

paste("Var", 1:100, sep = "")



v1 <- "Love is choice."
toupper(v1)
tolower(v1)
casefold(v1,upper = FALSE)





# * 그래프 화면 분할하기 : mf(Multi Frame) ----
# 기본적으로 하나의 그래픽 화면에 하나의 그림만 출력
# par(mfrow = c(nrow, ncol))  : 행부터 그래프를 채움
# par(mfcol = c(nrow, ncol)) : 열부터 그래프를 채움


par(mfrow = c(3, 1))
# par(mfcol = c(1, 3))


for(i in 2:4) {
  barplot(sort(table(diamonds[, i]), decreasing = FALSE), 
          col   = "blue",
          main  =  paste(colnames(diamonds)[i], "Of Diamonds"),
          xlab  = "Frequency",
          xlim  = c(0, 25000),
          horiz = TRUE)
}






# 2) 원 그래프 (Pie Chart) ----
# pie(frequencey or percent)

?pie

pie(sort(table(diamonds$cut), decreasing = TRUE))


# 반지름 : radius = 0.8

pie(sort(table(diamonds$cut), decreasing = TRUE), radius = 1)


# 시계방향 : clockwise  = TRUE


pie(sort(table(diamonds$cut), decreasing = TRUE), 
    radius = 1, 
    clockwise = FALSE)



# 첫째 조각의 시작 각도 : init.angle
# init.angle = 0 : 반시계방향
# init.angle = 90 : 시계방향


# 문제
# 그래픽 화면을 3행 2열로 분할하고 
# 각 행에 각 질적 자료의 막대 그래프와 원 그래프가 출력되도록 한다.


?par
par(mfrow = c(3,2))



par(mfrow = c(3, 2))


colnames(diamonds)



for(i in c("cut", "color", "clarity")) {
  
  barplot(sort(table(diamonds[, i]), decreasing = TRUE),
          col = "blue",
          main = paste(i, "Of Diamonds"),
          ylab = "Frequency",
          ylim = c(0, 30000))
  
  
  
  
  pie(sort(table(diamonds[, i]), decreasing = TRUE),
      radius = 1,
      clockwise = TRUE,
      init.angle = 0)
  
 
}




for(i in 2:4) {
  barplot(sort(table(diamonds[, i]), decreasing = FALSE), 
          col   = "blue",
          main  =  paste(colnames(diamonds)[i], "Of Diamonds"),
          xlab  = "Frequency",
          xlim  = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[i]), decreasing = TRUE), 
      radius = 1, 
      clockwise = TRUE,
      init.angle = 90)
}


par(mfrow = c(1, 1))


# * pdf 파일에 그래프 저장하기 ----
# pdf(file = "directory/filename.pdf") : 저장 시작
# 그래프 작업
# dev.off() : 저장 끝
# dev :  Graphics Device


getwd()


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

pdf(file = "graphices.pdf")


for(i in c(c("cut", "color", "clarity"))) {
  barplot(sort(table(diamonds[, i]), decreasing = FALSE), 
          col   = "blue",
          main  = paste(i, "of Diamonds"),
          xlab  = "Frequency",
          xlim  = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[, i]), decreasing = TRUE), 
      radius = 1, 
      clockwise = TRUE,
      init.angle = 0 )
}

dev.off()

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



# 한페이지에 출력

pdf(file = "graphices2.pdf")
par(mfrow = c(3, 2))

for(i in c(c("cut", "color", "clarity"))) {
  barplot(sort(table(diamonds[, i]), decreasing = FALSE), 
          col   = "blue",
          main  = paste(i, "of Diamonds"),
          xlab  = "Frequency",
          xlim  = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[, i]), decreasing = TRUE), 
      radius = 1, 
      clockwise = TRUE,
      init.angle = 0 )
}



dev.off()



# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# 2. 일변량(Uni-variate) 양적자료의 분석 ----
# 구간을 만드는 방법
# 구간의 갯수
# Sturge's Formular


# 2.1. 표 - 빈도표 ----
# - 구간의 빈도, 백분율 

# * 범위 ----
# 1. 구간의 갯수 : Sturge's Formular
# 2. 범위 : 최대값 - 최소값
# 3. 구간의 폭 : 범위 / 구간의 갯수
# 4. 첫째 구간 : 최소값
# 5. 마지마 구간 : 최대값

# 1. 구간의 갯수 
interval.count <- 1 + 3.3 * log10(nrow(diamonds[, "carat"]))  # 16.61531
# interval.count <- 1 + 3.3 * log10(nrow(diamonds[, 2]))


# 2. 범위
carat.range <- diff(range(diamonds$carat))  # 4.81

# 3. 구간의 폭

interval.width <- carat.range / interval.count   # 0.2894921


# 4. 첫째 구간 : 최소값
min(diamonds$carat)


# 5. 마지마 구간 : 최대값
max(diamonds$carat)


diamonds$carat.group <- cut(diamonds$carat,
                            breaks = seq(from = 0, to = 5.1, by = 0.3),
                            right = FALSE)


View(diamonds)


prop.table(table(diamonds$carat.group)) * 100

sort(prop.table(table(diamonds$carat.group)) * 100, decreasing = TRUE)

round(sort(prop.table(table(diamonds$carat.group)) * 100, decreasing = TRUE), digits = 1)

View(round(sort(prop.table(table(diamonds$carat.group)) * 100, decreasing = TRUE), digits = 1))




# 2.2. 그래프 ----
# 1) 히스토그램 (Histogram) ----
# hist(data$variable, breaks = )


price.count <- (1 + 3.3) * log10(nrow(diamonds[, "price"])) #  20.34722

price.interval <- diff(range(diamonds$price)) # 18497

price.width <-  price.interval / price.count  # 1113.251 


range(diamonds$price)  # 326,  18823

18823 / 1113.251 



hist(diamonds$price)


hist(diamonds$price, 
     xlim = c(0, 20000)) # default : Sturge's fomular (구간설정)


hist(diamonds$price, 
     xlim = c(0, 20000),
     breaks = seq(from = 0, to = 20000, by = 5000))


# 구간의 갯수
hist(diamonds$price, 
     xlim = c(0, 20000),
     breaks = 20)



# 2) 상자그림 (BoxPlot) ----
# 양적 자료의 이상치 유무를 파악하기 위해 작성함
# boxplot(data$variable, range = , horizontal=)


boxplot(diamonds$price)
boxplot(diamonds$price, horizontal = TRUE)

age <- c(30, 28, 25, 24, 25, 24, 24, 24, 25, 23)
boxplot(age)



# boxplot(data$variable ~ data$variable)
# boxplot(양적자료 ~ 질적자료)


boxplot(diamonds$price ~ diamonds$cut)

boxplot(diamonds$price ~ diamonds$color)

boxplot(diamonds$price ~ diamonds$clarity)


# 참고 : IQR(Inter Quartile Range) : 사분위범위

price.boxplot <- boxplot(diamonds$price)
price.boxplot


# 이상치 갯수 및 최소, 최대값

str(price.boxplot)


length(price.boxplot$out)
min(price.boxplot$out)
max(price.boxplot$out)



# 참고 
# List의 slicing
# 1) list[index]
# 2) list[[index]]
# 3) list$variable

# quartile(data$variable) : 사분위수

quantile(diamonds$price)

quantile(diamonds$price)[2] # Q1
quantile(diamonds$price)[4] # Q3


quantile(diamonds$price)[2]  - (1.5 * IQR(diamonds$price)) 

quantile(diamonds$price)[4]  + 1.5 * IQR(diamonds$price)

max(diamonds$price)




result <- boxplot(diamonds$price)
str(result)

length(result$out)

quantile(diamonds$price)[2]
quantile(diamonds$price)[4]


quantile(diamonds$price)[2] - 1.5 * IQR(diamonds$price)
quantile(diamonds$price)[4] + 1.5 * IQR(diamonds$price)


# 3) 기술 통계량











































