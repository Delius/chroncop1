class HomeController < ApplicationController

	client = Twitter::REST::Client.new do |config|
		config.consumer_key= ENV["TWITTER_KEY"]
		config.consumer_secret= ENV["TWITTER_SECRET"]
		config.access_token= ENV["TWITTER_TOKEN"]
		config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
		end
		@friends = client.friends.take(20)



	@friends.each do |f|
		location = f.location
		# Friend.get_friend_data(f,location,user_id)
	end

	
	def index
	end

	def tip_params
      params.require(:friend).permit(:user_id, :location, :name , :screen_name)
    end
end
