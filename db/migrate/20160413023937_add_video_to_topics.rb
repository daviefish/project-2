class AddVideoToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :video, :string
  end
end
