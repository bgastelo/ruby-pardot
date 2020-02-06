module Pardot
  module Objects
    module VisitorActivities
      def visitor_activities
        @visitor_activities ||= VisitorActivities.new self
      end

      class VisitorActivities
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :read_by_email

        def read id, params = {}
          warn '[DEPRECATION] `read` is deprecated.  Please use `read_by_id` instead.'
          post "/do/read/id/#{id}", params
        end
      end
    end
  end
end
