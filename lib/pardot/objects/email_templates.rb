module Pardot
  module Objects

    module EmailTemplates

      def email_templates
        @email_templates ||= EmailTemplates.new self
      end

      class EmailTemplates
        include ::Pardot::ApiBuilder
        add_endpoints :read_by_id,
                      :listOneToOne
      end
    end
  end
end
