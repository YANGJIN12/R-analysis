library(dplyr)

# view
mtcars %>%
  mutate(
    기름소모량=mpg
  ) %>%
  View()


# 그래프 - 대용량의 데이터의 파악에 사용되는 구조
# 기존 그래프
# plot
plot(1:10000, 10000:1) #plot(x축,y축)
plot(mtcars$qsec, mtcars$wt)

#par(mtfrow=c(2,2))

# plot option
plot(mtcars$qsec, mtcars$wt, xlim=c(15,20), ylim=c(1,5)) # lim > limit
plot(mtcars$qsec, mtcars$wt, xlab='speed', ylab='weight') # lab > label
plot(mtcars$qsec, mtcars$wt, main='메인제목', sub='서브제목') #
plot(mtcars$qsec, mtcars$wt, col='blue')
plot(mtcars$qsec, mtcars$wt, type='s') # p, l, o, h, s
plot(mtcars$qsec, mtcars$wt, type='p') # point
plot(mtcars$qsec, mtcars$wt, type='l') # line

plot(1:10,c(1,2,3,4,8,6,7,8,9,10), type='l')


graph_test_data <- mtcars %>%
  mutate(
    speed=max(qsec) + 10 - qsec
  ) %>%
  arrange(
    speed,
    wt
  ) %>% 
  select(speed,wt)
graph_test_data
plot(graph_test_data$speed, graph_test_data$wt, xlab='speed', ylab='weight', xlim=c(9,20), ylim=c(0.5,6),type='l')
graph_test_data2 <- graph_test_data %>%
  mutate(
    speed=ifelse(speed<12,NA,speed),
    wt=ifelse(wt>4.5,NA,wt)
  ) %>%
  na.omit()
plot(graph_test_data2$speed, graph_test_data2$wt, xlab='speed', ylab='weight', xlim=c(9,20), ylim=c(0.5,6),type='l')

# 새로운 객체 <- mtcars
# 속도, 무게 파생변수 만들기
# 차량 가격 파생 변수 만들기
# 그래프를 이용하여 속도, 무게간 이상치 제거
# 그래프를 이용하여 자량가격, 속도간 이상치 제거
# 이상치가 제거된 차량들의 평균 속도, 무게, 차량 가격 뽑아보기

newmtcars <- mtcars 
newmtcars %>%
  mutate(
    weight = wt * wt* 10,
    speed = max(qsec) + 17.5 - qsec,
    price = round((speed ^ 3 - weight) ^ 2, -3)
  ) %>%
  select(weight, speed, price)

plot(newmtcars$speed, newmtcars$weight, type='p')
plot(newmtcars$speed, newmtcars$price, type='p')
# weight 250~300
# speed 0~18
# 2억 4천 이상
newmtcars <- newmtcars %>%
  mutate(
    speed=ifelse(speed<19,NA,speed),
    weight=ifelse(weight>250,NA,weight),
    price=ifelse(price>240000000,NA,price)
  ) %>%
  na.omit() %>% 
  summarise(
    speedmean=mean(speed),
    weightmean=mean(weight),
    pricemean=mean(price)
  )
newmtcars

plot(1:10,1:10)
abline(h=240000000)
abline(v=19)
abline(0,1) 
# y = 1.5x + 2 x = 1, y = 3.5
abline(mean(newmtcars$weight), mean(newmtcars$speed))# 직선 공식

# dotchart
rownames(mtcars)
dotchart(mtcars$qsec, labels = rownames(mtcars), cex=0.7)

# barplot
t <- matrix(
  1:40, ncol=2)
barplot(t)

# mtcars의 속도 파생 변수를 만들고
# 속도 파생변수를 dotchart로 그려보기
dot <- mtcars %>%
  mutate(
    speed=max(qsec) + 17.5 - qsec
  ) %>%
  select(speed)
dotchart(dot$speed, labels = rownames(dot), cex = 0.7)
# mtcars의 속도 파생 변수를 만들고
# 속도 파생변수를 barplot으로 그려보기
bar <- mtcars %>%
  mutate(
    speed=max(qsec) + 17.5 - qsec
  ) %>%
  select(speed)
barplot(dot$speed, names.arg = rownames(dot), cex.axis = 0.7, cex.names = 0.7)
pie(c(1,2,3,4), labels = c('A','B','C','D'))

pie(table(mtcars$vs))


# mtcars의 vs 빈도수가 더 적은 차량들을 대상으로
# 속도 평균을 내고
# 해당 속도보다 빠른 속도를 가진 mtcars의 모든 차량을 대상으로 
# qsec의 dotchart 그래프를 그리기
t <- mtcars %>%
  filter(
    vs == 1
  )
q <- mean(t$qsec)
e <- mtcars %>%
  filter(
    q < qsec
  )
dotchart(e$qsec)

