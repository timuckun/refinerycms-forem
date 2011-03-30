module Forem
  class TopicsController < Forem::ApplicationController
    before_filter :authenticate_forem_user, :except => [:show]
    before_filter :find_forum

    def show


      @topic = @forum.topics.find(params[:id])
    end

    def new
      @topic = @forum.topics.build
      @topic.posts.build
    end
  
    def create

       #{"commit"=>"Create Topic", "topic"=>{"subject"=>"test Topic"}, "authenticity_token"=>"Tp6D2bzGK2whGn9ycwzVyn2PFsvQ5I2GxmNkJIbDlh4=", "utf8"=>"✓", "forum_id"=>"1", "locale"=>:en}



      if Forem::Service.create_topic(params["forum_id"], params[:topic], current_user.id)
        flash[:notice] = t("forem.topic.created")
        redirect_to forum_path(@forum)
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