class TimeLogsController < ApplicationController
  before_action :set_time_log, only: [:show, :edit, :update, :destroy]

  # GET /time_logs
  # GET /time_logs.json
  def index
    @time_logs = current_user.time_logs.includes(:groups).where.not( groups: { id: nil } ).order(created_at: :desc)
    @total=current_user.time_logs.sum(:minutes)
  end

  # GET /time_logs/1
  # GET /time_logs/1.json
  def show
  end

  # GET /time_logs/new
  def new
    @time_log = TimeLog.new
    @groups=Group.all
  end

  # GET /time_logs/1/edit
  def edit
  end

  # POST /time_logs
  # POST /time_logs.json
  def create
    @time_log = current_user.time_logs.new
    @time_log.groups=Group.where(id: time_log_params[:groups])
    @time_log.name=time_log_params[:name]
    @time_log.minutes=time_log_params[:minutes]

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

  # PATCH/PUT /time_logs/1
  # PATCH/PUT /time_logs/1.json
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

  # DELETE /time_logs/1
  # DELETE /time_logs/1.json
  def destroy
    @time_log.destroy
    respond_to do |format|
      format.html { redirect_to time_logs_url, notice: 'Time log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_log
      @time_log = TimeLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_log_params
      params.require(:time_log).permit(:author_id, :name, :minutes, groups: [])
    end
end
