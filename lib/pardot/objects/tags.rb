module Pardot
  module Objects

    module Tags

      def tags
        @tags ||= Tags.new self
      end

      class Tags
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
