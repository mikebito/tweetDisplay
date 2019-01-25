require 'bundler/setup'
require 'sinatra'
Bundler.require
require 'sinatra/reloader' if development?
require 'twitter'
require 'pp'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "bf1wlM91D9XYRN9voC4Ibs26d"
  config.consumer_secret     = "gQsJh5TlPh6RBZlIJNQ14N2BhMOxRpLppeyaercdVnZKG8ozfe"
  config.access_token        = "785420680233750528-tfXh6FMxCqAoqLtCsoMc4hLfIX0Or3H"
  config.access_token_secret = "fwT1neZbtFHFgqC18fjyXswTQ0EMIs7xBaSRQ0Af34LRR"
end

get '/' do
  erb :index
end


  post '/tweets' do
    @tweets = @client.home_timeline.each do |tweet|
      puts "\e[1m" + tweet.user.name + "\e[100m" + "[ID:" + tweet.user.screen_name + "]"
      puts "\e[0m" + tweet.text
    end
  end

 @client.home_timeline.each do |tweet|
    puts "\e[1m" + tweet.user.name + "\e[100m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
  end



# @tweets = []
# since_id = 0

# if params[:keyword].present?
#     @tweets = client.search(ARGV[0], count: 10, result_type: "recent", exclude: "retweets", since_id: since_id) do |status|
#     end
#   end

# client.search(ARGV[0], :count => 100, :result_type => "recent", :since_id => since_id).results.reverse.map do |status|
#     # Tweet ID, ユーザ名、Tweet本文、投稿日を1件づつ表示
#     "#{status.id} :#{status.from_user}: #{status.text} : #{status.created_at}"

#     p status.id
#     p "@" + status.from_user
#     p status.text
#     p status.created_at

#     print("\n")

#     # 取得したTweet idをsince_idに格納
#     # ※古いものから新しい順(Tweet IDの昇順)に表示されるため、
#     #  最終的に、取得した結果の内の最新のTweet IDが格納され、
#     #  次はこのID以降のTweetが取得される

#     since_id=status.id


# end





