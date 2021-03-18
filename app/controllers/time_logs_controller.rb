class TimeLogsController < ApplicationController
  before_action :set_time_log, only: %i[show edit update destroy]

  def index
    @time_logs = current_user.public_logs
    @total = time_conversion(@time_logs.sum(:minutes).to_i)
  end

  def ext_logs
    @time_logs = current_user.private_logs
    @total = @time_logs.sum(:minutes).to_i
  end

  def show; end

  def new
    @time_log = TimeLog.new
    @groups = Group.all
  end

  def edit; end

  def create
    @time_log = current_user.time_logs.new
    @time_log.groups = Group.where(id: time_log_params[:groups])
    @time_log.name = time_log_params[:name]
    @time_log.minutes = time_log_params[:minutes]
    @groups = Group.all
    respond_to do |format|
      if @time_log.save
        format.html { redirect_to @time_log, notice: 'Time log was successfully created.' }
        format.json { render :show, status: :created, location: @time_log }
      else
        format.html { render :new }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @time_log.update(time_log_params)
        format.html { redirect_to @time_log, notice: 'Time log was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_log }
      else
        format.html { render :edit }
        format.json { render json: @time_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_log.destroy
    respond_to do |format|
      format.html { redirect_to time_logs_url, notice: 'Time log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_time_log
    @time_log = TimeLog.find(params[:id])
  end

  def time_log_params
    params.require(:time_log).permit(:author_id, :name, :minutes, groups: [])
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours} Hours #{rest} Minutes"
  end
end
