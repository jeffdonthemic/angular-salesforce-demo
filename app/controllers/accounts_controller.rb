class AccountsController < ApplicationController
	respond_to :json

	def index
		respond_with client.query('select id, name from account limit 5')
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
