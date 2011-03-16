class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :forem_posts do |t|
      t.integer :topic_id
      t.text :text
      t.integer :user_id
      t.integer :reply_to_id

      t.timestamps
    end
  end
  def self.down
    drop_table :forem_posts
  end
end
