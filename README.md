# thrivemarket.org

## Web app for managing the Thrive Neighborhood Market and Community Garden

### This app utilizes the following
* Rails
* Foundation for the front end and basic design
* Twilio for admins to SMS contacts with updates and reminders
* Basic user auth for admins
* Font Awesome for font icons
* jQuery Cookie for setting and reading cookies using jQuery
* Kaminari for pagination
* New Relic for monitoring
* Quiet assets to reduce clutter in the logs while working in development

---

## Installation Instructions

### Step 1 - Clone app

You should clone the app from the Bitbucket repository

    git clone https://jameswilliamiii@bitbucket.org/jameswilliamiii/thrive_market.git


### Step 2 - Set ENV variables

You will need to set your environment variables for the following:

    ENV['SECRET_TOKEN']
    # used to access Twilio
    ENV['TWILIO_SID']
    ENV['TWILO_TOKEN']
    ENV['TWILO_FROM']
    # used for auth username and password to enter admin panel
    ENV['ADMIN_USERNAME']
    ENV['ADMIN_PASSWORD']
    # assuming you are using Heroku, this is your Heroku app name
    ENV['NEW_RELIC_APP_NAME']

The application is set up to accept a file named `heroku_env.rb` that is located in the `thrive_market/config/initializers` directory.  This is an easy way to use the variables locally during development.  Just make sure you add that file to your .gitignore.


### Step 3 - Setup Database

Run `rake db:migrate`

### Step 4 - Modify Sitemap

Review `thrive_market/config/sitemap.rb` and add your own host name

    SitemapGenerator::Sitemap.default_host = "http://www.your-domain.com"

Run `rake sitemap:refresh` to update the sitemap per your new options.  Visit [https://github.com/kjvarga/sitemap_generator](https://github.com/kjvarga/sitemap_generator) to learn more about the gem that powers sitemaps.

---

### Contributors:
James Stubblefield [@jameswilliamiii](https://twitter.com/jameswilliamiii)