module Pardot
  module Objects

    module DynamicContents

      def dynamic_contents
        @dynamic_contents ||= DynamicContents.new self
      end

      class DynamicContents
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
