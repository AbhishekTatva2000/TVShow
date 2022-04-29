class SendEmailToUserJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
        @user = User.all
        @user.each do |user|
            @fav = Fav.where(user_id: user.id, status: 0)
            # @shows ||= []
            @fav.each do |f|
                @show = Show.find_by(id: f.show_id)
                @c_time = (Time.now + 30*60).strftime("%H:%M")
                if @show.time.strftime("%H:%M") == @c_time
                    UserMailer.with(user: user, show: @show).notification_email.deliver_now
                end 
            end
            # @shows.each do |ss|
            #     s.each do |s|
            #     end   
            # end 
        end
        # @user = User.all
        # @user.each do |user|
        #     UserMailer.with(user: user).notification_email.deliver_now
        # end
    end

end