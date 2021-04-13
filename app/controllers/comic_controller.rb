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
    end

end