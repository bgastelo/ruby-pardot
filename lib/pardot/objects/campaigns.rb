module Pardot
  module Objects

    module Campaigns

      def campaigns
        @campaigns ||= Campaigns.new self
      end

      class Campaigns
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :update_by_id,
                      :create
      end
    end
  end
end
