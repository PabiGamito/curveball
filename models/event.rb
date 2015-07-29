class Event < ActiveRecord::Base
# 	Joins user & events
	has_many :userevents
	has_many :users, through: :userevents
	
# 	Joins events, invited users and host
	has_many :invitations
	has_many :users, through: :invitations
	
	
	has_many :activities
end