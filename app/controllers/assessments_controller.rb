class AssessmentsController < ApplicationController
  def new
    # require TA
  end

  def create
    # require TA
    @assessment = Assessment.new(report_params)

    if @assessment.save
      flash[:success] = "Report logged"
      redirect_to assignment_url(@assignment)
    else
      flash[:errors] = @assessment.errors.full_messages
      render :new
    end
  end

  def show
    # require that you're in the right cohort
    @assessment = Assessment.find(params[:id])
  end

  def index
    @assessments = Assessment.where(:cohort_id => current_user.cohort_id)
  end

  def download_zip
    @assessment = Assessment.find(params[:id])
    send_file @assessment.zip_path
  end

  def receive_zip
    @assessment = Assessment.find(params[:id])
    name = @assessment.zip_path
    directory = "uploads"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end

end
