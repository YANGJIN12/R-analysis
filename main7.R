# 텍스트 마이닝
# 워드 클라우드
# 무작위 문장에서 빈도수가 높은 단어를 찾는 기법
# 2종류
# AI 기법
# 단어 추출 -> 만들어진 사전(조사, 부사)
# KoNLP -> 업데이트가 끊김
# install.packages('KoNLP') # 유일한 한글 텍스트 마이닝 도구
# java jdk
# install.packages('remotes') # GitHub 관리 패키지
# remotes::install_github('haven-jeon/KoNLP',
                        #upgrade='never',
                        #INSTALL_opts=c('--no-multiarch'))

#useSejongDic()

#test <- '나무꾼이 사슴을 숨겨주었습니다.'
#test2 <- '사냥꾼이 나무꾼에게 사슴이 어디에 있느냐 물었습니다.'
#pastetext <- paste(test,test2, collapse = ' ')
#gsubtext <- gsub('\\W',' ',pastetext) # 글자 치환
#extractNoun(gsubtext)

#install.packages('tm')
#install.packages('NLP')
#install.packages('stringr') # 문장 처리 패키지
library(tm)
library(NLP)
library(stringr)

pastetext <- 'What makes a good review?
Gets you details about customer experience
A good customer review is like a digital scrapbook with pictures and memories that your customers took of their experience. It tells you what made them happy – from the product’s benefits, pricing options, or detailed guidance from specific employees on how to use it correctly.

A lot can be learned from reading customer feedback left by people who have bought your product. You’ll uncover exactly why those satisfied customers came back time after time again without hesitation.

Gives specific and constructive feedback
positive review
You know how when you get a really high 5-star review, but there are some negative feedback things mentioned in the response? 

These are not bad reviews. That’s an opportunity for you not as a business owner, but as a brand to show what your business’s policies and procedures are when customers provide feedback. 

You should thank them for taking time out of their day (and yours) by letting you know about these concerns so that you can address them quickly. And besides that – for giving you a good star rating review. If nothing else, this will make future clients even happier knowing they’ll be receiving top-notch service right away.

The best customers lift you up with great reviews
The best reviews are exposing details of the real-life enjoyable experience your customers had with your business. The best reviews show that the experience was so good that decided to write a little more about it online or on social media.

It is important for a business to have positive reviews, especially those who are new. Having detailed and in-depth feedback from customers can help prospects understand what specifically sets you apart as opposed to other companies they may be looking at or considering working with.

Why respond to positive reviews?
You already know that feedback from happy and unhappy customers helps in business improvement. But it’s a good thing when customers share their positive experiences offline and online. And responding to them is an even better thing which can bring you some real benefits, such as:

Responding to your 5-star rating helps your local SEO, so your business name will become search engines’ favorite and rank higher in the local search.
Acknowledging every original review that your customers have for you will help you create a solid customer loyalty base.
Having more responded reviews on Google My Business and other review sites shows potential customers that you truly care for each customer and eventually you’ll get new purchases.
How to respond to positive reviews
No matter if you receive negative reviews or positive testimonials, responding to each of them should be a part of your reputation management strategy. 

You can check how to respond to bad reviews and check these negative review response templates, but now we’ll stick to positive review responses.

Responding to positive reviews is an excellent way of showing gratitude and responsiveness towards your customers. After receiving a 5-star review, it’s important that you take time to respond and let your customers know that the review’s impact is real.

In each response make sure to include the essential elements.

Personalize it
personalized review response
When responding to reviews, it’s important that you keep them personal. You can do that by simply mentioning the reviewer’s name. 

Let your customer know that you aren’t just copy-pasting their response but are truly dedicated and interested in what feedback they have given. Everyone wants to feel acknowledged for their opinion on something.

Don’t take too long to respond
The quicker you respond, the better. 

Responding quickly and positively when someone gives feedback about your company is extremely important! Acknowledge customer reviews with care and don’t take too long for a response.

Vibe with the reviewer
Keep the same level of enthusiasm that your customer has.

The reviewer liked your product. Now you need to keep the same level of enthusiasm for it! Don’t just respond with “thank you,” because that won’t make the customer feel as though they had anything worth talking about or bringing up in their review. 

