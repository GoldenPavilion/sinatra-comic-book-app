class UserController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else 
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