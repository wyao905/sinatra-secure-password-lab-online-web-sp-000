require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    #your code here
    if params[:username].empty? || params[:password].empty?
      redirect "/failure"
    else
<<<<<<< HEAD
      user = User.new(:username => params[:username], :password => params[:password])
      user.save
=======
      # user = User.new(:username => params[:username], :password => params[:password])
      # user.save
>>>>>>> 43d5bf0d4a3cbfd475138f2c3a9595f2672077dd
      redirect "/login"
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end


  get "/login" do
    erb :login
  end

  post "/login" do
    ##your code here
    if params[:username].empty? || params[:password].empty?
      redirect "/failure"
    else
<<<<<<< HEAD
      user = User.find_by(:username => params[:username])
      session[:user_id] = user.id
      if self.logged_in?
        redirect "/account"
      else
        redirect "/failure"
      end
=======
      binding.pry
      session[:user_id] = user.id
      redirect "/account"
>>>>>>> 43d5bf0d4a3cbfd475138f2c3a9595f2672077dd
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
