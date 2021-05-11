require 'cgi'
module Pardot
  module ApiBuilder
    module ClassMethods
      def add_endpoints(*api_method_names)
        api_method_names.each { |api_method_name| add_endpoint(api_method_name) }
      end

      def add_endpoint(api_method_name)
        api_method_name = String(api_method_name)
        method = api_method_name =~ /^read/ ?  :get : :post
        action = api_method_name.split(/_(by|to)_/).first
        args = api_method_name.split(/_(by|to)_/).last.split(/_and_/)

        define_method api_method_name do |*arguments|
          params = arguments.last.is_a?(Hash) ? arguments.pop : {}
          path = ['do', action, args.map.with_index { |e, idx| [e, clean_param(arguments[idx])] }].flatten.join("/")
          self.send method, path, params
        end
      end
      
      def add_query_endpoint
        define_method :query do |params = {}|
          result = get "/do/query", params, "result"
          result["total_results"] = result["total_results"].to_i if result["total_results"]
          result
        end
      end
    end
    
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :attr_reader, :client
    end
    
    def initialize client
      @client = client
    end
            
    protected
    def clean_param(param)
      # TODO: does this work?
      param.is_a?(Integer) ? param : CGI.escape(param)
    end

    def get(path, params = {}, result = results_field_name)
      response = client.get results_field_name, path, params
      (result && response) ? response[result] : response
    end

    def post(path, params = {}, result = results_field_name)
      response = client.post results_field_name, path, params
      (result && response) ? response[result] : response
    end
    
    def results_field_name
      last_class = self.class.to_s.split(/::/).last
      last_class.sub(/s$/, '').sub(/^(\w)/, last_class.to_s[0].downcase)
    end
  end
end
