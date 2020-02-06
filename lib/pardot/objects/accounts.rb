module Pardot
  module Objects

    module Accounts

      def accounts
        @accounts ||= Accounts.new self
      end

      class Accounts
        include ::Pardot::ApiBuilder
        add_endpoints :read
      end
    end
  end
end
