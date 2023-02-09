class EmpLeavesController < ApplicationController
  before_action :find_emp_leaves, only: %i(show update edit destroy)

  def index
    @emp_leaves = EmpLeave.all
  end

  def new
    @emp_leave = EmpLeave.new
  end

  def create
    @emp_leave = EmpLeave.new(emp_leaves_params)

    if @emp_leave.save
      redirect_to @emp_leave, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @emp_leave.update(emp_leaves_params)
      redirect_to :show, status: :ok
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @emp_leave.destroy
  end

  private

  def emp_leaves_params
    params.require(:emp_leave).permit(:from_date, :to_date, :reason, :mail_to, :employee_id)
  end

  def find_emp_leaves
    @emp_leave = EmpLeave.find(params[:id])
  end
end
