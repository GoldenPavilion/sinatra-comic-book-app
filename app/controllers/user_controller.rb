class UserController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            erb :"users/show"
        else 
            redirect to '/login'
        end
    end

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        erb :"users/show"
    end

end