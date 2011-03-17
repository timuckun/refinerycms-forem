class Admin::Forem::ForumsController < Admin::BaseController
  
  def index
    @forums = ::Forem::Forum.all
  end
  
  def new
    @forum = ::Forem::Forum.new
  end
  
  def edit
    @forum = ::Forem::Forum.find params[:id]
  end
  
  def create
    @forum = ::Forem::Forum.new params[:forem_forum]
    
    if @forum.save
      flash[:notice] = t('admin.forem.forums.forum.created', :what => @forum.title)
      redirect_to admin_forem_forums_url
    else
      render :action => 'new'
    end
  end
  
  def update
    @forum = ::Forem::Forum.find params[:id]
    
    if @forum.update_attributes params[:forem_forum]
      flash[:notice] = t('admin.forem.forums.forum.updated', :what => @forum.title)
      redirect_to admin_forem_forums_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @forum = ::Forem::Forum.find params[:id]
    
    @forum.destroy
    flash[:notice] = t('admin.forem.forums.forum.deleted', :what => @forum.title)
    redirect_to admin_forem_forums_url
  end
  
end