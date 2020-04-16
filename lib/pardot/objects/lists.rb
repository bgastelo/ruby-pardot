module Pardot
  module Objects
    module Lists
      def lists
        @lists ||= Lists.new self
      end

      class Lists
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :update_by_id,
                      :create,
                      :delete_by_id

        def update id, params = {}
          warn "[DEPRECATION] `update` is deprecated.  Please use `update_by_id` instead."
          post "/do/update/id/#{clean_param(id)}"
        end
      end
    end
  end
end
