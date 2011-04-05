module Forem
  class Service  
    def self.recalulate_post_topic_counts(forum)
      Forum.update_all("posts_count = #{forum.posts.count},topics_count=#{forum.topics.count} ", :id => forum.id)
    end
    
    def self.create_post(topic_id, post_params, user_id)
      topic = Topic.find(topic_id)
      raise "Invalid topic" and return  if topic.nil?
      Forum.update_all('posts_count = posts_count + 1', :id => topic.forum.id)
      post=topic.posts.create(post_params)
      post.save!&&post
    end

    def self.create_topic(forum_id, topic_params, user_id)
      Forum.update_all('topics_count=topics_count +1, updated_at = Now()', :id => forum_id)
      topic=Topic.new(topic_params)
      topic.user_id = user_id
      topic.forum_id = forum_id
      topic.save!&&topic
    end
  end
end
