class AnnotationsController < ApplicationController
  before_filter :require_logged_in

  def create
    a = Annotation.create!(params[:annotation])
    if a.save
      render :json => a
    else
      render :json => a.errors.full_messages
    end
  end
end
