# Project-6-Rupees-to-Rubies

## Execution Instructions
## Description
QuizGem is a web application that will allow users to create their own tests for certain subjects
and study them--alone or with others. Users will be able to create and share quizzes and go through
them in a single-player studying mode, and a multi-player timed competition mode.
## Managers
- Jamaal Wairegi: Testing Manager
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
1. Account Created
2. Sign Up
3. Join via Code/Link
4. Start Game
5. Log In
6. Profile
7. Search User
8. Create a quiz
9. Select Quiz
10. Select User
11. Study
12. Host
13. Next Question
14. Review Incorrect
15. Back to Quiz Info
16. End Game
## Sprint #1 - Due Friday, July 19th
Jamaal Wairegi:
- Create a route for joining a game–taking in a given link or code and taking the user from the join game page to the host game page. If a user is not signed in, they will be given a random name (implemented as a navbar search form).
- Create a controller and routes for viewing user information (UserView controller).
- Initially implemented a route for the landing page, which included logging in, signing up, and joining games, but moved those links to the navbar.
Sirojiddin Aripov :
-   Work on the Homepage and Quiz Creating Environment.
-   Start work on Host Game page and

-   Route from Homepage to Quiz Creation, Quiz Creation back to HomePage. Work with peers to route Host Game.

-   Start setting up the Quiz Creating Environment.

-   The environment for user to type in the name of a quiz

-   And add as many questions to the quiz as they'd like

-   Start implementing the Quiz Table to store the Quiz, until the questions table is implemented will only save the quiz name for now.
## Sprint #2 - Due Thursday, July 25th
Jamaal Wairegi:
- Create Incorrect Answers table, RESTful routes, and give it an association with the Questions table
- Style HTML pages for UserView controller
## Sprint #3
## ... continute with more sprints
## Team Contributions
