class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :comments, dependent: :destroy
    #has_many :likes, #dependent: :destroy

    acts_as_likeable
    acts_as_followable
end
