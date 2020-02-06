module Pardot
  module Objects
    module ProspectAccounts
      def prospect_accounts
        @prospect_accounts ||= ProspectAccounts.new self
      end

      class ProspectAccounts
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :create,
                      :describe,
                      :create,
                      :read_by_id,
                      :update_by_id,
                      :assign_by_id
      end
    end
  end
end
