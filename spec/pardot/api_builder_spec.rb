require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe Pardot::ApiBuilder do
  describe "#results_field_name" do
    def transform(last_class)
      last_class.sub(/s$/, '').sub(/^(\w)/, last_class.to_s[0].downcase)
    end

    it 'works' do
      aggregate_failures do
        [
          %w[CustomFields customField],
          %w[Emails email],
          %w[Opportunities opportunity]
        ].each do |classname, pathname|
          expect(transform(classname)).to eq(pathname)
        end
      end
    end
  end
end
