module Pardot
  module Objects
    module Emails
      def emails
        @emails ||= Emails.new self
      end

      class Emails
        def initialize(client)
          @client = client
        end

        def read_by_id(id)
          get "/do/read/id/#{id}"
        end

        def send_to_prospect(prospect_id, params)
          post "/do/send/prospect_id/#{prospect_id}", params
        end

        def send_to_prospect_email prospect_email, params
          post "/do/send/prospect_email/#{prospect_email}", params
        end

        def send_to_list(params)
          post '/do/send', params
        end

        protected

        def get(path, params = {}, result = 'email')
          response = @client.get 'email', path, params
          result ? response[result] : response
        end

        def post(path, params = {}, result = 'email')
          response = @client.post 'email', path, {}, 0, params
          result ? response[result] : response
        end
      end
    end
  end
end
