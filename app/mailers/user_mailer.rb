class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def notification_email
        @user =  current_user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'This is Cron Job Email')
    end
    
end
