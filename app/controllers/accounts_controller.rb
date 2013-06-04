class AccountsController < ApplicationController
  respond_to :json

  def index
    puts "running index"
    respond_with client.query('select id, name, type from account limit 10')
  end

  def show
    respond_with client.query("select id, name, type from account where id = '#{params[:id]}'").first
  end	

  # curl -v  -H "Content-type: application/json" -X POST -d '{"name": "some test name"}' http://localhost:3000/accounts
  def create
    # create the account in salesforce
    id = client.create!('Account', Name: params[:name])
    # query for the newly created resource
    account = client.query("select id, name, type from account where id = '#{id}'").first
    # return the resource so it can be added to the collection
    respond_with(account, :status => :created, :location => account_url(account))
  end		

  def update
    # :ok
    respond_with client.query('select id, name from account limit 1').first
  end		

	private

        def client
          client = Restforce.new :username => ENV['SFDC_USERNAME'],
            :password       => ENV['SFDC_PASSWORD'],
            :client_id      => ENV['SFDC_CLIENT_ID'],
            :client_secret  => ENV['SFDC_CLIENT_SECRET'],
            :host           => ENV['SFDC_HOST']
          client.authenticate!
          client
        end

end
