require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class SeaconLogistics < OmniAuth::Strategies::OAuth2
      option :name, :seaconlogistics

      option :client_options, {
        site: 'https://cas.seaconlogistics.com',
        authorize_url: 'https://cas.seaconlogistics.com/oauth2.0/authorize',
        token_url: 'https://cas.seaconlogistics.com/oauth2.0/accessToken',
        token_method: :get
      }

      option :token_params, {
        parse: :query
      }

      uid { raw_info['id'] }

      info do
        {
          name: name,
          first_name: attributes['first_name'],
          last_name: attributes['last_name'],
          email: attributes['email'],
        }
      end

      extra do
        {
          applications: attributes['applications']
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :access_token
        @raw_info ||= access_token.get('/oauth2.0/profile').parsed
      end

      private

      def name
        [attributes['first_name'], attributes['last_name']].join(' ')
      end

      def attributes
        raw_info['attributes'].reduce Hash.new, :merge
      end
    end
  end
end
