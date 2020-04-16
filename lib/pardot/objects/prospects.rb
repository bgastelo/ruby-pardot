require 'cgi'

module Pardot
  module Objects
    module Prospects
      def prospects
        @prospects ||= Prospects.new self
      end

      class Prospects
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :assign_by_id,
                      :assign_by_fid,
                      :unassign_by_id,
                      :unassign_by_fid,
                      :create_by_email,
                      :read_by_email,
                      :read_by_id,
                      :read_by_fid,
                      :update_by_id,
                      :update_by_fid,
                      :delete_by_id,
                      :delete_by_fid

        # missing batchUpdate batchUpsert batchCreate

        def assign_by_email email, params
          post "/do/assign/email/#{clean_param(email)}", params
        end

        def create email, params = {}
          warn "[DEPRECATION] `create` is deprecated.  Please use `create_by_email` instead."
          post "/do/create/email/#{clean_param(email)}", params
        end

        # def read_by_email email, params = {}
        #   post "/do/read/email/#{email}", params
        # end
        #
        # def read_by_id id, params = {}
        #   post "/do/read/id/#{id}", params
        # end
        #
        # def read_by_fid fid, params = {}
        #   post "/do/read/fid/#{fid}", params
        # end

        def unassign_by_email email, params = {}
          post "/do/unassign/email/#{clean_param(email)}", params
        end

        def update_by_email email, params = {}
          post "/do/update/email/#{clean_param(email)}", params
        end

        # def update_by_id id, params = {}
        #   post "/do/update/id/#{id}", params
        # end
        #
        # def update_by_fid fid, params = {}
        #   post "/do/update/fid/#{fid}", params
        # end

        def upsert_by_email email, params = {}
          post "/do/upsert/email/#{clean_param(email)}", params
        end

        def upsert_by_id id, params = {}
          post "/do/upsert/id/#{clean_param(id)}", params
        end
        
        def upsert_by_fid fid, params = {}
          post "/do/upsert/fid/#{clean_param(fid)}", params
        end
      end
    end
  end
end
