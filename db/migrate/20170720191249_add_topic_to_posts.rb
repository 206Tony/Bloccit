class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
  	# #5 named migration
    add_column :posts, :topic_id, :integer
    # #6 created index on the topic_id w/ generator
    # an index improves the speed of operations on db table
    add_index :posts, :topic_id
  end
end
