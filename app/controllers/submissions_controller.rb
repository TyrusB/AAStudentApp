class SubmissionsController < ApplicationController
  def show
    # require that you're either a TA, or it's your submission
    @submission = Submission.find(params[:id])
  end
end
