class Shout < ActiveRecord::Base
	belongs_to :user
	default_scope { order("created_at DESC")}
	belongs_to :content, polymorphic: true

	def self.text_shouts
		where(content_type: 'TextShout')
	end

	searchable do
		text :content do
			content.index
		end
	end

	def to_partial_path
		"shouts/shout"
	end

# moved to search.rb
  # def self.search term
  # 	text_shouts = TextShout.where("body LIKE ?", "%#{term}%") #ILIKE for postgres
  # 	where(content_type: 'TextShout', content_id: text_shouts)
  # end
end
