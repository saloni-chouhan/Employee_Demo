class LeavesController < ApplicationController
  before_action :find_leaves, only: %i(show update edit destroy)
  before_action :find_employee

  def index
    @q = @employee.leaves.ransack(params[:q])
    @leaves = @q.result(distinct: true)
  end

  def new
    @leave = @employee.leaves.new
  end

  def create
    @leave = @employee.leaves.new(leaves_params)

    if @leave.save
      LeaveMailer.with(leave: @leave, user: current_employee).send_leave_notification.deliver_later
      redirect_to @leave, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @leave = @employee.leaves.find_by(id: params[:id])
    if @leave.update(leaves_params)
      redirect_to leafe_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @leave = @employee.leaves.find_by(id: params[:id])
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

  def find_employee
    @employee = Employee.find_by(id: current_employee)
  end
end
