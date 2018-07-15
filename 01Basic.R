# comment

# ; :  명령어의 끝


3+4  

3+4; 3-4



#  CTRL + Enter : 명렁어 실행
#  Enter : 다음줄 이동
#  대소문자 구분


# 1. 연산자(Operator) ----

# 1.1 산술 연산자 ----

# +, -, *, / , **, ^, %%, %/%

3 + 4
3 - 4
3 * 4
3 / 4 
3 ** 4
3 ^ 4      # 거듭제곱
3 %% 4     # 나머지
3 %/% 4    # 몫



# 1.2  할당 연산자 ----
# <-,  = 
# <- : 일반적인 저장
# = : 함수 안의 argument를 설정

x <- 10
y = 10

x
y



# 1.3 비교 연산자 ----
# >, <, <=, >=, ==, !=, !

3 > 4
3 >=  4
3 < 4
3 <= 4
3 == 4
3 != 4
!( 3==4)



# 1.4. 논리 연산자 ----
# &, |


(3 > 4) & (5 > 4)

(3 > 4) | (5 > 4)



# 2. 데이터 유형 (Type of Data) ----
# 값이 무엇으로 되어 있는가?


# 2.1. 수치형 (Numeric)
# (1) 정수 (Integer)
# (2) 실수 (Double)


x1 <- 10
x1 <- 10.5


# 2.2. 문자형(Character)

x3 <- 'Love is choice.'

x4 <- "Love is not feeling"


# 2.3. 논리형(Logical)


x5 <- TRUE
x5

x5 <- FALSE
x5
 



# 3. 데이터 유형을 알려주는 함수 ----
# 3.1 mode(data)

mode(x1)

mode(x3)

mode(x5)


# 3.2. is.XXXXX(data)
is.numeric(x1)
is.character(x3)
is.logical(x5)



# 4. 강제로 데이터 유형을 변경하기 ----

# as.XXXX(data)
x1 <- 10
x2 <- "10"
x3 <- "Lee"
x4 <- FALSE


mode(as.numeric(x2))
as.numeric(x3)    # NAs
as.numeric(x4)
as.character(x1)
as.character(x4)
as.logical(x1)     # 0 : FALSE, else : TRUE



# 5. 데이터 유형의 우선순위 ----
# character > numeric > logical





























































