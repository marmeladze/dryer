module Dryer
  module Repositories
    class UserRepository < ROM::Repository[:users]
      include Import['container']

      struct_namespace Dryer
      
      commands :create, use: :timestamps, plugins_options: {
        timestamps: {
          timestamps: %i(created_at updated_at)
        }
      }

      commands update: :by_pk, use: :timestamps, plugins_options: {
        timestamps: {
          timestamps: :updated_at
        }
      }

      def all
        users.to_a
      end

      def by_id(id)
        users.by_pk(id).one!
      end

      def query(conditions)
        users.where(conditions).to_a
      end

      def modify(id, attrs)
        update(:id, attrs)
      end

    end
  end
end
