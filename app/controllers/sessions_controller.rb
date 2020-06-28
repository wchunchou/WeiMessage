class SessionsController < ApplicationController
    before_action :loggedin_redirect, only: [:new, :create]
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id # we care store user's preference here as well
            flash[:success] = 'Login Successfully!'
            redirect_to root_path
        else
            flash.now[:alert] = 'Wrong email or password'
            # we are not redirect but render, not a full cycle http request, so we use flash now.
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'logged out'
        redirect_to login_path
    end

    private

    def loggedin_redirect
        if logged_in?
            flash[:error] = 'you are already logged in'
            redirect_to root_path
        end
    end
end
