module Pardot
  module Objects

    module TagObjects

      def tag_objects
        @tag_objects ||= TagObjects.new self
      end

      class TagObjects
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
