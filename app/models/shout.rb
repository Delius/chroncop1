class Shout < ActiveRecord::Base
	belongs_to :user
	default_scope { order("created_at DESC")}
	belongs_to :content, polymorphic: true
	
	def self.photo_shouts
		where(content_type: 'PhotoShout')
	end

	# searchable do
	# 	text :content do
	# 		content.index
	# 	end
	# end

	def to_partial_path
		"shouts/shout"
	end

# moved to search.rb
  def self.search term
  	photo_shouts = PhotoShout.where("description LIKE ?", "%#{term}%") #ILIKE for postgres
  	where(content_type: 'PhotoShout', content_id: photo_shouts)
  end
end
