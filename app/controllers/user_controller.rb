class UserController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        erb :"users/show"
    end

    get '/signup' do
        erb :"users/signup"
    end

end