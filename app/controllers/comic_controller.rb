class ComicsController < ApplicationController

    get '/comics' do
        if logged_in?
            @comics = Comic.all.sort_by{|h| h[:title]}
            @user = current_user
            erb :'comics/feed'
        else
            redirect to "/login"
        end
    end
    
    get '/comics/new' do
        @user = current_user
        if logged_in?
            erb :'comics/new'
        else
            redirect to "/login"
        end
    end

    post '/comics' do
        if params[:title] !=""
            @comic = Comic.create(
                title: params[:title],
                issue: params[:issue],
                publisher: params[:publisher],
                arc: params[:arc],
                writer: params[:writer],
                artist: params[:artist],
                rating: params[:rating]    
            )
            @comic.user_id = current_user.id
            @comic.save
            redirect to "/comics/#{@comic.id}"
        else
            redirect to "/comics/new"
        end
    end

    get '/comics/:id' do
        @user = current_user
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

        if params[:comic][:title] != ""
            @comic.title = params[:comic][:title]
            @comic.issue = params[:comic][:issue]
            @comic.publisher = params[:comic][:publisher]
            @comic.arc = params[:comic][:arc]
            @comic.writer = params[:comic][:writer]
            @comic.artist = params[:comic][:artist]
            @comic.rating = params[:comic][:rating]
            @comic.save

            redirect to "/comics/#{@comic.id}"
        else
            redirect to "/comics/#{@comic.id}/edit"
        end
    end

    delete '/comics/:id' do
        @comic = Comic.find_by_id(params[:id])
        @user = current_user
        if logged_in? && current_user.id == @comic.user_id
            @comic.delete
            redirect to "/users/#{@user.id}"
        else
            redirect to "/comics"
        end
    end 
end