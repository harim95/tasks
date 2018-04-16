class ActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_activity, only: [:show, :edit, :update, :destroy]


  def index
    @activities = Activity.all

    respond_to do |format|
      format.html {  }
      format.json {
        render :json => @activities
      }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render :json => @activity
      }
    end

  end

  def datosModal
    activity = Activity.find(params[:id])
    render :json => {:activity => activity}

  end

  def new
    @activity = Activity.new
    @a = Activity.find_by_id(params[:id])
    @activity_id = params[:activity_id]
  end

  def edit
  end

  def create
    @activity = Activity.new
    @activity.name = params[:name]
    @activity.description = params[:description]
    @activity.enddate = params[:enddate]

      if @activity.save
        render json: {done: true}
      else
        render json: {done: false}
      end
  end

  def update

    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'La actividad ha sido actualizada.' }
        format.json { render :json => @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'La actividad ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :enddate, :members)
  end

end