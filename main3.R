# txt
temp <- read.table('day3.txt',header = TRUE, sep = ',',nrows = 4)
# 상품 정보.txt파일 만들어서 읽어온 후 출력하기
# 상품 정보는 상품 이름, 상품 가격, 상품 재고 데이터 보유
# 상품은 10개가 있으며 그중 뒤쪽 5개만 출력
# csv
temp <- read.csv('day3-2.csv')
# xlsx -> 외부 패키지
install.packages('readxl')
library(readxl)
temp <- read_xlsx('day3-3.xlsx',sheet=1)
temp <- data.frame(temp)

# 데이터 확인
data('women')


# 통계 확인
head(cars)
tail(cars)
str(cars)
summary(cars)

# 파생변수
cars$zeroback <- cars$speed * 0.5
data('cars')

# 정지 거리의 절반을 드리프트
cars$drift <- cars$dist * 0.5
cars$accel <- cars$speed / cars$zeroback

# 속도가 5 이하인 것은 저속 주행
# 속도가 20 이상인 것은 과속 주행
# 그외 속도는 정속 주행
cars$주행 <- ifelse(cars$speed <= 5, '저속 주행', ifelse(cars$speed >= 20, '과속 주행', '정속 주행'))

# 저속 주행인데 정지거리가 5 이하인 것은 정상
# 정속 주행인데 정지거리가 15 이하인 것은 정상
# 그외 전체 비정상
cars$상태 <- ifelse(cars$주행 == '저속 주행',  
                  ifelse(cars$dist <= 5, '정상', '비정상'),
                  ifelse(cars$주행 == '정속 주행',
                         ifelse(cars$dist <= 15, '정상', '비정상'),
                         '비정상'))
# 인덱싱,슬라이싱
cars[cars$주행 == '저속 주행',] # 전체 탐색
cars[which(cars$주행 == '저속 주행'),] # 일부 탐색

# 저속 주행이면서 비정상이거나
# 정속 주행이면서 비정상인 차량 전체 검색
cars[which((cars$주행 == '저속 주행' & cars$상태 == '비정상')),]
cars[which((cars$주행 == '정속 주행' & cars$상태 == '비정상')),]

# &, | -> AND, OR
TRUE & FALSE
FALSE | TRUE
c(T,T) & c(F,T)

# 집합
# 합집합(union), 교집합(intersect), 차집합(setdiff)
setdiff(c(1,2),c(2,3))
setdiff(c(2,3),c(1,2))

cars[
  setdiff(
    which(cars$dist>0),
    union(
      intersect(which(cars$주행 == '저속 주행'),which(cars$상태 == '비정상')),
      intersect(which(cars$주행 == '정속 주행'),which(cars$상태 == '비정상'))
      )
  )
  ,]

# 전체 평균 속도 +10% 보다 빠른 차량을 고속 차량
# 전체 평균 속도 -10% 보다 느린 차량을 저속 차량
# 그외 차량을 일반 차량

cars$종류 <- ifelse(
  cars$speed < mean(cars$speed) * 0.9, '저속 차량',
  ifelse(cars$speed > mean(cars$speed) * 1.1, '고속 차량', '일반 차량'))

# Tree 정보를 이용하여
# 나무 이름을 파생변수로 추가
# 나무 나이를 이용하여 나무의 크기 파생변수 추가
# 나무의 이름과 크기를 이용하여 나무의 가치 파생변수 추가
# 일정 이상의 가치를 가진 나무의 이름과 나이만 출력
tree <- Orange
tree$name <- ifelse(tree$Tree == 1,'오렌지 나무',
                    ifelse(tree$Tree == 2,'감 나무',
                           ifelse(tree$Tree==3,'소나무',
                                  ifelse(tree$Tree==4,'대나무',
                                         ifelse(tree$Tree==5,'야자수','없음'
                                                )))))
tree$size <- tree$age * 20 + 1000
tree$value <- tree$size / 20 * ifelse(tree$Tree == 1,60,
                                     ifelse(tree$Tree == 2,70,
                                            ifelse(tree$Tree==3,30,
                                                   ifelse(tree$Tree==4,15,
                                                          ifelse(tree$Tree==5,55,0
                                                          )))))
tree[which(tree$value >= mean(max(tree$value),mean(tree$value))),]

