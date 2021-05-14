module Pardot
  module Objects
    module CustomFields
      def custom_fields
        @custom_fields ||= CustomFields.new self
      end
      
      class CustomFields
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :update_by_id,
                      :create,
                      :delete_by_id
      end
    end
  end
end
