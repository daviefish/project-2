class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
    @user = User.find(session[:user_id])
    # create a comment with the user id from sessin
    # and the topic id from params[:id]

    # @user.comments.create({
    #   content: params[:comment][:content],
    # })

    @comment = @user.comments.new ({
      content: params[:comment][:content],
      topic_id: params[:comment][:topic_id]
    })

    if @comment.save
      redirect_to topic_path(@comment.topic)
    else
      render :new
    end
  end
end
