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
        erb :'/comics/show'
    end

    get '/comics/:id/edit' do
        @comic = Comic.find_by_id(params[:id])
        erb :'comics/edit'
    end

    patch '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @comic.title = params[:comic][:title]
        @comic.issue = params[:comic][:issue]
        @comic.arc = params[:comic][:arc]
        @comic.writer = params[:comic][:writer]
        @comic.artist = params[:comic][:artist]
        @comic.save
        #@comic.update(title: params[:comic][:title], params[:comic][:issue], arc: params[:comic][:arc], writer: params[:comic][:writer], artist: params[:comic][:artist])
        #@comic.save

        redirect to "/comics/#{@comic.id}"
    end

    delete '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @comic.delete

        redirect to "/users/#{@comic.user_id}"
    end

end