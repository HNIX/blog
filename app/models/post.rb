class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
    where("content LIKE ?", "%#{search}%")
  end
end
