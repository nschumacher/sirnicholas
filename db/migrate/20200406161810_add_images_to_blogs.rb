class AddImagesToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :main_image, :text
    add_column :blogs, :thumb_image, :text
    change_column :blogs, :body, :text
  end
end
