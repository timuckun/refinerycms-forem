module Forem
  class Post < ActiveRecord::Base
    set_table_name 'forem_posts'
     belongs_to :topic
    belongs_to :user
    belongs_to :reply_to, :class_name => "Post"

    has_many :replies, :class_name => "Post",
                       :foreign_key => "reply_to_id",
                       :dependent => :nullify

    validates :body, :presence => true  

    class << self
      def recent_post
       order(:created_at).last 
      end
    end
    


  end
end