module Dryer
  module Web
    module Controllers
      module Users
        class Create
          include Hanami::Action
          include Import['transactions.users.create_user']
          include Dry::Monads[:result]

          def call(params)
            case create_user.call(params.to_h)
            in Success(result)
              self.status = 200
              self.body = result.to_h.to_json
            in Failure(result)
              self.status = 422
              self.body = {errors: result.errors.to_h}.to_json
            end
          end

        end
      end
    end
  end
end