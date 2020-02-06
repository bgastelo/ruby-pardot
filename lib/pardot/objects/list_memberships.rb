module Pardot
  module Objects
    module ListMemberships
      def list_memberships
        @list_memberships ||= ListMemberships.new self
      end
      class ListMemberships
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :read_by_list_id_and_prospect_id,
                      :create_by_list_id_and_prospect_id,
                      :update_by_id,
                      :update_by_list_id_and_prospect_id,
                      :delete_by_id,
                      :delete_by_list_id_and_prospect_id
      end
    end
  end
end
