class EmployeesController < ApplicationController
  before_action :find_employee, only: %i(show update edit destroy)

  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result.paginate(page: params[:page], per_page: 3)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :address, :gender, :dob, :phone_number, :designation, :date_of_joining, :department_id)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
