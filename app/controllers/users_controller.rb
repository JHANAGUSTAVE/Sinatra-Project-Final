class UsersController < ApplicationController 

    get '/users/:id' do
      # if !logged_in?
      #   redirect '/galery'
      # else]
      #   redirect '/signup'
      # end
    end
  
    get '/signup' do
        erb :'/users/signup'
    end
  
    post '/signup' do 
      user = User.new params
      if user.save
        # session[:user_id] = user.id
       erb :'/users/new'
      else
        redirect '/'
      end
    end
  
    get '/users/new' do
      erb :'/users/new'
    end


    post '/save_image' do

      @filename = params[:file][:filename]
      file = params[:file][:tempfile]

      File.open("./public/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end

      erb :'/users/show_image'
    end

    get '/logout' do
      session.clear
      redirect '/users/signup'
  end
end
  