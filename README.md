# README

This README would normally document whatever steps are necessary to get the
application up and running. But in this @instance it will not :-)

It will reflect steps taken during the **CodaisseurUp Academy Intermediate Bootcamp**

------

## Day 1 - Project Setup & Authentication

####Getting the right tools

####CodaisseurUp Project Setup

####Introduction to SCRUM



------

## Day 2 - Associations I

####CodaisseurUp Associations I



------

## Day 3 - Rails Testing

####CodaisseurUp Testing



------

## Day 4 - Images Upload & Deployment

####CodaisseurUp Deployment

####CodaisseurUp Images Upload



**Carrierwave :** One of several Ruby gems that can take care of handling file uploads.

**Cloudinary:** Cloud storage facility

**Heroku:** Deployment of app, by *pushing* local git repository to app-name.heroku.com where it can be opened in browser.



**CarrierWave**

* Ruby gem
* upload, storage, manipulation, optimization, delivery
* Add *'carrierwave', '0.11.2'* to Gemfile, run *$ bundle install*
* Generate uploader in app : run *$ spring stop*  and  *$ rails generate uploader image*
* By default stores uploads in  folder */public/uploads*,
* Can be directed to store uploads elsewhere by changing method *store_dir* in *apps/uploaders/image_uploader.rb* (or video_uploader.rb, pdf_uploader.rb, etc)




**Cloudinary**

* Online storage facility

* Create account on cloudinary.com

* Go to Dashboard
  * Cloud name
  * API Key
  * API Secret
  * Environment variable (CLOUDINARY_URL=cloudinary://....)

* Add *'cloudinary', '1.2.3'* to Gemfile, run *$ bundle install*

* Update ImageUploader class in /apps/uploaders/Image_uploader.rb

  * ```
    class ImageUploader < CarrierWave::Uploader::Base
    	include Cloudinary::CarrierWave
    end
    ```

* Set it up locally, make environment variable $CLOUDINARY_URL in ~/.zshrc, run ~/.zshrc to create variable in environment (only now, will be done automagically when starting terminal)

  * ```
    $ echo 'export <Environment variable from Cloudinary Dashboard>' >> ~/.zshrc 
    $ source ~/.zshrc
    ```

  * restart rails server





**Heroku**

- Online deployment facility, up to five apps without signing up

- Needs to know which Ruby version we are running

  - Update Gemfile :

  ```
   # Gemfile
   source 'https://rubygems.org
   'ruby '2.4.1'
   # rest of the code...
  ```

- Rails_12factor gem enables serving assets in production and setting your logger to standard out (huh? wazzat?)

  - Add *gem 'rails_12factor', group: :production* to Gemfile
  - run *$ bundle install*

- Create account on heroku.com (now we have username and password)

- Install Heroku CLI (Command Line Interpreter)
  ```
  $ wget -q0 https://cli-assets.heroku.com/install-ubuntu.sh | sh
  ```

- Login to heroku

  ```
  $ heroku login
  > username: <username>
  > password: <password>
  ```

- Add SSH keys for the Heroku CLI

  ```
  $ heroku keys:add
  ```

  - When prompted, use your id_rsa.pub key if you have it, or generate a new one (huh? wazzat?)

- Check : 

  ```
  $ heroku auth:whoami
  => YOUR_USERNAME
  ```

- And now

  ```
  $ heroku create <app_name
  $ heroku config:set CLOUDINARY_URL=$CLOUDINARY_URL
  $ git push heroku master
  $ heroku run rails db:migrate db:seed
  ```

- And now
  ```
  $ heroku config
  $ heroku config:get DATABASE_URL
  $ heroku open
  ```

------

##Day 5 - Associations II

####CodaisseurUp Associations II

```
rails generate model Booking user:references event:references extra-attributes:extra_types
```



**!!   *has_many*   can do 2 totally different things   !!**

```
# model
class User
  # ! has_many can do 2 totally different things !

  # This defines a relationship between 2 actual tables in database
  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # This creates a virtual attribute visit_events[] for the model user,
  #   it consists of collection of event objects being visited (<=bookings)
  has_many :visit_events, through: :bookings, source: :events
  
  def full_name
  	# Virtual attribute full_name (not in table) can be accessed as if it
  	#  is an actual attribute of User
    profile.full_name if profile?
    email
  end
  
  def visit_events2
    # If I run a query on bookings 
    #     where bookings.user = current_user 
    #  and I return the events as objects in an array
    #  it would (I think) do the same as :
    #   has_many:visit_events2, through: :bookings, source: :events
  end

end
```



```
# model
class Event
  # This defines a relationship between 2 actual tables in database
  has_one :users, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # This creates a virtual attribute visitors[] for the model event,
  #   it consists of collection of user objects visiting the event (<=bookings)
  has_many :visitors, through: :bookings, source: :users
end
```



```
# model
class Booking
  # This defines a relationship between 2 actual tables in database
  belongs_to :user
  belongs_to :event

  # This creates a virtual attribute visitors for the model event,
  #   it consists of collection of user objects visiting the event (<=bookings)
  has_many :visitors, through: :bookings, source: :users
end
```

These two totally different results of *has_many* is somewhat confusing. 

- One is describing an actual connection between 2 tables. 
- The other is creating a virtual attribute collection[] for the object. Much like def full_name; end within the model, creates a new virtual attribute .full_name.
- It can probably also be done by creating a object(/class?) method doing the actual SQL-query and returning the result as a collection.


Through Association Models :

```
$ rails generate model Registration user:references event:references status:string guests_count:integer

$ rails g controller Registrations


```




#### Codaisseurify I





#### Coding Dojo