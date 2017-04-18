class Image < ApplicationRecord
	belongs_to :user
  has_attached_file :image

	# must have image
	 validates :image, attachment_presence: true
	 validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	 # check size
	 # validates_attachment :image, size: { in: 0..100.kilobytes }
	 # check types
	 # validates_attachment :image, content_type: { content_type: "image/jpg" }
end
