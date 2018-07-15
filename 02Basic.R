# 데이터 구조
# 1. Vector     ***
# 2. Factor     *
# 3. Matrix
# 4. Array
# 5. Data.Frame *** 
# 6. List       *


# 1. Vector ----
# 하나의 열(Column)로 구성되어 있음
# 1차원 구조
# 하나의 데이터 유형만 갖는다.
# 데이터 분석의 기본이다.



# 1.1 Vector 만들기
# (!) 하나의 값(element)으로 이루어진 벡터


v1 <- 10
v2 <- "Lee"
v3 <- FALSE




# (2) 2개 이상의 값(element)으로 이루어진 벡터 ----
# i. c(element1, element2, ...)
# c: combine, concatenate
# numeric, character, logical vector를 만들 수 있음



age <- c(31, 21, 34, 50, 11)
mode(age)



bt <- c("b", "b", "b", "a", "b")
mode(bt)



smoke <- c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)
smoke
mode(smoke)




age2 <- c(24, 28, 25, 24)
age2 <- c(age, age2)   
age2



# ii. : (콜론) ----
# numeric vector에만 적용됨

# 1씩 증가되는 숫자들 또는 1씩 감소되는 숫자들로 
# 구성된 벡터를 만들때 사용함
# start:end
# start < end : 1씩 증가됨
# start > end : 1씩 감소됨
# start == end : start or end
# start에 있는 숫자부터 시작해서 End에 있는 숫자를 넘지 않을때까지 
# 1씩 증가 또는 1씩 감소


v1 <- 1:10
v1


v2 <- 10:1
v2

# -3.3:1 

v3 <- (-3.3:1)
v3


v4 <- 1:5.5
v4


# iii. seq(from=, to=, by=) ----
# numeric vector에만 적용됨
# :의 확장
# 모든 증가/ 감소의 폭을 지정할 수 있다.
# from : start
# to : end
# by : 증감의 폭



seq(from=1, to=5, by=0.001)
seq(from=5, to=1, by=-0.001)



# iv. sequence(숫자)
# numeric vector에만 적용됨.
# 1 ~ '숫자' 사이의 정수
# '숫자'는 양수이어야 한다.


sequence(10)
sequence(3.5)
sequence(-3)   # error


# 문제1

# 1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5

sequence(1:5)


# 1, 2, 3, 4, 5, 1, 2, 3, 4, 1, 2, 3, 1, 2, 1

sequence(c(5:1))




# v.rep(vector, times=, each=) ----
# rep : replicate
# numeric, character, logical vector
# 주어진 벡터를 복사해 주는 기능


rep(1, times = 10)
rep(1, each = 10)
rep(1:3, times=10)
rep(1:3, each=10)


# 문제2

rep(c("a", "b", "c"), times=4)



rep(1:3, times=5, each=10)



# 문제3

rep(c("a","b","c"), times=c(100, 63, 17))



rep(1:3, each=10)


# 1.2. Vector 의 속성 ----
# (1) 데이터의 갯수
# length(vector)


money <- c(300, 50, 1000, 100, 100)
length(money)



# (2) element의 이름  ----
# names(vector)

names(money) <- c("권민영", "조병주", "여동윤", "손원주", "변정현")


money


names(money) <- NULL


money



# 1.3. Vector 의 인덱스 ----

money <- c(300, 50, 1000, 100, 100)

# 첫번째 element의 위치를 1로 시작한다.



# 1.4. Vector의 slicing ----
# vector[index]


money[1]
money[1:length(money)]
money[sequence(length(money))]



# 문제
money[c(1, 4, 5)]



# 문제
money[2:5]



money[seq(from=1, to=length(money), by=2)]




# 1.5 Vector의 연산 ----

v1 <-  1:3
v2 <-  4:6


v3 <- v1 + v2   # 벡터화(Vectorization)


v4 <-  1:6

v1 + v4  # 재사용 규칙

v5 <- 1:7

v1 + v5




































