# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app --- Used Corneal to generate the project. Included Sinatra in the Gemfile. Was already required in the environment file.
- [x] Use ActiveRecord for storing information in a database --- Also included during Corneal generation. ActiveRecord is installed in the Gemfile and inherited in the necessary files.
- [x] Include more than one model class (e.g. User, Post, Category) --- Created two models: a User and a Comic.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) --- A User has many Comics. 
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --- A Comic belongs to a User.
- [x] Include user accounts with unique login attribute (username or email) --- Used validation to ensure that during sign-up, the user's e-mail is unique and present. You cannot create an account with an e-mail that is already in the database. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --- ComicController has routes that allow user to add a new comic (get '/comics/new' & post '/comics'), read it (get '/comics/:id'), edit it (get '/comics/:id/edit' && patch '/comics/:id'), and delete it (delete '/comics/:id'). 
- [x] Ensure that users can't modify content created by other users --- Used conditionals within the edit and delete routes. The code only executes if the current user's ID matches the comics user ID. Using ERB tags, I also added an additional conditional within the comic show page. A user can only see the edit link and delete button for their own content, not for anything published by another user. This provides a failsafe.
- [x] Include user input validations --- A Comic can only be submitted or edited if it has a title. Otherwise, the user is redirected back to the proper form. Prevents a completely empty database entry.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) --- Used the flash gem and associated flash messages to inform user when they have entered inappropriate data into a form (login, sign-up, new comic or edit comic).
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --- Added ReadMe file with necessary information to use app.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message