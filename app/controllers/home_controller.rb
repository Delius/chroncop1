class HomeController < ApplicationController

	client = Twitter::REST::Client.new do |config|
		config.consumer_key= "Bdyx2U1waoNMEXn78nGdd14t2"
		config.consumer_secret="0YPMNPd7V4p36Zzj5xzBfweVqPS4IhOdlE99Txun1eW2giGO6C"
		config.access_token= "168429845-WRHvWvXos3b9wcqsiPRHCCdJVvnHaJetdU4YbIDr"
		config.access_token_secret = "FTlz8R1BkRhN7jzL1kwoSX6TytmTrTs2lhsn8v2Semizm"
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
