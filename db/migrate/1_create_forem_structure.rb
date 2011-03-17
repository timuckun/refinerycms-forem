class CreateForemStructure < ActiveRecord::Migration
  def self.up

    create_table :forem_forums do |t|
      t.string :title
      t.text :description
    end

    create_table :forem_topics do |t|
     t.integer :forum_id
      t.integer :user_id
      t.string :subject

      t.timestamps
    end

    add_index :forem_topics, :forum_id
    add_index :forem_topics, :user_id

     create_table :forem_posts do |t|
      t.integer :topic_id
      t.text :text
      t.integer :user_id
      t.integer :reply_to_id

      t.timestamps
    end

    add_index :forem_posts, :user_id
    add_index :forem_posts, :topic_id
    add_index :forem_posts, :reply_to_id


   load(Rails.root.join('db', 'seeds', 'refinerycms_forem_seeds.rb').to_s)

  end

  def self.down
    drop_table :forem_forums
    drop_table :forem_topics
    drop_table :forem_posts
  end
end

