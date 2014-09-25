

class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]


  # GET /tips
  # GET /tips.json
  def index

    if params[:sort_by].blank?
    @tips = Tip.tagged_with(params[:tag])
    @tips = Tip.find_with_reputation(:votes, :all, order: "votes desc")
    
    
    
      else
        @tips = Tip.where(params[:sort_by])
      end
    
  end

  # reputation system 
def vote
  value = params[:type] == "up" ? 1 : -1
  @tip = Tip.find(params[:id])
  @tip.add_or_update_evaluation(:votes, value, current_user)
  redirect_to :back, notice: "Thank you for voting"
end



  # ------------------------------------------------

def tag_cloud
    @tags = Tip.tag_counts_on(:tags)
  end


  def my_tips
    @tips = current_user.tips.all? { |e|  }
  end



  # GET /tips/1
  # GET /tips/1.json
  def show
  
      @tips = Tip.find(params[:id])
 
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json


# Call twitter and send an update when tip is created

def create

 client = Twitter::REST::Client.new do |config|
   config.consumer_key= ENV["TWITTER_KEY"]
   config.consumer_secret= ENV["TWITTER_SECRET"]
   config.access_token= ENV["TWITTER_TOKEN"]
   config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
 end
# web link adress to be inserted in tweet post aftet tip creation

web_url = Rails.application.routes.url_helpers.tips_url(:host => 'chronicillnesses.co.uk' )
@tip = current_user.tips.new(tip_params)

# posts a tweet to twitter uncomment on production server

client.update( "#fibrotrust just shared  "  "#{@tip.title} tip @ #{web_url}")


# ------------------------------------------------------------------------------------------
respond_to do |format|
  if @tip.save
    format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
    format.json { render :show, status: :created, location: @tip }
  else
    format.html { render :new }
    format.json { render json: @tip.errors, status: :unprocessable_entity }
  end
end
end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  

  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  

  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




# implements act_as_taggable

def tagged
  if params[:tag].present? 
    @tips = Tip.tagged_with(params[:tag])
  else 
    @tips = Tip.postall
  end  
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:title, :votes, :difficulty_level, :condition_name_id, :symptom_name_id, :tip_type_id, :what_needed, :my_tip, :user_id,:tips_url ,:tag_list, :tag )
    end
  end
