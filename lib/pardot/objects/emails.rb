module Pardot
  module Objects
    module Emails
      def emails
        @emails ||= Emails.new self
      end

      class Emails
        include ::Pardot::ApiBuilder
        add_endpoints :read_by_id,
                      :stats_by_id,
                      :send_by_prospect_id,
                      :send_by_prospect_email
                      # :send, we can't overwrite the send method as it's how we do metaprogramming

        def send_to_prospect prospect_id, params
          warn "[DEPRECATION] `send_to_prospect` is deprecated.  Please use `send_by_prospect_id` instead."
          post "/do/send/prospect_id/#{clean_param(prospect_id)}", params
        end

        def send_to_prospect_email prospect_email, params
          warn "[DEPRECATION] `send_to_prospect_email` is deprecated.  Please use `send_by_prospect_email` instead."
          post "/do/send/prospect_email/#{clean_param(prospect_email)}", params
        end

        def send_to_list(params)
          post '/do/send', params
        end
      end
    end
  end
end
