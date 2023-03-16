class DepartmentsController < ApplicationController
  before_action :find_department, only: %i(show update edit destroy)

  def index
    @q = Department.ransack(params[:q])
    @departments = @q.result(distinct: true)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to @department
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @department.update(department_params)
      redirect_to @department
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end

  def find_department
    @department = Department.find(params[:id])
  end
end
