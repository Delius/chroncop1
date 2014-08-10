class Tag < ActiveRecord::Base
has_many :taggings
has_many :tips, through: :taggings

def all_tags=(names)
self.tags = names.split(",").map do |t|
Tag.where(name: t.strip).first_or_create!
end
end

 def all_tags=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).events
  end

  def self.tag_counts
    Tag.select("tags.name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
  end
end