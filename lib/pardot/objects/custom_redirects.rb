module Pardot
  module Objects

    module CustomRedirects

      def custom_redirects
        @custom_redirects ||= CustomRedirects.new self
      end

      class CustomRedirects
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id
      end
    end
  end
end
