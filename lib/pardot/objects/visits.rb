module Pardot
  module Objects
    module Visits
      def visits
        @visits ||= Visits.new self
      end

      class Visits
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id

        def read(id, params = {})
          warn '[DEPRECATION] `read` is deprecated.  Please use `read_by_id` instead.'
          post "/do/read/id/#{id}", params
        end
      end
    end
  end
end
