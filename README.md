# TechInPDX

## About

The TechInPDX app aims to help developers learn about local companies using the technologies they know or are interested in, starting in Portland, OR.

## Setup

The app uses Ruby 2.3.1, Rails 5, and Postgres 9.5.2 as the database. To run locally enter the following commands in your terminal:

1. `git clone https://github.com/dylankb/tech-in-pdx`
2. `cd tech-in-pdx`
3. `bundle install`
4. `rake db:setup`
5. `rails s`

Additionally, you will need to set up an `.env` file in the project's main directory with a Twitter API key. The contents of the `.env` file should look like this:

```
TWITTER_CONSUMER_KEY=YOUR_INFO
TWITTER_CONSUMER_SECRET=YOUR_INFO
TWITTER_ACCESS_TOKEN=YOUR_INFO
TWITTER_ACCESS_TOKEN_SECRET=YOUR_INFO
GITHUB_KEY=YOUR_INFO
```

## Tests

Run `rspec` to run unit and integration tests after making changes.

## License

This software is licensed under the MIT license.
