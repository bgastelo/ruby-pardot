module Pardot
  module Objects

    module LifecycleHistory

      def lifecycle_history
        @lifecycle_history ||= LifecycleHistory.new self
      end

      class LifecycleHistory
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
