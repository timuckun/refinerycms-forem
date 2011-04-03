module Forem
  class PostsController < Forem::ApplicationController
    before_filter :authenticate_forem_user, :except => [:show,:index,:new,:create]
    before_filter :find_topic

    def index
      @posts = find_topic.posts
    end

    def new
      @post = @topic.posts.build  
      render :layout => request.xhr? ? false : true 
    end
  
    def create   
      if @post=Forem::Service.create_post( params[:topic_id], params[:forem_post], current_user&&current_user.id)
        flash[:notice] = t("forem.post.created")
        redirect_to forum_topic_posts_path(@post.topic.forum, @post.topic)
      else
        params[:reply_to_id] = params[:post][:reply_to_id]
        flash[:error] = t("forem.post.not_created")
        render :action => "new"
      end
    end
    
    def destroy
      @post = @topic.posts.find(params[:id])
      if current_user.login == @post.user.login
        @post.destroy
        flash[:notice] = t("forem.post.deleted")
      else
        flash[:error] = t("forem.post.cannot_delete")
      end
      
      redirect_to [@topic.forum, @topic]
    end

    private

    def find_topic
      @topic = Forem::Topic.find(params[:topic_id])
    end
  end
end