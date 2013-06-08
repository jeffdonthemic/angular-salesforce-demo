class AccountsController < ApplicationController
  respond_to :json

  def index
    # simply return the query as json
    respond_with client.query('select id, name, type, billingstate from account 
      order by lastmodifieddate desc limit 5')
  end

  def show
    # return the requested record as json
    respond_with client.query("select id, name, type, billingstate from account 
      where id = '#{params[:id]}'").first
  end	

  # create a new record in salesforce. Use the following command for testing:
  #   curl -v  -H "Content-type: application/json" -X POST -d '{"name": "some test name"}' http://localhost:3000/accounts
  def create
    # create the account in salesforce and get the new id
    id = client.create!('Account', Name: params[:name], Type: 'Prospect', BillingState: 'NY')
    # query for the newly created account
    account = client.query("select id, name, type from account where id = '#{id}'").first
    # return the resource so it can be added to the collection
    respond_with(account, :status => :created, :location => account_url(account))
  end		

  def update
    # update only two of the fields in salesforce and return the record
    client.update!('Account', Id: params[:account][:Id], Name: params[:account][:Name], 
      Type: params[:account][:Type])
    respond_with client.query("select id, name, type, billingstate from account 
      where id ='#{params[:account][:Id]}'")
  end		

  private

    # define the restforce client and authenticate
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
