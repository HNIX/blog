class AddLinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :link, :string
    add_column :posts, :type, :string
  end
end
