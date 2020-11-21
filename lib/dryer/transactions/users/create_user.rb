module Dryer
  module Transactions
    module Users
      class CreateUser
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import["contracts.users.create_user"]
        include Import["repositories.user_repository"]

        def call(input)
          values = yield validate(input)
          user = yield persist(values)

          Success(user)
        end

        def validate(input)
          create_user.call(input).to_monad
        end

        def persist(result)
          Success(user_repository.create(result.values))
        end

      end
    end
  end
end
