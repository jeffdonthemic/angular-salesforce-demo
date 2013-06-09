# AngularJS Salesforce Demo with Ruby on Rails

This demo AngularJS application connects to Salesforce.com using Ruby on Rails and the [Restforce](https://github.com/ejholmes/restforce) gem. The application creates, updates and displays Account records from Salesforce.com.

You can find the accompanying blog post here with complete details.

## Requirements

It is assumbed that you have the following:

* Force.com Development Org with Remove Access setup (see [this video](http://www.youtube.com/watch?v=fq2ju2ML9GM) if you need help)
* Ruby installed and running
* [Heroku toolbelt](https://toolbelt.heroku.com/) with git for deployment to Heroku

## Local Development

    # clone the repo locally
    git clone https://github.com/jeffdonthemic/angular-salesforce-demo.git
    # cd into the new directory
    cd angular-salesforce-demo
    # run bundler to install the gems
    bundle

To connect the application to your Force.com development org you need to add your client id and client secret to the .env-example file as well as your username and password (with security token). Rename .env-example to .env. 

If all is setup correctly, you should be able to start the application with:

    foreman start -p 3000

Now point your browser to http://localhost:3000/accounts.json and you should see your 5 most recently updated Accounts from your DE org.

## Deploy to Heroku

    # create your application on heroku
    heroku create [YOUR-APP-NAME]

    # add all of your environment settings from the .env file
    heroku config:add SFDC_CLIENT_ID=[YOUR-CLIENT-ID]
    heroku config:add SFDC_CLIENT_SECRET=[YOUR-CLIENT-SECRET]
    heroku config:add SFDC_HOST=login.salesforce.com
    heroku config:add SFDC_USERNAME=[YOUR-USERNAME]
    heroku config:add SFDC_PASSWORD=[YOUR-PASSWORD-AND-TOKEN]

    # push your code to heroku
    git push heroku master

    # after the deploy completes, open your application
    heroku open


## Contributors

* [jeffdonthemic](https://github.com/jeffdonthemic)


