require 'hanami/middleware/body_parser'

module Dryer
  module Web
    def self.app 
      Rack::Builder.new do 
        use Hanami::Middleware::BodyParser, :json
        run Dryer::Web::Router
      end
    end
  end
end
