require 'bundler'
Bundler.require

require_relative './models/activity'
require_relative './models/event'
require_relative './models/invitation'
require_relative './models/user'
require_relative './models/userevent'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  './db/sinatra_application.sqlite3.db'
)

# Run "shotgun -o 0.0.0.0 -p 3000" to start server on port 3000

class ApplicationController < Sinatra::Base
	
	use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => 'muh_secret'
  
# 	add something to make it secret
		
	get '/' do
    puts session[:user]
    erb :home
  end
  
	get '/events' do
    @all_events = Event.all 
		@all_activities = Activity.all
    erb :events
  end
	
	post '/new_event' do
		if session[:user]!=nil
			@event = Event.new({:name => params[:name], :public => params[:public], :host_id => session[:user]})
			@event.save
			@all_events = Event.all
			@all_activities = Activity.all
		end
		redirect '/events'

# 		Need to find a way to get an array of invited users
# 		array.each do |username|
# 			if User.exists?(:username => username)
# 				@user=User.find(:username => username)
# 				@invitation = Invitation.new({:event_id => @event.id, :user_id => @user.id, :host_id => session[:user]})
# 				@invitation.save
# 			else
# # 				return error that username doesn't exist
# 			end
# 		end
	end
  
	get "/people" do
		erb :people
	end
  
  get '/invites' do
    @invitations = Invitation.find_by(:user_id => session[:user])
    erb :invites
  end 
	
	post '/signin' do 
		@username=params[:username]
		if User.exists?(:username => @username)
			@user = User.find_by(:username => @username)
      session[:user]=@user.id
			puts "-------!!!!!!!!!!!!!---------"
			puts "session[:user]=#{session[:user]}"
		else
			@user=User.new(:username => @username)
			@user.save
      session[:user]=@user.id
		end
	redirect '/'
  end
  
#   post '/signup' do 
#     @user = User.create(:username => params{:username}, )
#     @user.save
# 		session[:user]=@user.id
# 		erb :home
# 	end
	
	get '/signout' do
		session[:user]=nil
		redirect '/'
	end
	
#   get "/new_activity" do
#     session[:user]=user.id
#   end
  
#   post '/new_activity' do 
#     @activity = Activity.find_by(:new_activtiy => params[:username])
#     @activity.save
# 		session[:user]=@user.id
#     erb :index
#   end
  
#   post "/new_activty" do
#     @activity = Activity.all
#     @activity = Activity.new({:host_id => params[:user_id]})
#     @activty.save
#     erb :index2
# 	end
  
  
end
  


