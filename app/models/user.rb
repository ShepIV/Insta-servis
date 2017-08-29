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
  has_many :posts, dependent: :destroy
  has_many :comments
  #validates :name, presence: true


  acts_as_followable
  acts_as_follower
  acts_as_liker

  acts_as_messageable



  def mailboxer_name
    self.first_name
  end

  def mailboxer_email(object)
    self.email
  end

  #attr_accessible :image, :image_cash, :remote_image
  #has_attached_file :avatar, :styles => { :thumb => "75x75>", :small => "150x150>" }
end
