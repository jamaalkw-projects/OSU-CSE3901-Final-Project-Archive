# Project-6-Rupees-to-Rubies

## Execution Instructions
To use our web application, simple go to the repository in the terminal, run `bundle install` to install
any necessary gems from the Gemfile, run `bundle update` in order to update if necessary, then run
`rails server`, after which open up a browser of your choice and go to the url "http://127.0.0.1:3000/".
## Description
QuizGem is a web application that will allow users to create their own tests for certain subjects
and study them--alone or with others. Users will be able to create accounts, create quizzes and play through
them in a single-player studying mode. They are able to track their score for a quiz and can open up rooms for
live sessions to play with others.
Users can also play through other users' quizzes by searching for them and playing through them.
## Managers
- Jamaal Wairegi: Testing Manager
- Nicholas Colacarro: Documentation Manager
- Sirojiddin Aripov: Implementation Manager
- Samuel Colston: Meeting Manager
## Use Cases and routes
- Account Creation
    - Users will be able to create an account with a username, email, and password
    - Users will be able to change their username and password, and they will also be able to delete their account
- Quiz Creation
    - One user will create a set of questions with up to 4 options multiple choice
    - Will be stored in the server under their account
    - Users can edit and delete sets
    - Users can search for quizzes based on the quiz name or the author name using keywords in a search bar
    - Users can create a game by clicking a button on a specific test, and the server will respond with a unique link for others to join
    - Once the users join the test their name will be displayed
- Currency Mode (multiplayer):
    - The server will send each user with the set of questions
    - In this game mode, player’s can hold a number of coins. All players will start with 100 coins.
    - For each question, they can wager coins in increments of 5 (starting from 5) to be doubled if the question is correctly answered.
    - If a player correctly answers a question, they will receive double the amount of coins they wagered.
    - If a player incorrectly answers a question, they will not receive any coins, and they will lose the coins they wagered.
    - The player with the most points after the end of the game wins, and their name and amount of coins will be displayed on the screen.
- Timed Mode (multiplayer):
    - The server will send each user with the set of questions
    - The user will see the question for 5 seconds
    - The user will then be able to respond in 30 seconds
    - The client side will respond to the server whether they scored or not and the timestamp of their input. 
    - The server will compare the timestamps of each individual and rank each user
        - The server will then return the necessary amount.
- Study Mode (single player):
    - The user will be able to practice with themselves with their set of questions.
        - They can select their specific quiz and hit the solo option.
    - One question at a time will be shown with the 4 multiple choice answers below.
        - If the user gets the correct answer it will be saved to a list that will show questions they understand.
        - If the user gets the question incorrect it will be saved to a different list that will be questions that the user should go back and redo to study more.
    - The user will also have the option to skip a question and go back to the previous question.
## Routes
1. Users Routes
  - Index
  - View
  - New (Sign Up)
  - Create
  - Edit (Edit Profile)
  - Update
  - Destroy
  - Logging in and forgetting password
2. Home page
  - Index
  - Search Page
3. Quiz
  - Index
  - Show
  - New
  - Create
  - Edit
  - Update
  - Delete
4. Question
  - Index
  - Show
  - New
  - Create
  - Edit
  - Update
  - Delete
5. Correct and Incorrect Choices
  - Index
  - Update
  - Delete
  - New
  - Create
6. Study
  - Showing questions
  - Navigating back and forth between questions
  - Ending the quiz
7. Hosting Live sessions
  - Join room
  - Set quiz
  - Create room
8. Scoreboard
  - Index
  - Show
  - New 
  - Create
  - Destroy
