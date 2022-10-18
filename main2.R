#install.packages("ggplot2")
library(ggplot2)
# 삼각함수
sin(3)
cos(3)
tan(3)

#라디안 각도 사용(파이각도)
trifunc <- function(angle){
  print(sin(angle))
  print(cos(angle))
  print(tan(angle))
}
trifunc(3)
degsin <- function(angle){
  return(sin(angle*3.1415926535/180))
}
degsin(90)

#로그 함수
log(3)
log10(3)

#제곱근 함수
sqrt(3)
min(1,2,3,4)
max(1,2,3,4)
floor(3.5)
ceiling(3.5)
round(3.5)
sum(1,2,3,4)
mean(c(1,2,3,4))
sd(c(1,2,3,4))


#데이터 구조 -> 확장
# 1. 스칼라
# 하나의 데이터 표현 가능한 모든 것들 -> 스칼라
# 1개 짜리 데이터(벡터)

# 2. 벡터
# 동일한 타입의 데이터를 한줄로 묶은 것
vec <- c('A','B','C')
#인덱싱 -> 데이터 자르기
vec <- c(vec, 'B')
vec[5] <-'E'
vec[length(vec) + 1] <- 'F'
#데이터가 잘못되었다.
vec[3] <- NA

vec

if('A' %in% vec) {
  
}

# 팩터 (범주 데이터)
factor(c('a', 'b', 'a'), c('a','c'))
fac <- factor(vec)
fac
#nlevels(fac)
#length(levels(fac))
fac[1]
levels(fac) <- c('A','B','c','D','E')
fac

# 리스트
# 동일한 타입을 한줄로 묶은 것 -> 벡터
# 서로 다른 타입을 한줄로 묶은 것 -> 리스트
li <- list(apple = '사과', price = 500)
#li[['apple']]
li$apple <- c(1,2,3,4) # 달러 인덱싱
li[['tuple']] <- 3 
#li$price <- NULL
#li$price <- NA
li

#matrix(1:2000, nrow=40)
#list((name='사과', price=5000), list(name='이열',price=4000))

# 행렬 
# 벡터의 확장
# 서로 동일한 자료형을 행/열 형태로 묶은 것

#row 행, column 열 / byrow 가로로 데이터를 넣음
mat <- matrix(1:20, nrow=5, byrow=TRUE)
mat[2,2]
mat[1,]
dimnames(mat) <- list(c(),c())
rownames(mat) <- c(1,2,3,4,5)
rownames(mat)
mat
colnames(mat) <- c('A','B','C','D')
colnames(mat)
mat
mat[,c('A','B')]
cars
cars[,c('dist')]


mat < 2
mat[(mat[mat %% 2 != 0])]

matrix(rep(0, 60), nrow=10)

# 행열 연산
mat1 <- matrix(rep(0,16), nrow=4)
mat2 <- matrix(rep(1,16), nrow=4)
mat1 * mat2

# 행열 곱
mat1 %*% mat2
mat %*% mat2

# 전치 행열
t(mat)

mat

# 행열 데이터 추가
rbind(mat,c(1,2,3,4)) # row bind
cbind(mat,c(1,2,3,4,5)) # column bind

# 행열 데이터 삭제
mat <- mat[,-3]


# 배열
# 행열의 확장
# 행열 -> 2차원 묶음(행/열)
# 배열 -> N차원 묶음(행/열/차원/N/.....)
array(1:2000, c(20,10,10))[,,3]
dimnames(array)


# 데이터 프레임
# 서로 다른 타입의 데이터를 묶은 행열
df <- data.frame(N=c(1,2,3,4,5), E=c('A','B','C','D','E'), stringsAsFactors = FALSE)
df[,1]
df$N

# 원하는 데이터의 정보를 다 볼수 있는 함수
str(df)
str(mat)


df[,'N',drop=FALSE]

#cars에서 속도 10 이상 20이하 차량의 총 대수 구하기
cars$speed >= 10
length(rownames(cars[cars$speed >= 10,]))
#cars에서 평균 속도 차량구하기기
cars[cars$speed < mean(cars$speed), ]
