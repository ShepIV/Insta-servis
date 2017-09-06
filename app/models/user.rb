require 'elasticsearch/model'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  mapping do
    indexes :email, type: 'text'
    indexes :first_name, type: 'string', :index_analyzer => 'simple', :search_analyzer => 'simple'
    indexes :second_name, type: 'string', :index_analyzer => 'simple', :search_analyzer => 'simple'
  end
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

  # def full_name
  #   "#{first_name} #{second_name}"
  # end

  def as_indexed_json (options={})
    self.as_json({
      only: [:id, :first_name, :second_name],
      include: [:posts],
      # methods: [:full_name]
     })
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['first_name', 'second_name']
                }
            },
            highlight: {
              pre_tags: ['<em>'],
              post_tags: ['</em>'],
              fields: {
                  first_name: {},
                  second_name: {}
            }
        }
      }
    )
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :first_name, analyzer: 'english'
      indexes :second_name, analyzer: 'english'
    end
  end

  #attr_accessible :image, :image_cash, :remote_image
  #has_attached_file :avatar, :styles => { :thumb => "75x75>", :small => "150x150>" }
end
# User.import
# @user = User.search('fion').records