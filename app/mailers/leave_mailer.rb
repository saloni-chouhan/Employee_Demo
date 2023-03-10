class LeaveMailer < ApplicationMailer
  default from: "chouhansaloni99@gmail.com"

  def send_leave_notification
    @user = params[:user]
    @leave = params[:leave]

    mail(
      to: @user.email,
      Subject: "Leave Application!"
      )
  end
end
