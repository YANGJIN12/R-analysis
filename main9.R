# 의사 결정 나무 - 예측 기법 - 연속되지 않는 데이터
# 쇼핑몰 구매 목록, 가장 많이 본 영상 카테고리...
# 데이터 샘플링 제작

# rpart
install.packages("rpart")
library(rpart)
install.packages('rpart.plot')
library('rpart.plot')
# 나이에 따라서                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
random <- function(min, max, weights = NA){
  if (is.na(weights)){
    return(sample(min:max,1))
  }
  return(sample(min:max,1,prob = weight / sum(weights)))
}
choice <- function(values,weights = NA){
  if(is.na(weights)){
    return(sample(values,1))
  }
  return(sample(values,1,prob = weights / sum(weights)))
}
createdata <- function(){
  return(data.frame(
    잔고 = random(1000, 500000) * 1000,
    나이 = random(20,60),
    직업 = choice(
      c('대학생','직장인','백수','경영인','아르바이트','사무직')),
    성별 = choice(c('남','여')),
    구매품 = choice(c('전자제품', '화장품','생활용품','식품','음료'))
  ))
}
createdatas <- function(counts){
  dump <- createdata()
  for(i in 1:1000){
    dump <- dump %>%
      bind_rows(createdata())
  }
  return(dump)
}
dump <- createdatas(1000+300) # 1000개가 Traningset, 300개가 정답용
data.frame(
  잔고 = dump$잔고[-(1000:1300)],
  나이 = dump$나이[-(1000:1300)],
  직업 = dump$직업[-(1000:1300)],
  성별 = dump$성별[-(1000:1300)],
  구매품 = dump$구매품[-(1000:1300)]
)
answer <- data.frame(
  잔고 = dump$잔고[-(1:999)],
  나이 = dump$나이[-(1:999)],
  직업 = dump$직업[-(1:999)],
  성별 = dump$성별[-(1:999)],
  구매품 = dump$구매품[-(1:999)]
)
dump$잔고[-(1000:1300)]
model <- rpart(구매품 ~ ., data = traning, method = 'class')
prune(model, cp=0.0250)
rpart.plot(model)
quest <- predict(model, newdata = answer, type = 'class')
정답 <- table(quest, answer$구매품)
sum(정답[정답[row(정답)]==정답[col(정답)]]) / sum(정답) # 정답률
1 - sum(정답[정답[row(정답)]==정답[col(정답)]]) / sum(정답) # 오답률

model<-rpart(species.,data=iris)




 # 통장 잔고, 성별, 나이, 직업을 000000토대로 구매 예측
# 예측 데이터 > 전자제품, 화장품 같이 카테고리
# 500000, 남, 27, 직장인
# 500000, 여, 32, 직장인