## Sprint #1 - Due Friday, July 19th
Jamaal Wairegi - Create a route for joining a game–taking in a given link or code and taking the user from the join game page to the host game page. If a user is not signed in, they will be given a random name (implemented as a navbar search form). Create a controller and routes for viewing user information (UserView controller). Initially implemented a route for the landing page, which included logging in, signing up, and joining games, but moved those links to the navbar.\
Sirojiddin Aripov - Work on the Homepage and Quiz Creating Environment. Start work on Host Game page. Route from Homepage to Quiz Creation, Quiz Creation back to HomePage. Work with peers to route Host Game. Start setting up the Quiz Creating Environment. The environment for user to type in the name of a quiz and add as many questions to the quiz as they'd like. Start implementing the Quiz Table to store the Quiz, until the questions table is implemented will only save the quiz name for now.\
Nicholas Colacarro - Work on creating the question and quiz end views. Also create the routes for them. Create the quiz information controller, view, and routes. Create the study controller.view and routes so that the user can study the quizzes they added.\
Samuel Colston = Create users model and RESTful routes for users using devise. Create view files for setting up and logging in to user accounts.
## Sprint #2 - Due Thursday, July 25th
Jamaal Wairegi - Create Incorrect Answers table, RESTful routes, and give it an association with the Questions table. Style HTML pages for UserView controller. \
Nicholas Colacarro - Work on creating a study controller and get rid of the quiz information controller. Create the CorrectChoice model and implement the routes, controller, and views to work with creating questions within quizzes. Finish of the actual studying playthrough. Work on styling and how it tracks the user's choices.\
Samuel Colston - Finish creating views and debugging custom controller code for users updates. Work on creating a scoreboard model to keep track of quiz results across sessions. Create outline of controller code to create rows in the scoreboard.
## Sprint #3 - Due Sunday, July 28th
Jamaall Wairegi - Add constraints to amount of choices that can be made for questions, Add user authorization for playing through quizzes. \
Nicholas Colacarro - Work out any bugs with the study mode and add any extra functionality that we want. Fix bugs that choices will reshuffle when user clicks an answer and have choices be added properly if a user leaves the study mode to add another question/choice to the quiz.\
Sirojiddin Aripov - continue research on turbo and updating UI without prompting user. Establish connection with server through application connector. Test if it's working in quiz rooms, update joined users on front end without prompting reload.\
Samuel Colston - Implement controller code to update the scoreboard model within the study controller. Refine views for looking at personal scores and scoreboard. Finish debugging and improving scores controller actions.
## Team Contributions
### Nicholas Colacarro
- Created/implemented routes for correct choices and studying.
- Created model for correct choices and migration for it.
  - correct_choices.rb
- Created views for correct_choices
  - _form.html.erb
  - index.html.erb
  - new.html.erb
- Created views for questions
  - edit.html.erb
  - show.html.erb
- Created views for study
  - end.html.erb
  - question.html.erb
  - show.html.erb
- Created study_controller.rb and actions/methods:
  - show
  - question
  - next_question
  - previous_question
  - submit_answer
  - end
- Created correct_choices_controller.rb and actions/methods:
  - index
  - new
  - create
  - update
  - destroy
  - Private methods: set_question, set_correct_choice, and correct_choice_params
- Added actions/methods to questions_controller.rb:
  - show
  - edit
### Samuel Colston
- Used devise to create users model
- Created custom controller actions for users
    - update
    - delete
    - edit
- Created custom edit view in users_view/edit.html.erb
- Linking to registration, log in/out, and profile in _header.html.erb
- Created scoreboard model.
    - scoreboard.rb
- Created ScoresController and actions:
    - index
    - show
    - new
    - create
    - destroy
- Created scores views:
    - scores/index.html.erb
    - scores/new.html.erb
    - scores/show.html.erb
### Jamaal Wairegi
- IncorrectChoices controller, model, and view
  - Index
  - New
  - Create
  - Update
  - Destroy
- Implementing updating of correct and incorrect choices
- User authorizations for certain actions
- Users controller (view for Users)
  - Index
  - Show
- Join code input field in header
- Yielding of errors in correct and incorrect choices creation
- Display of questions and users on home page
### Sirojiddin Aripov
- Home Page
  - index 
- Quizzes
  - CRUD operations with Rails
  - Associated quizzes with users. Quizzes belong to Users AKA User has many Quizzes
- Rooms
  - Create, Read operations for rooms
  - Associated Rooms with Quizzes, Quiz has many rooms
- RoomUser
  - Create operation for RoomUser
  - Associated Many to Many relationship between rooms and Users.
    - Aka Many Users can create and join many rooms
## Lecture Content
- RESTful Routes
- Embedded Ruby Code and HTML
- Rails helper methods and variables
- Rails terminal commands
- "render" and "redirect_to"
- Javascript and DOM
- Model associations
  - One-to-many
  - Many-to-many
- ".save", ".valid?", and ".errors"
- Routes
- Implicit and explicit parameters
