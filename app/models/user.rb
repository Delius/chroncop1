class User < ActiveRecord::Base
  # include Concerns::following // ---> couldnt move code to conncerns see l 26
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable, 
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :username
  validates_uniqueness_of :username

  mount_uploader :image, ImageUploader
  
  has_many :authorizations
  has_many :tips, dependent: :destroy
  has_many :evaluations , class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :tips}, aggregated_by: :sum

  # reputation system 
  def voted_for?(tip)
    evaluations.where(target_type: tip.class, target_id: tip.id).present?
  end

  # folowing folow followers section
  has_many :shouts
  
  # --- couldn't move to concerns hangs the rails server ?----------------

  has_many :followed_user_relationships,
  foreign_key: :follower_id,
  class_name: 'FollowingRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, 
  foreign_key: :followed_user_id, 
  class_name: 'FollowingRelationship'
  has_many :follower_relationships, through: :follower_relationships

  def following? user
    followed_user_ids.include? user.id
  end
  def can_follow? user 
    self != user
  end

  def follow user
    followed_users << user
  end

  def unfollow user 
    followed_users.delete(user)
  end



  # -------------??????????? do i need   that?-----------------
  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["provider"]
  #     user.uid = auth["uid"]
  #     user.name = auth["info"]["name"] || ""
  #     user.address = auth["info"]["location"] || ""
  #     user.avatar = auth["info"]["image"] || ""
  #     user.oauth_token = auth["credentials"]["token"] || ""
  #     user.oauth_secret = auth["credentials"]["secret"] || ""
  #   end
  # end










  def self.from_omniauth(auth
       # current_user
       )
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.username = auth.info.nickname
  end
end



 #    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
 #    if authorization.user.blank?
 #      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
 #      if user.blank?
 #       user = User.new
 #       user.password = Devise.friendly_token[0,10]
 #       user.name = auth.info.name
 #       user.email = auth.info.email
 #       auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
 #     end
 #     authorization.username = auth.info.nickname
 #     authorization.user_id = user.id
 #     authorization.save
 #   end
 #   authorization.user
 # end

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
 def password_required?
  super && provider.blank?
end 

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end


end