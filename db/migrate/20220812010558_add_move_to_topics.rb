class AddMoveToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :move, :string
  end
end
