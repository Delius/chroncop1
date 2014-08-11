client = Twitter::REST::Client.new do |config|
		config.consumer_key= ENV["TWITTER_KEY"]
		config.consumer_secret= ENV["TWITTER_SECRET"]
		config.access_token= "168429845-anokGzKl2dUM4iTpN44KfTpVmtvZGQlJMUt6hqZT"
		config.access_token_secret = "gQEWaSpTfRtvWdXwhqCXzsiKZYTihIh23j0skbo5tzT73"

    end