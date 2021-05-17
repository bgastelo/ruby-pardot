# frozen_string_literal: true

require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe Pardot::ApiBuilder do
  let(:dummy_class) { Class.new { include ::Pardot::ApiBuilder } }
  let(:dummy_instance) { dummy_class.new(nil) }

  describe '#transform_classname' do
    it 'does the correct string transform' do
      aggregate_failures do
        [
          ['CustomFields', 'customField'],
          ['Emails', 'email'],
          ['Opportunities', 'opportunity'],
          ['ProspectAccounts', 'prospectAccount']
        ].each do |classname, expectation|
          expect(dummy_instance.send(:transform_classname, classname)).to eq(expectation)
        end
      end
    end
  end
end
