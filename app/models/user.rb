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


  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_one :profile, dependent: :destroy
  #validates :name, presence: true

  after_create :create_profile

  acts_as_followable
  acts_as_follower

  #attr_accessible :image, :image_cash, :remote_image
  #has_attached_file :avatar, :styles => { :thumb => "75x75>", :small => "150x150>" }
end
