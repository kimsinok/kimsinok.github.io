# Matix
# 3.2 Matrix의 속성 ----
# 1) 행의 개수 : nrow(matrix)

A <- matrix(1:4, nrow=2, ncol=2)
A

nrow(A)


# 2) 열의 개수 : ncol(matrix)
ncol(A)


# 3) 행의 이름 : rownames(matrix)
rownames(A)


rownames(A) <- c("R1", "R2")

A

is.vector(rownames(A))


# 4) 열의 이름 : colnames(matrix)

colnames(A)


colnames(A) <- c("C1", "C2")



# 5) 차원 (dimension) ----
# dim(matrix)
# 행과 열의 개수를 동시에 알려준다.
dim(A)

dim(A)[1]   #행의 개수
dim(A)[2]   #열의 개수




# 5) 차원의 이름 (dimension) ----
# dimnames(matrix)
# 행과 열의 이름를 동시에 알려준다.
dimnames(A)  # List : [[1]]

dimnames(A)

is.vector(dimnames(A)[[1]])
dimnames(A)[2]



# 3.3. Matrix의 Slicing ----
# matrix[ rowIndex, colIndex ] : 2차원구조

# 1) 열 Slicing
#    matrix[ , colIndex]
B <- matrix(1:6, nrow=2, ncol=3)

B

B[, 1] #최종 결과는 Vector


B[, 1, drop=FALSE] #최종 결과는 Matrix , drop 속성은 Matrix 유지

B[, c(1, 3)]

B[, 2:3]



# 2) 행 Slicing ----
# matrix[ , colIndex]

B[1, ]  # 최종결과는 Vector
B[1, ,drop=FALSE]   #최종 결과는 Matrix , drop 속성은 Matrix 유지
B[1:2, ]


# 3) 행과 열 Slicing
# matrix[rowIndex, colIndex]


B[2,2] # 최종결과는 Vector

B[2, 2:3]

B[1:2, 2:3]


# 3.4. Matrix의 연산 ----
# 1) 덧셈과 뺄셈
# 두 행렬 간의 shape가 같아야 함.
# 두 행렬의 행의 개수와 열의 개수가 각각 같아야 함.


A <- matrix(1:4, nrow=2, ncol=2, byrow=FALSE)
B <- matrix(5:8, nrow=2, ncol=2)

A+B
A-B


# 2) 곱셈
# 두 행렬 간의 shape가 같아야 함.
# 첫 행렬의 열의 개수와 두번째 행렬의 행의 개수가 각각 같아야 함.
# 결과 : 첫 행렬의 행의 개수와 두번째 행렬의 열의 개수
# %*%

A
A %*% B


# 3) 역행렬 ----
# 조건1: 행의 개수 와 열의 개수 : 정방행렬(Square Matrix)
# 조건2 : 행렬식(determinant)이 0이 아니어야 한다.
# sovle(matrix)


solve(A)
det(A) # 행렬식을 구하는 함수(determiate)



A %*% solve(A)      # 단위행렬(Indentitiy Matrix)


solve(A) %*% A   

A <- matrix(c(1, 2,-1, 1), nrow = 2, ncol = 2)
B <- matrix(c(3,0), nrow = 2, ncol = 1)

A
B

solve(A) %*% B



# 4) 전치행렬(Transpose Matrix) ----
# 행과 열을 바꿈
# t(martix)

t(A)



# 4. Array ----
# 3차원 이상의 다차원 구조
# 하나의 데이터 유형만 갖는다.
# Vector/Matrix의 확장


# 4.1. Array 만들기
# array(vector, dim=)


array(1:5, dim = 10)            # 1차원  vector Array

array(1:5, dim = c(3, 3))       # 2차원  matrix Array

array(1:5, dim = c(3, 3, 3))    # 3차원  matrix Array



dim(array(1:5, dim = c(3, 3, 3)) )




# 5. Data.Frame  ----

# 행과 열로 구성되어 있음
# 2차원 구조
# 여러개의 데이터 유형을 가질 수 있음
# 단, 하나의 열에는 하나의 데이터 유형만 가짐
# R에서 데이터라고 하면 기본적으로 Data.Frame임



# 5.1. Data.Frame 만들기
#. data.frame(vector, factor, matrix)



id <- 1:6
gender <- c("m", "f", "m", "m", "m", "m")
age <- c(25, 23, 24, 28, 25, 35)
major <- c("컴퓨터공학", "호텔경영학", "경제학", "컴퓨터공학", "IT응용학", "경제학")

survey <- data.frame(id, gender, age, major)


survey
View(survey)




# 6. List ----
# 가장 유연한 형태의 데이터
# 데이터 분석 결과 중에 일부룰 저장할 때 사용함
# 데이터의 크기 및 종류가 다르다.



# 6.1. List 만들기 ----
# list(vector, factor, matrix, data.frame, list)


# 1 : vector, 2 : matrix, 3 : data.frame
result <- list(major, A, survey)


result


# 6.2. List의 Slicing ----
# 1) list[index]
# 2) list[[index]]

result[1]
is.list(result[1])

result[[1]]
is.vector(result[[1]])



result[2]
result[[2]][,2]
is.matrix(result[[2]])



result[3]
result[[3]]
is.data.frame(result[[3]])




















































































































