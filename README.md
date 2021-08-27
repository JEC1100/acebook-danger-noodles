# AceBook

On Heroku: [Acebook](https://nameless-escarpment-65979.herokuapp.com/)

## About Acebook

This application was developed by a team of 10 developers (see below) in weeks 8 and 9 of Makers Academy Software Development Bootcamp. As an introduction to Ruby on Rails the task was to build a light clone of Facebook. Functionality implemented includes:

- Signing up, logging in and out
  - Created with devise gem
- Newsfeed
  - Users can create posts and they will appear on the newsfeed in reverse chronological order
    - Posts can contain images and a message
  - Posts have a user's avatar and username with it
  - Infinite scrolling (implemented using REACT)
- Likes and comments
  - A user can like a post once, once liked button changes to 'unlike' and user can unlike it (and so on...)
  - Users can leave comments under posts
  - Javascript fetch requests implemented in order to stop page refresh upon liking/unliking and commenting
- User profile
  - Contains all of the user's posts (complete with likes and comments)
  - Edit profile option on current user's page
    - User can update their username, avatar, bio and email
- Navigation
  - Nav bar for user to visit the home page, their profile, and to sign in and out
  - Clicking on a user's avatar or username by their post takes you to their profile
- Testing
  - Unit testing using Rspec and Factory Bot
  - Feature testing using capybara
- Development
  - App deployed to heroku
  - Images hosted on Amazon S3


## Collaborators

- [Pav Rao](https://github.com/pav0107)
- [Matt Firmston](https://github.com/YoFirmy)
- [Brett Karlson](https://github.com/BrettKarlson)
- [Sibel Eren](https://github.com/senoodle)
- [Karim Abu-Seer](https://github.com/karimabuseer)
- [Else Meijerink](https://github.com/SipofTea)
- [James Condon](https://github.com/JEC1100)
- [Luke Usher](https://github.com/lushcodes)
- [Will Young](https://github.com/William-Young-97)
- [Izzy Peppiatt](https://github.com/isobelpepp)

## Team practices:

- Stand up and retro every day
- Trello board assigning tickets
- Pair and mob programming
- Code reviews

### Setting up the project on your local machine:

- Clone this repository and cd into it
- Run:

```
bundle install
```

- If yarn is not installed on your machine you will need to run:

``` 
npm yarn install
```

- To migrate the databases:

```
rails db:create
rails db:migrate
```

- To load the application (and visit on localhost:3000):

``` 
rails s
```