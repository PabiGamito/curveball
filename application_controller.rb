require 'bundler'
Bundler.require

require_relative './models/activity'
require_relative './models/event'
require_relative './models/invitation'
require_relative './models/user'
require_relative './models/userevent'

configure :development do

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  './db/sinatra_application.sqlite3.db'
)
	
end

configure :production do

ActiveRecord::Base.establish_connection(
  :adapter => 'pg',
	:database =>  'DATABASE_URL'
)
	
end

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
	
	get '/disp_events' do
    @all_activities = Activity.all
    @all_events = Event.all
		erb :disp_events
	end
  
  get '/events' do 
    @all_activities = Activity.all
    erb :events
  end 
	
  post '/new_event' do
    @date= params[:datetime]
    @time=Time.parse(@date)
    # Makes sure user is logged in and time is in the future
		if session[:user]!=nil && @time.future?
			
			@event = Event.new({:name => params[:name], :public => params[:public], :host_id => session[:user], :activity_id => params[:activity], :public => params[:public], :latitude => params[:latitude], :longitude => params[:longitude], :event_date => params[:datetime]})
			@event.save
			@all_events = Event.all
			@all_activities = Activity.all
      redirect '/disp_events'
		end
		redirect '/events'
	end
  
	get "/people" do
    @people = User.all
		erb :people
	end
  
  get '/new_event' do 
		@all_activities = Activity.all
    erb :new_event
  end 
  
  get '/invites' do
    @invitations = Invitation.find_by(:user_id => session[:user])
    erb :invites
  end 
	
	post '/signin' do 
		@username=params[:username]
		if User.exists?(:username => @username) #Make it so you can not create blanc user.
			@user = User.find_by(:username => @username)
      session[:user]=@user.id
			puts "-------!!!!!!!!!!!!!---------"
			puts "session[:user]=#{session[:user]}"
		elsif @username.count>=3
			@user=User.new(:username => @username)
			@user.save
      session[:user]=@user.id
		end
	redirect '/'
  end
	
	get '/signout' do
		session[:user]=nil
		erb :home
	end

get '/my_events' do
  @my_events = Event.find_by_all(:host_id => session[:user])
  erb :my_events 
end

# REDIRECT ANY UNKOWN LINK TO HOME
  get '*' do
    erb :home
  end

end
  


