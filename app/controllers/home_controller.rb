class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @shows = Show.all
    @fs = Fav.all
    @fav = Show.find(@fs)
  end

  def show
    @fav_shows = Show.find(session[:fav])
  end

  def add_to_fav
    id = params[:id].to_i
    @user = current_user.id
    @fav = Fav.find_by(user_id: @user, show_id: id)
    if @fav.blank?
      Fav.create(user_id: @user, show_id: id, status: 0)
    else
      @fu = Fav.find_by(user_id: @user, show_id: id)
      @fu.update(status: 0)
    end
    redirect_to root_path
  end

  def remove_from_fav
    id = params[:id].to_i
    @user = current_user.id
    @fu = Fav.find_by(user_id: @user, show_id: id)
    @fu.update(status: 1)
    redirect_to root_path
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

end
