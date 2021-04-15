class ComicsController < ApplicationController

    get '/comics' do
        if logged_in?
            @comics = Comic.all
            erb :'comics/feed'
        else
            redirect to "/login"
        end
    end
    
    get '/comics/new' do
        if logged_in?
            erb :'comics/new'
        else
            redirect to "/login"
        end
    end

    post '/comics' do
        @comic = Comic.create(
            title: params[:title],
            issue: params[:issue],
            arc: params[:arc],
            writer: params[:writer],
            artist: params[:artist],
            rating: params[:rating]    
        )
        @comic.user_id = current_user.id
        @comic.save
        redirect to "/comics/#{@comic.id}"
    end

    get '/comics/:id' do
        if logged_in?
            @comic = Comic.find_by_id(params[:id])
            erb :'/comics/show'
        else
            redirect to "/login"
        end
    end

    get '/comics/:id/edit' do
        @comic = Comic.find_by_id(params[:id])
        if logged_in? && current_user.id == @comic.user_id
            erb :'comics/edit'
        else 
            redirect to "/comics"
        end
    end

    patch '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @comic.title = params[:comic][:title]
        @comic.issue = params[:comic][:issue]
        @comic.arc = params[:comic][:arc]
        @comic.writer = params[:comic][:writer]
        @comic.artist = params[:comic][:artist]
        @comic.rating = params[:comic][:rating]
        @comic.save

        redirect to "/comics/#{@comic.id}"
    end

    delete '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @comic.delete
        #need to fix above - delete is broken
        redirect to "/users/#{@comic.user_id}"
    end 
end