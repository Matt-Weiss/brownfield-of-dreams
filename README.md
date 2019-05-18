# Brownfield of Dreams

## About

This is the week 2-3 paired project at Turing School's Backend Engineering program. The aim of the project is to use the following skills:

- Build on an existing code base and work with technical debt
- OAuth
- Consume an API
- BDD using RSpec and Capybara
- Deploy project to production
- Email functionality

The application allows users to view tutorials related to the program. Much of the code was inherited to give us experience dealing with existing code bases, and to train us to recognize why particular decisions may have been made. We were encouraged to recognize and avoid future technical debt. The GitHub API is consumed to allow users to view their repos, followers, and following as well as the ability to add friends.

In our case, friends are added by using a separate standalone app providing an API. The code and README for this secondary project can be found <a href="https://github.com/Matt-Weiss/greenfield-of-friends">HERE</a>.

## Installation & Setup

Follow these steps to get this application running on your local machine:

Clone down the repo

Run
```
$ bundle install
```
to install required gems

Install node, yarn, and stimulus
Stimulus is used to add minimal JS functionality to the frontend.
```
$ brew install node
$ brew install yarn
$ yarn add stimulus
```

If there is a yarn error **
```
$ rm yarn.lock && yarn
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the server
```
$ rails s
```

On browser, go to `http://localhost:3000/`

## Testing

The project uses <a href="https://github.com/rspec/rspec"> RSpec</a> as the test suite and <a href="https://github.com/colszowka/simplecov"> SimpleCov</a> for reporting test coverage.

Run the test suite:
```
$ bundle exec rspec
```

## Live Web App

The project is deployed <a href='https://serene-gorge-80745.herokuapp.com/'> here</a>

To login as admin, `email: admin@example.com password: password`

To use as a regular use, please register and connect to your GitHub account. This will demonstrate implementation of Oauth.

## System Requirements

* Ruby 2.4.1
* Rails 5.2.0
* PostgreSQL 11.2

## Contributors

John Pterson @joequincy

Matt Weiss @Matt-Weiss
