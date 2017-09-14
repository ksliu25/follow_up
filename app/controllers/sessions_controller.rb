class SessionsController < ApplicationController
  def new
  end

	def create
	  user = User.find_by(email: params[:session][:email])
	  if user && user.authenticate(params[:session][:password])
	    log_in(user)
	    redirect_to root_url, notice: 'Logged in!'
	  else
	    flash[:danger] = 'Invalid email/password combination'
	    render :new
	  end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: 'Logged out!'
	end
end
