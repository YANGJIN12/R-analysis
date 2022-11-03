# 선형 회귀 분석 - 예측 기법
# 연속된 숫자를 예측하는 기법
# 수학적 지식
# y = d + xa + e
# 종속변수 = 절편 + 독립변수 * 기울기 + 오차차
# 1,1 2,2 3,3 4,4 ....
# y = 0 + x * 1 + 0
#linear <-function(number){
#  return(1 + number * 1 + 0)
#}
#linear(3)
#lm(mtcars$mpg ~ mtcars$wt + mtcars$cyl)
#lm(mtcars$mpg ~ ., data = mtcars)
mtcars
model <- lm(mpg ~ qsec + disp + hp, data = mtcars)
#xval <- mtcars$qsec
#yval <- mtcars$mpg
#xval <- sort(xval)
#yval <- sort(yval)
#plot(xval, yval)
#abline(-5.114,1.412)
#plot(model)
coef(model)
fitted(model)
residuals(model)
confint(model)
plot(model)
# mtcars의 speed라는 파생 변수 생성
# speed는 wt /2 + 50
# speed를 예측하는 선형 회귀 모델 생성후 출력
#mtcars2 <- mtcars %>%
#  mutate(speed = wt / 2 + 50)
model2 <- lm(speed ~ wt, data = mtcars2)
predict.lm(model, newdata = data.frame(cyl=c(4,6,8),qsec=c(10,20,30)))
#predict.lm(model, newdata = data.frame(qsec=c(10), disp=c(150), hp=c(20)))
summary(lm(mpg ~ ., data = mtcars))
y = 1:10
x = rep(1:10)
plot(lm(y ~ x))
summary(model2)
library(stringr)
library(tm)
install.packages(stringr)
removewords('123,1',',')
coin_data <- read.csv('코인 데이터.csv')
coin_data$종가
strtoi(coin_data$종가)
strtoi(removewords(coin_data$종가,c(',','.')))
coin_data %>%
  mutate(
    종가 = strtoi(removewords(coin_data$종가,c(',','.'))) / 100,
    오픈 = strtoi(removewords(coin_data$오픈,c(',','.'))) / 100,
    고가 = strtoi(removewords(coin_data$고가,c(',','.'))) / 100,
    저가 = strtoi(removewords(coin_data$저가,c(',','.'))) / 100
  )
coin_model <- lm(종가~오픈+저가+고가,data = coin_data)
summary(coin_model)

환율 <- read.csv('환률.csv')
  
