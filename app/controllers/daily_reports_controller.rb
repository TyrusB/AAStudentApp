class DailyReportsController < ApplicationController

  def index
    @daily_reports = current_user.daily_reports
    render :index
  end

  def new
    @daily_report = current_user.daily_reports.new
    render :new
  end

  def create
    @daily_report = current_user.daily_reports.new(report_params)

    if @daily_report.save
      flash[:success] = "Report logged"
      redirect_to :root
    else
      flash.now[:errors] = @daily_report.errors.full_messages
      render :new
    end
  end

  def edit
    @daily_report = DailyReport.find(params[:id])
    render :edit
  end

  def update
    @daily_report = DailyReport.find(params[:id])

    if @daily_report.update_attributes(report_params)
      flash[:success] = "Report successfully edited"
      redirect_to :root
    else
      flash[:errors].now = @daily_report.errors.full_messages
      render :edit
    end
  end

  private

  def report_params
    params.require(:daily_report).permit(:week, :day, :finished_exercises, :read_solutions, :read_tomorrows_readings,
    :rating_of_understanding, :easiest_concept, :hardest_concept, :pair_name,
    :pair_rating, :pair_comments, :daily_comments, :user_id)
  end
end
