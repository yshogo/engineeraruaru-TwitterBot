require 'twitter'

class Tweet

  def initialize
    @text = ["Hello Twitter!","Hello Ruby"]

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "YcHDyWexe6qtKp8oH1l190WO1"
      config.consumer_secret = "ojQxO3Wf4OjWUMfuoFPhvPaTewxnjOuMo0OhE41xCJkLyafI0W"
      config.access_token = "864684963848794112-7feOoUYCvZqmtGYsZFJImS3KnW5Cur2"
      config.access_token_secret = "cFGf1aEbaY9ShpfQFULt8eenb3V3smNgfWaTvLbvniqzj"
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private
  def update(tweet)
    begin
      @client.update(tweet)
    rescue => e
      nil #TODO
    end
  end
end

#randon_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end