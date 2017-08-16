class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    #belongs_to :profile

    acts_as_likeable
end
