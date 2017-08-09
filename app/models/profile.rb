class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  belongs_to :user
end
