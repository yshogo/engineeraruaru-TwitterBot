require 'twitter'

class Tweet

  def initialize
    @text = ["Macを使う",
             "ターミナルは黒背景に緑文字",
             "USキーボードを使いがち",
             "Appleの新製品発表美は徹夜",
             "机まの周りにどんなけお金かけるの？",
             "土日もプログラミング。もしくは勉強会に参加",
             "トラブル時は殺すを連呼",
             "モニターが２個あると生産性が上がる",
             "帰る直前にトラブル"]

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
      nil
    end
  end
end

#randon_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end