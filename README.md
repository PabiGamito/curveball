#Social Finder
Social Finder

#MVP
- User: anyone who wants to play a sport with someone else
- Problem solved: want to play a sport but don't have anyone to do it with
- MVP Features
    + No login- just a temporary screenname
		+ Peed to be able to create "event"
			- Location, Time, Max people, Min people, 
			- List of things you can create event for.
		+ Need to be able to view created events
    + soccer, basketball, tennis
    + Models
      - User
        + username
        + has many events
        + has many activities
        + last known location
      - Event
        + has many users
        + has one activity
        + public or private
        + date
        + location
				+ host
				+ userid
        
      - UserEvents
        + name of activity
        + eventid
				
			- Activity
				+ has many events
      
    
#Features:
- Find people to:
    + Play a sport at a location
    + Play a video game with <-- Probably has more potential for this
- Finds people with common interests
- Find public events near you
- Displays
- Sends email reminders notifications blah blah blah.
- Ability to accept or deny people
- Expiration for events (timeliness)

#Models:
#- User:
    has_many projects
    belongs to projects (joint table)
    full name:
    username:
    password:
    email:
    profile picture: (using gravatar?)
    age: 
    social contact: (fb, skype, phone #, )
    passions:
    friends:
    rating: you don't want to find yourself with bad people
    city:
    zip:
    address(private):

#- Activity:
    has_many users (participating users)
    belongs to user (owner of event)
    activity/event:
    time/date:
    location: (uses google maps to pinpoint coordenates)
    public: boolean (private or public invite)
    (maybe hidden, private & public invite)
    should have an expiration

#Resources
http://techslides.com/50-javascript-libraries-and-plugins-for-maps
Mailgun API# social-finder
# social-finder
# social-finder
# curveball
# curveball
