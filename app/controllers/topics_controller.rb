class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @users = User.all
  end

  def new
    @topic_id = params[:user_id]
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  def create
    # t = Topic.new
    # t.title = params[:title]
    # t.date = params[:date]
    # t.content = params[:content]
    # t.user_id = params[:user_id]

    # if t.save
    #   redirect_to topic_path(t)
    # else
    #   render :new
    # end

    @user = User.find(session[:user_id])
    @topic = @user.topics.new ({
      title: params[:title],
      date:  params[:date],
      content: params[:content],
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

  def topic_params
    params.require(:topic).permit(:title, :date, :content, :user_id)
  end

end
