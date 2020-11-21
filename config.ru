require_relative 'config/application'

Dryer::Application.finalize!

run Dryer::Web.app
