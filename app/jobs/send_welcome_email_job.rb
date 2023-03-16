class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(employee_id)
    employee = Employee.find(employee_id)
    EmployeeMailer.welcome_email(employee).deliver_later
  end
end
