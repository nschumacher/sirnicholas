class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  access all: [:show, :index], user: {except: [:new, :create, :update, :edit, :destroy]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
        @blogs = Blog.recent.page(params[:page]).per(5)# for site admins to see
    else
        @blogs = Blog.published.recent.page(params[:page]).per(5) # for non-admins to see only published posts
    end
    @topics = Topic.all.order(id: :asc)
    @page_title = "The Round Table | SirNicholas.io"
    @seo_keywords = "Nick Nicholas Schumacher Salesforce Round Table SirNicholas"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
        @blog = Blog.includes(:comments).friendly.find(params[:id])
    
        @comment = Comment.new
        @seo_keywords = @blog.body.to_plain_text
        @page_title = @blog.title
        @related_blogs = Blog.published.recent.where('topic_id = ? AND id != ?', @blog.topic.id, @blog.id).page(params[:page]) # for non-admins to see only published posts
    else
        redirect_to blogs_path, notice: "You are not authorized to access this page."
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: "Post Status has been updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status, :tag_list, :main_image, :thumb_image)
    end
end
