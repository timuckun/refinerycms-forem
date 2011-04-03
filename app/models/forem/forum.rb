module Forem
  class Forum < ActiveRecord::Base
    set_table_name 'forem_forums'
    has_many :topics, :order => "forum_id, #{Topic.table_name}.sticky desc, #{Topic.table_name}.updated_at desc", :dependent => :destroy
    has_many :posts, :through => :topics, :dependent => :destroy

    validates :title, :presence => true
    validates :description, :presence => true

    attr_readonly :posts_count, :topics_count



  # this is used to see if a forum is "fresh"... we can't use topics because it puts
  # stickies first even if they are not the most recently modified
  #  has_many :recent_topics, :class_name => 'Topic', :include => [:user],
  #    :order => "#{Topic.table_name}.last_updated_at DESC",
  #    :conditions => ["users.state == ?", "active"]
  #  has_one  :recent_topic,  :class_name => 'Topic', :order => "#{Topic.table_name}.last_updated_at DESC"
  #
  #  has_many :posts,       :order => "#{Post.table_name}.created_at DESC", :dependent => :delete_all
  #  has_one  :recent_post, :order => "#{Post.table_name}.created_at DESC", :class_name => 'Post'



  # oh has_finder i eagerly await thee
  scope :ordered, order('position asc')
  scope :by_freshness, order('updated_at desc')
  

  end
end