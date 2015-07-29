class User < ActiveRecord::Base
	has_many :userevents
	has_many :events, through: :userevents
	has_many :invitations
	has_many :events, through: :invitations
end