You want them to feel like this person got excited enough for enjoying your services and taking the time to provide social proof for it.

Review Response Templates by Use Case
Yes, you should keep each response personal and dedicated to the specific customer experience. But it’s always a good help to have few templates of the most common reviews you can use over and over again with a little bit of customization and personalization.

Here are some templates you can use.

1. Response Templates For Hotel Reviews
Review: 

“I stayed at [Hotel Name] for three nights in November 2019. What an amazing hotel. I was greeted with such kindness and this continued throughout my stay. I booked the king room and my room was situated on the 14th floor. The room was fantastic. Clean, modern, and had a fantastic view over [City]. The rooms were big for [City] standards. I can’t complain about this hotel. The gym was great, the rooftop bar was fantastic, and all of the facilities were clean and modern. The restaurant located inside the hotel, [Restaurant Name], was delicious. I dined here for breakfast and dinner.”

Hi [Customer Name],
Thank you for taking the time to review your stay at [Hotel Name]. I’m so glad to hear that our staff were able to make your experience with us a memorable one and that you enjoyed all of the amenities we offer. I will pass on your compliments about [Restaurant Name]’s restaurant – our Executive Chef is quite passionate about his work! We hope that in future visits you’ll have an opportunity to try more of what we have available in this culinary gem. If there are any specific areas where we can improve upon during your next visit, please do let us know as feedback is always welcome here at [Hotel Name].

Response template #1
Review:

“Wonderful place to stay. I don’t normally stay in hostels but this was perfect – the beds are comfortable, and the rooms are quiet despite the fact that if you want to, you can spend time outside with other travelers and the staff – who, by the way, were exceptional. [Employee Name] really went out of her way to make sure everyone got what they needed, whether it was directions, recommendations, or help with their transportation. I had a great time meeting everyone and socializing yet when I wanted to, I could get a quiet night’s sleep.”

Thank you [Customer Name] for your review, we’re so glad to hear that you enjoyed your stay and found our staff helpful.
It’s always great when we can help guests make the most of their time with us – whether it be recommending a restaurant or showing them how to get around town! I’ll let [Employee Name] know that you appreciated her assistance and she will be thrilled.

Response template #2
2. Response Templates For Restaurant Reviews
Review:

“Hands down the best chicken wings I have ever eaten. My partner and I were visiting some friends in the area and these heavenly wings (and a couple of sides of rice) were the only thing requested. The wings themselves had great flavor and AMAZING crunch. But really, I think the crispiness of the wings is what makes the wings so good (and addicting). The sauce was a balanced mix of sweet and spicy (very mild, if I had to rate it), which was also great over rice.”

Thank you for your review, [Customer Name]! 

It sounds like you enjoyed our fried chicken wings. We are so happy to hear that the flavor and crunch were up to par with your expectations.

We take pride in the quality of our food and hope that we can continue delivering great-tasting meals. If there is anything else we can do for you, please let us know!

Response template #3
Review:

“Amazing food. PERIOD. Service is always perfect, food is always on point, and the staff is very friendly and accommodating. Always looking forward to this place with my friends, the fried vanilla ice cream is exceptionally good!“

[Customer Name], thank you for your review! I’m so glad to hear that you enjoyed our food and service. We’re always looking for ways to improve the experience at our restaurant, but it’s great to know that we are on the right track.

Let me know if there is anything else we can do to make your next visit even better.

Response template #4
3. Response Templates For Mobile Apps Reviews
Review:

“This app is super useful and helpful for users that lack advanced knowledge in photo editing. I liked how user-friendly the app is. I would recommend this app to anyone who is looking for a quick and easy way to crop and edit videos. “

Thank you for sharing your experience with [Company Name], [Customer Name]! We’re so glad to hear that our app was easy and intuitive for you.

We’ve been working hard on improving the user experience of the app and we hope this has been reflected in your experience. Our team is always trying to make sure users have a great time using our product, so we are happy to know that’s what happened for you! 

Response template #5
Review:

