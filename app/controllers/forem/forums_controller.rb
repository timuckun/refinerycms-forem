module Forem
  class ForumsController < Forem::ApplicationController

    #crudify Forem::Forum,:title_attribute => :title
    before_filter :authenticate_forem_admin, :only => [:new, :create]
    

     def destroy
        @forum = Forem::Forum.find(params[:id])  
        if current_user&&@forum.destroy  
          flash[:notice] = t("forem.forum.deleted")
        else
          flash[:error] = t("forem.forum.cannot_delete")
        end
        respond_to do |format|
          format.html { redirect_to forums_path }
          format.js
        end
    end
      
      
    def index 
      @forums = Forem::Forum.paginate( :page => params[:page], :per_page => 3)
    end

    def show
      @forum = Forem::Forum.find(params[:id])
#      @topics_grid = initialize_grid(Topic,
#              :conditions => ['forum_id = ?', @forum.id],
#              :order => 'forem_topics.created_at',
#              :order_direction => 'desc',
#              :per_page => 40
#      )
    end
    
    def new
      @forum = Forem::Forum.new
    end
    
    def create
      @forum = Forem::Forum.new(params[:forum])
      if @forum.save
        flash[:notice] = t("forem.forum.created")
        redirect_to @forum
      else
        flash[:error] = t("forem.forum.not_created")
        render :action => "new"
      end
    end
  end
end