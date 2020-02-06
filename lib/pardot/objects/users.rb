module Pardot
  module Objects
    module Users
      def users
        @users ||= Users.new self
      end

      class Users
        include ::Pardot::ApiBuilder
        add_query_endpoint
        add_endpoints :read_by_id,
                      :read_by_email
      end
    end
  end
end
