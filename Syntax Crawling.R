library(twitteR)
options(httr_oauth_cache=T)
consumer_key <- '2H0eQQyikJCcliKgzHA1H4yMi'
consumer_secret <- 'eCpt709NuZgc9whJFqHCCjXzHeAVDZxo0aeBhVqgCLg7d7t9UU'
access_token <- '306680209-szAuBJkqPYdL3h98V8lpOEHNnmL0hneI40fe7vm9'
access_secret <- 'xQOlUwvG2eLjWqXf0xx8Hm0JwsAbHujvf0UZdhCzvQjdS'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
BRI <- searchTwitter('kontakBRI', lang="id", n=15000, resultType="recent")
write.csv(twListToDF(BRI), file="crawbri.csv")
mandiri <- searchTwitter('mandiricare', lang="id", n=15000, resultType="recent")
write.csv(twListToDF(mandiri), file="crawmandiri.csv")

