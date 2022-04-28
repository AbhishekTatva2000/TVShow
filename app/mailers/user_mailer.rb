class UserMailer < ApplicationMailer
    default from: 'abhidave2000@gmail.com'

    def notification_email
        @user = params[:user]
        mail(to: @user.email, subject: 'This is Cron Job Email')
    end
    
end
