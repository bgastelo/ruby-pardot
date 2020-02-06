module Pardot
  module Objects

    module EmailClicks

      def email_clicks
        @email_clicks ||= EmailClicks.new self
      end

      class EmailClicks
        include ::Pardot::ApiBuilder
        add_query_endpoint
      end
    end
  end
end
