class UserController < ApplicationController

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        binding.pry
    end

    get '/signup' do
        erb :"users/signup"
    end

end