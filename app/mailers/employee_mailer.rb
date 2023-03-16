class EmployeeMailer < ApplicationMailer
  default from: "chouhansaloni99@gmail.com"

  def welcome_email(employee)
    @employee = employee
    mail(
      to: @employee.email,
      subject: "You are signed in successfully!!"
      )
  end
end
