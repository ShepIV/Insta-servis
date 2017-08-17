class Like < Socialization::ActiveRecordStores::Like
  belongs_to :user
  belongs_to :post
end
