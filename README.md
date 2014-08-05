[![Build Status](https://travis-ci.org/kabisaict/omniauth-seaconlogistics.svg?branch=master)](https://travis-ci.org/kabisaict/omniauth-seaconlogistics)

# Omniauth::SeaconLogistics

OmniAuth OAuth2 authentication strategy for Seacon Logistics

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-seaconlogistics'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-seaconlogistics

## Usage

Put the provided key and secret in your config/secrets.yml

	development:
	  omniauth_provider_key: <key here>
	  omniauth_provider_secret: <secret here>

For production use do the following (in config/initializers/omniauth.rb):

	Rails.application.config.middleware.use OmniAuth::Builder do
    	provider :seaconlogistics,
           		 Rails.application.secrets.omniauth_provider_key,
           		 Rails.application.secrets.omniauth_provider_secret
    end
             
For staging or local use, you can override the authentication endpoint the following way:

	Rails.application.config.middleware.use OmniAuth::Builder do
		provider :seaconlogistics,
        	     Rails.application.secrets.omniauth_provider_key,
           	 	 Rails.application.secrets.omniauth_provider_secret,
           		 setup: lambda { |env|
             		env['omniauth.strategy'].options[:client_options].site = 'http://<url>/cas'
		            env['omniauth.strategy'].options[:client_options].authorize_url = 'http://<url>/authorize'
 		            env['omniauth.strategy'].options[:client_options].token_url = 'http://<url>/accessToken'
        		 }
	end




## Contributing

1. Fork it ( https://github.com/kabisaict/omniauth-seaconlogistics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
