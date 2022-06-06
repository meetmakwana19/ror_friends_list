1. Studied MVC .............................V2
2. $ `rails g controller home index `
3. Kinking with app/views/home/index.html
4. Kinking with config/routes.rb
5. Understanding app/views/layouts/application.erb.......................V3
6. `application.erb` is the base template file for rails to start with.
7. Created `about.html.erb` in app/views/home.
8. In apps/controllers/application/home_controller.rb created a new method for about
9. Added a route for about in config/routes.rb
10. SINGLE LINE COMMENTS IN `.erb` is like `<%# this is ccomment %>`
11. Got bootstrap starter template into `application.html.erb`
12. Created a header `partial file` - `_header.html.erb` in app/views/home. app/views/home.
13. Tags in ruby look like this `<%= %>` where = is used to output it on the screen.
14. Got bootstrap navbar into `_header.html.erb`.
    1. Added `link_to` in nav-items which works like anchor tag

## --

### V4 - CRUD

1. To create CRUD in rails, we use `Scaffold`.
2. `rails g scaffold friends name:string email:string phone:string`
3. Now in db/migrate a new migration file would be created.
4. `rails db:migrate` to push that migration into the DB. This woukd have created a new `schema.rb`
5. New following files created in app/views/friends
6. ````create app/views/friends
     create      app/views/friends/index.html.erb
     create      app/views/friends/edit.html.erb
     create      app/views/friends/show.html.erb
     create      app/views/friends/new.html.erb
     create      app/views/friends/_friend.html.erb```
   ````
7. Rails handles all CRUD work and add /friends route in config/routes.rb
8. Now you can check the browser for `http://localhost:3000/friends` and do CRUD operations. SO QUICK !!!!!!!!!
9. Edited `_header.html.rb` for `link_to`s of friends operations.
10. Can edit HTML in files like `index.html.rb` in app/views/friends
    1. Look into form partial `_form.html.erb`

## --

### V5

1. Created table in `index.html.rb`
2. Gave btns and jumbotron in `show.html.rb`
3. Returned back to Bootstrap v4.6 from v5.1 for jumbotron CSS to work.
4. Removed search from `_header.html.rb`
5. Removed `<%# render @friend %>` from `show.html.erb` and totally edited the jumbotron and whole document.
6. Adding form classes in the divs of `_form.html.erb`
   1. `class="form-group"` in the main divs
   2. `class:"form-control"` in the `form.text_field`
7. Edited `new.html.erb` and `edit.html.eerb` with Bootstrap classes.
8. Created new `_alerts.html.erb` in app/layouts and added alert from bootstrap.
   1. Rendered it in `application.erb`
9. Removed `<p style="color: green"><%= notice %></p>` from the first line of `index.html.erb` and `show.html.erb`
10. Corrected the delete method for table in `index.html.erb`.

## --

### Video 6

1. Visited https://rubygems.org/gems
2. Took `devise` gem via code snippet for gemfile
3. Follow the instructioons here https://rubydoc.info/github/heartcombo/devise
4. `rails generate devise:install`
5. Read the instructions on console.
6. Add `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }` to `config/environments/development.rb` and also in commented form in production.rb for future.
7. Already did point 2 & 3 from the instructions in console

```bash
   Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

     * Not required *

===============================================================================
```

8. To generate signup/signin pages etc etc use this command next `rails g devise:views`
9. `rails generate devise user` this created a migration.
10. Now push the migration `rails db:migrate`
11. Try `rails routes` to check all the routes
12. Add new btns in `_header.html.erb` and add the method names with `_path` by checking the console output of `rails routes`.
13. Added `user_signed_in?` if else statements in `_header.html.erb`.
14. For error like `No route matches [GET] "/users/sign_out"`........... Do this
    1. In config/initializers/devise.rb do the following
    2. `config.sign_out_via = :get`
    3. And the error solved !!!!

## --

### Video 7

1. Initially passwords, registrations, sessions folders are to be dealth with in the app/views/devise.
2. Adding class `form-group` to all field divs in app/views/devise/sessions/new.html and also `class:"form-control", placeholder:` in the respective fields.
3. ```bash
   <%= form.submit class:"btncess" btn-suc %>
   <%# Remeber no comma here to put for class if no text %>

   <%= f.submit "Log in", class:"btn btn-success"  %>
   <%# Remeber comma here to put for class if there's text %>
   ```

4. Adding bootstraps in edit and new in registrations dir, new in sessions dir, links in shared dir

## --

### Video 8

1. Untill now we've 2 tables - friends & users(devise hanldes users table
2. Visiting https://github.com/meetmakwana19/ror_friends_list/blob/master/guide.md and understood **associations**
3. Added `belongs_to :user` to app/models/friend.rb
4. Added `has_many :friends` to app/models/user.rb
   1. Now these 2 files are asssociated
5. `rails g migration add_user_id_to_friends user_id:integer:index` to create a user_id colume in the friends DB
6. `rails db:migrate`
7. Now check db/schema.rb and the file will be updated with user_id
8. Delete exiting users and friends for a fresh asssociation.
9. Go to app/views/friends/\_form.html.erb
   1. Adding user_id field in friends using embedded ruby of `current_user.id`
10. Error came upon adding friend

```bash
1 error prohibited this friend from being saved:
User must exist
```

11. So in app/controllers/friends_controller.rb added `:user_id` in the `friends_params` method to allow the user_id to be added in the DB.
12. But the friend is visible in other accounts too, so solvving in next part.

## --

### Video 9 : Solving friends showing in all users

1. In app/controllers/friends_controller.rb added `before_action` for authenticated users.
2. Modified friends table for user info in the app/views/friends/index.html.erb
3. `current_user` is a devise helper we are using here and there in friends_controller.rb and index.html.erb
4. Created new method `correct_user` in the friends_controller.rb
   1. Added `before_action` for correct_user too
   2. associating current_user with the new friend in `def new` and `def create`
5. Now actions are authorized yeeeee!
6. Added if logic in the app/views/friends/index.html.erb
