class ComicsController < ApplicationController

    get '/comics/new' do
        erb :'comics/new'
    end

    post '/comics' do
        @comic = Comic.create(
            title: params[:title],
            issue: params[:issue],
            arc: params[:arc],
            writer: params[:writer],
            artist: params[:artist]    
        )
        @comic.user_id = current_user.id
        @comic.save
        redirect to "/comics/#{@comic.id}"
    end

    get '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @user = User.find_by_id(params[:user_id])
        binding.pry
        erb :'/comics/show'
    end

end