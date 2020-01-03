class UsersController < ApplicationController

  def index
  	@users = User.all.paginate(:page => params[:page], :per_page => 5)
  	respond_to do |format|
    format.html
    format.json { render json: @users }
  end 
  end


  def import
    if params[:file].present?
    	if File.extname(params[:file].original_filename) == ".json"
  	    file = params[:file].read
        data = JSON.parse(file)
        User.create(data)
       flash[:notice] ="Data Uploaded Succesufully"
    	else
    	  User.import(params[:file])
        flash[:notice] ="Data Uploaded Succesufully"
      end
    else
      flash[:alert] ="Please Select the File"
    end

  	redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:id,:login, :password, :title, :lastname,:firstname,:gender,:email,:picture,:address)
  end
end
