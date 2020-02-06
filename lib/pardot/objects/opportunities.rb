module Pardot
  module Objects
    
    module Opportunities
      
      def opportunities
        @opportunities ||= Opportunities.new self
      end
      
      class Opportunities
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :create_by_prospect_email,
                      :create_by_prospect_id,
                      :read_by_id,
                      :update_by_id,
                      :delete_by_id,
                      :undelete_by_id
                              
        def create_by_email email, params = {}
          warn "[DEPRECATION] `create_by_email` is deprecated.  Please use `create_by_prospect_email` instead."
          post "/do/create/prospect_email/#{email}", params
        end
        
        def create_by_id prospect_id, params = {}
          warn "[DEPRECATION] `create_by_id` is deprecated.  Please use `create_by_prospect_id` instead."
          post "/do/create/prospect_id/#{prospect_id}", params
        end
      end      
    end
  end
end
