class SendEmailToUserJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
        @id = session[:fav]
        @shows = Show.find(@id)
        @user = current_user
        @c_time = Time.now.strftime("%H:%M:%S")
        @shows.each do |s|
            if (s.time + 30*60).strftime("%T")  
        end 
        #UserMailer.notification_mail.deliver_now
    end

end