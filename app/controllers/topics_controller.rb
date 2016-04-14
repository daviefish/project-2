class TopicsController < ApplicationController

  after_action :allow_iframe, only: :embed

  def embed
  end

  def index
    @topics = Topic.all
    @users = User.all
  end

  def new
    @topic_id = params[:user_id]
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attribues(topic_params)
      redirect_to topic_path
    else
      render :edit
    end
  end

  def create
    @user = User.find(session[:user_id])
    @topic = @user.topics.new({
      title: params[:title],
      date:  params[:date],
      content: params[:content],
      video: params[:video],
    })
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def destroy
    id = params[:id]
    topic = Topic.find_by(id: id)
    topic.destroy
    redirect_to '/topics'
  end

private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

  def topic_params
    params.require(:topic).permit(:title, :date, :content, :user_id)
  end

end

