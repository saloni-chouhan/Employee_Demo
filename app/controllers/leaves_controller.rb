class LeavesController < ApplicationController
  before_action :find_leaves, only: %i(show update edit destroy)

  def index
    @q = Leave.ransack(params[:q])
    @leaves = @q.result(distinct: true)
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leaves_params)

    if @leave.save
      redirect_to @leave, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @leave.update(leaves_params)
      redirect_to :show, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @leave.destroy
    redirect_to leaves_path
  end

  private

  def leaves_params
    params.require(:leave).permit(:from_date, :to_date, :reason, :mail_to, :employee_id)
  end

  def find_leaves
    @leave = Leave.find(params[:id])
  end
end
