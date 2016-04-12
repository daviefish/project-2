class TopicsController < ApplicationController
  def index
    @topics = Topic.where(user_id: params[:id])
  end

  def new
    @topic_id = params[:user_id]
  end

  def show
  end

  def edit
  end

  def create
    # title = params[:title]
    # date = params[:date]
    # content = params[:content]
    # user_id = params[:user_id]

    # t = Topic.new
    # t.title = title
    # t.date = date
    # t.content = content
    # t.user_id = user_id
    # t.save

    Topic.create({
      title: params[:title],
      date: params[:date],
      content: params[:content],
      user_id: params[:user_id]
    })

    redirect_to '/topics'

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
