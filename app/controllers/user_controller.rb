require 'rack-flash'

class UserController < ApplicationController

    use Rack::Flash

    get '/login' do
        if logged_in?
            redirect to "/comics"
        else
            erb :"users/login"
        end
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/comics"
        else
            flash[:message] = "Sorry! Something went wrong. Re-enter your details." 
            redirect to "/login"
        end
    end

    get '/signup' do
        if logged_in?
            redirect to "/comics"
        else     
            erb :"users/signup"
        end
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/comics"
        else
            flash[:message] = "Whoops! Something went wrong. Re-enter your details."
            redirect to "/signup" 
        end
    end

    get '/logout' do
        if !logged_in?
            redirect to '/'
        else 
            session.clear
            redirect to '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        if logged_in? && current_user == @user
            erb :"users/show"
        else
            redirect to "/comics"
        end
    end
end