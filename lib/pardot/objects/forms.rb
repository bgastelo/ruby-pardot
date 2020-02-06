module Pardot
  module Objects

    module Forms

      def forms
        @forms ||= Forms.new self
      end

      class Forms
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
