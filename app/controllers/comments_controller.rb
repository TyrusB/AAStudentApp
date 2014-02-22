class CommentsController < ApplicationController
  before_filter :require_logged_in

  def create
    c = Comment.create!(params[:comment])
    if c.save
      render :json => c
    else
      render :json => c.errors.full_messages
    end
  end
end
