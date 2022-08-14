class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(id: :asc)
  end

  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.all.order(id: :asc)

    if logged_in?(:site_admin)
        @blogs = Blog.recent.where(topic_id: @topic.id).page(params[:page]).per(2) # for site admins to see all
    else
        @blogs = Blog.published.recent.where(topic_id: @topic.id).page(params[:page]).per(2) # for non-admins to see only published posts
    end
  end
end
