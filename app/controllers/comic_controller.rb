class ComicsController < ApplicationController

    get '/comics/new' do
        erb :'comics/new'
    end

end