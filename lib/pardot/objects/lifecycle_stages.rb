module Pardot
  module Objects

    module LifecycleStages

      def lifecycle_stages
        @lifecycle_stages ||= LifecycleStages.new self
      end

      class LifecycleStages
        include ::Pardot::ApiBuilder
        add_query_endpoint
      end
    end
  end
end
