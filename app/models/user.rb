class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


  #mount_uploader :image, ImageUploader

  validates :name, presence: true
  #has_many :posts
  #attr_accessible :image, :image_cash, :remote_image
  #has_attached_file :avatar, :styles => { :thumb => "75x75>", :small => "150x150>" }
end
