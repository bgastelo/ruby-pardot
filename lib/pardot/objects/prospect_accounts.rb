module Pardot
  module Objects
    module ProspectAccounts
      def prospect_accounts
        @prospect_accounts ||= ProspectAccounts.new self
      end

      class ProspectAccounts
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :describe,
                      :read_by_id,
                      :update_by_id,
                      :assign_by_id

        def read(id, params)
          warn "[DEPRECATION] `read` is deprecated.  Please use `read_by_id` instead."
          read_by_id(id, params)
        end

        def update(id, params)
          warn "[DEPRECATION] `update` is deprecated.  Please use `update_by_id` instead."
          update_by_id(id, params)
        end

        def create(params)
          post('/do/create', params)
        end
      end
    end
  end
end
