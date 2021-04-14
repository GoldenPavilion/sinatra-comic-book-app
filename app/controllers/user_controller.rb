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
            redirect to "/users/#{@user.id}"
        else
            flash[:message] = "Sorry! Something went wrong. Re-enter your details." 
            redirect to "/login"
        end
    end

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
    end

    get '/logout' do
        session.clear
        redirect to '/login'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :"users/show"
    end
end