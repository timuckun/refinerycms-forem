module Forem
  class Forum < ActiveRecord::Base
    set_table_name 'forem_forums'
    has_many :topics, :dependent => :destroy
    has_many :posts, :through => :topics, :dependent => :destroy

    validates :title, :presence => true
    validates :description, :presence => true
  end
end