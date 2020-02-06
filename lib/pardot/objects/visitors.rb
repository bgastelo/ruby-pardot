module Pardot
  module Objects
    module Visitors
      def visitors
        @visitors ||= Visitors.new self
      end

      class Visitors
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :read_by_email

        def assign id, params = {}
          warn '[DEPRECATION] `assign` is deprecated.  Please use `assign_by_id` instead.'
          post "/do/assign/id/#{id}", params
        end

        def read id, params = {}
          warn '[DEPRECATION] `read` is deprecated.  Please use `read_by_id` instead.'
          post "/do/read/id/#{id}", params
        end
      end
    end
  end
end
