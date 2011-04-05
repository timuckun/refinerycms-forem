module Forem
  class TopicsController < Forem::ApplicationController
    before_filter :authenticate_forem_user, :except => [:show,:index,:new,:create]
    before_filter :find_forum

    def index
      @topics = find_forum.topics.paginate( :page => params[:page], :per_page => 3)
      # @forums = Forem::Forum.all
    end


    def show
      @topic = @forum.topics.find(params[:id]) 
      
    end

    def new
      @topic = @forum.topics.build
      @topic.posts.build
      @post=@topic.posts.build
      render :layout => request.xhr? ? false : true  
    end
 
    def destroy      
      @topic = @forum.topics.find(params[:id]) 
      if current_user&&@topic.destroy
        # Recalculate topic and post counts
        Forem::Service.recalulate_post_topic_counts(@topic.forum)
        flash[:notice] = t("forem.topic.deleted") 
      else
        flash[:error] = t("forem.topic.cannot_delete")
      end
      respond_to do |format|
        format.html { redirect_to forum_topics_path(@topic.forum)}
        format.js
      end
    end
 
 
 
  
    def create   
      #TODO - I am currently allowing anonymous creation of topics (probably need to change at at later stage) 
      if topic=Forem::Service.create_topic(params["forum_id"], params[:topic].except(:forem_post), current_user&&current_user.id)  
        notice =t("forem.topic.created")
        if  params[:topic][:forem_post] && Forem::Service.create_post( topic.id, params[:topic][:forem_post], current_user&&current_user.id)  
          notice += t("forem.post.created")
        end
        flash[:notice] = notice
        redirect_to  forum_topics_path(@forum)
      else
        flash[:error] = t("forem.topic.not_created")
        render :action => "new"
      end
    end

    private

    def find_forum
      @forum = Forem::Forum.find(params[:forum_id])
    end
  end
end