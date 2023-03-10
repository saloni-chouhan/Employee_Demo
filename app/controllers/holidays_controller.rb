class HolidaysController < ApplicationController
  before_action :authenticate_employee!
  before_action :find_holiday, except: [:new, :create, :index]

  def index
    @holidays = Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)

    if @holiday.save
      redirect_to @holiday
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    unless @holiday.update(holiday_params)
      render 'edit'
    else
      redirect_to @holiday
    end
  end

  def show
    
  end

  def destroy
    @holiday.destroy
    redirect_to holidays_path
  end

  private

  def holiday_params
    params.require(:holiday).permit(:date, :occasion, :day)
  end

  def find_holiday
    @holiday = Holiday.find(params[:id])
  end
end
