class CreateInitial < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
			t.string :full_name
			t.float :latitude
			t.float :longitude
    end 
    
    create_table :events do |t|
			t.string :name
			t.datetime :event_date
			t.integer :host_id
      t.timestamp 
      t.integer :public
			t.float :latitude
			t.float :longitude
    end
    
    create_table :userevents do |t|
      t.integer :user_id
      t.integer :event_id
    end
    
    create_table :activities do |t|
      t.string :activity_name
    end
    
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :user_id 
      t.integer :host_id	
    end
  end
  
  def down
    drop_table :users
    drop_table :events
    drop_table :userevents
    drop_table :activities
    drop_table :invitations
  end 
end
