class PhotoShout < ActiveRecord::Base
	has_attached_file :image, styles: {
		shout: "100x200>"
	}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
