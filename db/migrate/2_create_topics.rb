class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :forem_topics do |t|
      t.integer :forum_id
      t.integer :user_id
      t.string :subject

      t.timestamps
    end
  end
  def self.down
    drop_table :forem_topics
  end
end
