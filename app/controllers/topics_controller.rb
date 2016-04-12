class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
  end

  def edit
  end

  def create
    message = params[:message]
    user_id = params[:user_id]
    ll = Topic.new
    ll.message = message
    ll.lover_id = lover_id
    # INSERT INTO love_letters
    ll.save
  end

private

  def topic_params
    params.require(:topic).permit(:title, :date, :content, :user_id)
  end

end
