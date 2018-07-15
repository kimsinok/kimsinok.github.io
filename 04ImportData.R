# import Data

# 1. txt
# 2. csv
# 3. excel


# 1. txt
# 1.1. separator : one blank = white space
# data <- read.table(file = "directory/filename.txt", header = TRUE, sep = "")



blank <- read.table(file = "C:/io/blank.txt", 
                    header = TRUE, 
                    sep = " ")

blank


# 1.2. separator : comma(,)  ----
# data <- read.table(file = "directory/filename.txt", header = TRUE, sep = ",")



comma <- read.table(file = "C:/io/comma.txt", 
                    header = TRUE, 
                    sep = "," ,
                    stringsAsFactors = FALSE)

is.factor(comma$food)


View(comma[2])


# 1.3. separator : tab  ----
# data <- read.table(file = "directory/filename.txt", header = TRUE, sep = "\t")




tab <- read.table(file = "C:/io/tab.txt", 
                  header = TRUE, 
                  sep = "\t")

is.factor(tab$address)
tab

View(tab)





# 2. csv
# comma seperated value의 약자
# 액셀의 특수한 형태
# data <- read.csv(file = "directory/filename.csv", header = TRUE)



hope <- read.csv(file = "C:/io/hope.csv", 
                 header = TRUE)

hope

View(hope)




# 3. excel : xls(2003 이하 버전의 엑셀), xlsx(2003 이후 버전의 엑셀)
# R의 기본 기능에서는 못 읽어옴.
# 추가기능 : 
# package 
# 1) function 
# 2) data
# 3) help
# 4) example


# package : readxl
# package 설치하기(install)
# 조건 : 인터넷이 연결되어 있어야함
# install.packages("package")
# 동일 컴퓨터에서는 패키지 설치는 한 번만 함.
install.packages("readxl")


# package 로딩하기(loading)
# R과 패키지의 연결
# 패키지의 내용을 RAM에 올리는 기능
# 해당 필요할 때 마다 컴퓨터에서 실행해야 함
# library(package)

library(readxl)

# data <- readxl:read_excel(path = "directory/filename.xlsx", 
#                           sheet = "sheetName or index", 
#                           col_names = TRUE)




reading <- readxl::read_excel(path = "C:/io/data.xlsx",
                              sheet = "data",
                              col_names = TRUE)


reading




reading <- readxl::read_excel(path = "C:/io/data.xlsx",
                              sheet = 1,
                              col_names = TRUE)


View(reading)



# 작업공간(Working directory)

# 1) getwd() : 현재 설정된 작업공간을 알려준다.

getwd()


# 2) setwd("directory") : 작업공간 설정하기

setwd(dir = "C:/test/east_r")



reading3 <- readxl::read_excel(path = "data.xlsx",
                               sheet = 1,
                               col_names = TRUE)


View(reading3)




getw



























             




















































