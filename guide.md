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
