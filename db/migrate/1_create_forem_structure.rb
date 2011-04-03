class CreateForemStructure < ActiveRecord::Migration
  def self.up

    create_table :forem_forums do |t|
      t.string :title
      t.text :description

      t.integer :topics_count, :default => 0
      t.integer :posts_count, :default => 0
      t.integer :position, :default => 0
      t.text :description_html
      t.integer :state, :default => 0
      t.string :permalink
      t.timestamps

    end
    add_index :forem_forums, :position
    add_index :forem_forums, :permalink
    add_index :forem_forums, :updated_at

    create_table :forem_topics do |t|
      t.integer :forum_id
      t.integer :user_id
      t.string :subject
      t.integer :hits, :default => 0
      t.integer :sticky, :default => 0
      t.integer :posts_count, :default => 0
      t.boolean :locked, :default => false
      t.string :permalink


      t.timestamps
    end

    add_index :forem_topics, :forum_id
    add_index :forem_topics, :user_id
    add_index :forem_topics, [:updated_at, :forum_id]
    add_index :forem_topics, :permalink
    add_index :forem_topics, [:forum_id, :sticky, :updated_at]



    create_table :forem_posts do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :forum_id
      t.text :body
      t.integer :reply_to_id
      t.text :body_html
      t.string :name
      t.string :email        

      t.timestamps
    end

    add_index :forem_posts, :user_id
    add_index :forem_posts, :topic_id
    add_index :forem_posts, :reply_to_id
    add_index :forem_posts, :created_at
    add_index :forem_posts, [ :topic_id, :created_at]


    load(Rails.root.join('db', 'seeds', 'refinerycms_forem_seeds.rb').to_s)

  end

  def self.down
    drop_table :forem_forums
    drop_table :forem_topics
    drop_table :forem_posts
  end
end