Amazing app.  There are so many workouts to choose from.  It’s impossible to get bored. They eliminate any excuses because there are workouts for all levels, all time frames, no equipment options, small space options, and even options to have your kids join you. I truly love this app and have had several friends join as well.

[Customer Name], thank you so much for the review!  I’m glad to hear that you’re enjoying your experience with our app.  We are committed to providing a diverse selection of workouts and it’s great to know that we’re meeting this goal.  

Thank you again for taking the time to share your feedback with us – it’s always appreciated.

Response template #6
4. Response Templates For eCommerce Reviews
Review:

“I absolutely love this espresso machine! It works so well. I love that it has the steamer as well. Just make sure to clean the steamer right after you use it so the milk doesn’t stick and clog it up. I’ve only had it for a month now but I’m super impressed with the quality for the price! And the delivery was real quick!“

Thank you so much for your review, [Customer Name]! I am so glad to hear that the machine is working well and that you are enjoying it. We take pride in our customer service, if there’s anything else we can do, please let us know.

Response template #7
Review:

“I can’t say enough about these headphones. They’re excellent for the gym! They don’t fall off and aren’t uncomfortable after a while. The sound is amazing and the controls are easy to use without needing your phone picked up. They don’t hold moisture or water and I just wipe them off after my workout. Very satisfied with this purchase, they come in a sturdy zip-up case and with their own charging cable. The charge lasts a decent amount of time obviously depending on your usage but is well worth the buy! And the color is absolutely adorable!“

Hi [Customer Name], 

Thanks for your review! I’m so happy to hear the headphones are working well for you. 

We love hearing from our customers and we’re always looking for ways to improve our products.
I’ve passed your feedback about the sound quality and ease of use on to our product team – they’ll be thrilled that they were able to make a difference in your life!

Response template #8
In Action: How to respond to Google reviews?
Let’s use these templates and respond to some of your Google Reviews.

In order to make the process more efficient, the reviews management software EmbedReviews has an integrated option that allows you to manage your online reviews and respond to them directly from the dashboard.

It has a direct integration with Google to generate your Google reviews and embed them on your website.

Additionally, you can pick each Google review you want to respond to, paste one of these templates (or write your own) and respond to it real quick – without having to log in to your GMB account.'

text <- read.csv('더미텍스트_영어.txt', header=FALSE)
text <- c(text$V1, text$V2, text$V3, text$V4, text$V5, text$V6, 
  text$V7, text$V8, text$V9, text$V10, text$V11, text$V12, 
  text$V13, text$V14, text$V15)
pastetext <- paste(text, collapse=' ')

gsubtext <- gsub('\\W', ' ', pastetext)
lowertext <- tolower(gsubtext)
# stopwords() # 불용어
# 슬랭 -> 줄임말, 축약어
# as soon as posible -> posible
removetext <- removeWords(lowertext, stopwords())
striptext <- stripWhitespace(removetext)
total <- str_split(striptext,pattern = '\\s+') # split -> 쪼개기
vectortotal <- unlist(total)
ss <- function(temp){
  if(str_length(temp) < 2){
    return('')
  }
  return(temp)
}
sapptext <- sapply(vectortotal, ss, USE.NAMES = FALSE)
tb <- table(sapptext) # 빈도수 체크 함수
tbs <- sort(tb, decreasing = TRUE) # 정렬
rownames(tbs[1:50])

# 워드 클라우드
install.packages('wordcloud')
library(wordcloud)
install.packages('RColorBrewer')
library(RColorBrewer)
display.brewer.all()
RColorBrewer::brewer.pal.info

wordcloud(rownames(tbs[1:50]),tbs[1:50],
          scale = c(4,1),
          random.order = FALSE,
          random.color = FALSE,
          rot.per = 0.4,
          colors = brewer.pal(9,'Blues'))
# 데이터 정제
# 보,보,가위,보,보,가위,보,보,가위,보,보,
a<-table(c('보','보','가위','보','보','가위','보','보','가위','보','보','바위'))
b <- a / sum(a)
sample(c('가위','바위','보'),10,replace = TRUE,prob = b)

# 선형 회귀 분석 - 연속된 데이터
# 의사 결정 나무 - 선택하는 데이터
# 군집 분석 - 범위 데이터




























