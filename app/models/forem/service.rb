module Forem
  class Service
    def create_post(topic_id, post_params)
      topic = Topic.find(topic_id)
      raise "Invalid topic" if topic.nil?
      Forum.update('post_count = post_count + 1', :forum_id => topic.forum_id)
    end

    def self.create_topic(forum_id, topic_params, user_id)
      Forum.update_all('topics_count=topics_count +1, updated_at = Now()', :id => forum_id)

    end
  end
end
