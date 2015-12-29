class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def self.search(search)
    where("title ILIKE ?", "%#{search}%") 
    where("content ILIKE ?", "%#{search}%")
  end
end
