class Video < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :link, presence: true
  validates :title, presence: true
  validates :picture, presence: true
end
