class Video < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
