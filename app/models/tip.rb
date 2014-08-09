class Tip < ActiveRecord::Base
DIFFICULTY=%w(Easy Medium Hard)
	belongs_to :condition_name
	belongs_to :symptom_name
	belongs_to :tip_type
	has_many :taggings
	has_many :tags, through: :taggings
	validates_presence_of :title, :condition_name_id, :symptom_name_id, :tip_type_id
  belongs_to :user
  validates :user_id, presence: true
  
def all_tags
    tags.map(&:name).join(", ")
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).tips
  end

  def self.tag_counts
    Tag.select("tags.name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
def self.tip_owner(user_id)
User.find_by id: user_id
end


end