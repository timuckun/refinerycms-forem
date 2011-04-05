require 'spec_helper'

describe "Forem::Service" do
  before(:each) do
     @forum=Forem::Forum.create(:title=>"title one",:description =>"desription one")
  end

it "add one to topics_count when topic is added " do
  @forum.topics_count.should == 0
  Forem::Service.create_topic(@forum.id, {:subject=>"topic first one"}, nil)  
  @forum.reload
  @forum.topics_count.should == 1
end

it "add one to post_count when post is added " do
  topic=@forum.topics.create(:subject=>"topic first one")
  @forum.posts_count.should == 0
  Forem::Service.create_post( topic.id, {:body=>"the body of the message",:name=>"john",:email=>"some@one.co.nz"}, nil)
  @forum.reload
  @forum.posts_count.should == 1
end
end

describe "Forem::Forum" do
  before(:each) do
     @forum=Forem::Forum.create(:title=>"title one",:description =>"desription one")
     @topic=Forem::Service.create_topic(@forum.id, {:subject=>"topic first one"}, nil)  
     @post1=Forem::Service.create_post( @topic.id, {:body=>"the body of the message",:name=>"john",:email=>"some@one.co.nz"}, nil)
     @post2=Forem::Service.create_post( @topic.id, {:body=>"the body of the message",:name=>"john",:email=>"some@one.co.nz"}, nil)
     @forum.reload
  end

  it "should recalcuate number  of posts when a post is destroyed " do
    @forum.posts_count.should == 2
    @post2.destroy
    Forem::Service.recalulate_post_topic_counts(@forum)
    @forum.reload.posts_count.should == 1 
    @forum.reload.topics_count.should == 1 
    @topic.destroy
    Forem::Service.recalulate_post_topic_counts(@forum)
    @forum.reload.posts_count.should == 0 
    @forum.reload.topics_count.should == 0    
  end 

end
