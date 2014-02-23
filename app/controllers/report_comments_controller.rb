class ReportCommentsController < ApplicationController
  def create
    @report_comment = ReportComment.new(comment_params)

    if @report_comment.save
      flash[:alert] = "Comment saved"
      redirect_to(:back)
    else
      flash[:errors] = @report_comment.errors.full_messages
      redirect_to(:back)
    end
  end

  def destroy
    @report_comment = ReportComment.find(params[:id])
    @report_comment.destroy
    redirect_to(:back)
  end

  private

  def comment_params
    params.require(:report_comment).permit(:body, :ta_id, :daily_report_id)
  end

end
