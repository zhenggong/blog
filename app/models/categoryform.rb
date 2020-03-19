class Categoryform
  include Mongoid::Document
  store_in collection: "mongodb_blog_development", client: "default"
  field :title, type: String
  field :element, type: Hash
  embedded_in :category
  embedded_in :user
end
