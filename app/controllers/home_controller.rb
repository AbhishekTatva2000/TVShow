class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @shows = Show.all
  end

  def show
    @fav_shows = Show.find(session[:fav])
  end

  def add_to_fav
    id = params[:id].to_i
    session[:fav] << id unless session[:fav].include?(id)
    redirect_to root_path
  end

  def remove_from_fav
    id = params[:id].to_i
    session[:fav].delete(id)
    redirect_to fav_show_path
  end

  def search
    if params[:chanel].blank? && !params[:show].blank?
      @shows = Show.where("name LIKE ?", "%#{params[:show]}%")
    elsif params[:show].blank? && !params[:chanel].blank?
      @chanel = Chanel.where("name LIKE ?", "%#{params[:chanel]}%")
      @shows = Show.where(chanel: @chanel.ids)
    else
      @chanel = Chanel.where("name LIKE ?", "%#{params[:chanel]}%")
      @shows = Show.joins(:chanel).where('LOWER(shows.name) like (?) AND LOWER(chanels.name) like (?)', "%#{params[:show].downcase}%", "%#{params[:chanel].downcase}%")
    end
  end

  # def send_email
  #   SendEmailToUserJob.perfom_later
  #   redirect_to root_path
  # end

end
