class SubmissionsController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    # require that you're either a TA, or it's your submission
    @submission = Submission.find(params[:id])

    if @submission.user == current_user || current_user.admin?
      @source_files = @submission.source_files
      @annotations_json = @submission.annotations_json
      render :show
    else
      redirect_to :root
    end
  end

  private


end
