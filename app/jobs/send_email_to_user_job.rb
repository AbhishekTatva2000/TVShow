class SendEmailToUserJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      @show = Show.all
      UserMailer.notification_email.deliver_later
    end
    
end