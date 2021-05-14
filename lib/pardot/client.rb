module Pardot
  class Client
    include HTTParty
    base_uri 'https://pi.pardot.com'
    format :xml

    include ::Pardot::Authentication
    include ::Pardot::Http

    include ::Pardot::Objects::Accounts
    include ::Pardot::Objects::Campaigns
    include ::Pardot::Objects::CustomFields
    include ::Pardot::Objects::CustomRedirects
    include ::Pardot::Objects::DynamicContents
    include ::Pardot::Objects::EmailClicks
    include ::Pardot::Objects::EmailTemplates
    include ::Pardot::Objects::Emails
    include ::Pardot::Objects::Forms
    include ::Pardot::Objects::LifecycleHistory
    include ::Pardot::Objects::LifecycleStages
    include ::Pardot::Objects::ListMemberships
    include ::Pardot::Objects::Lists
    include ::Pardot::Objects::Opportunities
    include ::Pardot::Objects::Prospects
    include ::Pardot::Objects::ProspectAccounts
    include ::Pardot::Objects::TagObjects
    include ::Pardot::Objects::Tags
    include ::Pardot::Objects::Users
    include ::Pardot::Objects::Visitors
    include ::Pardot::Objects::Visits
    include ::Pardot::Objects::VisitorActivities

    attr_accessor :email, :password, :user_key, :api_key, :version, :salesforce_access_token, :business_unit_id, :format

    # @deprecated Arguments email, password and user_key are deprecated. Use salesforce_access_token with Salesforce OAuth.
    def initialize(email = nil, password = nil, user_key = nil, version = 3, salesforce_access_token = nil, business_unit_id = nil)
      unless email.nil? || password.nil? || user_key.nil?
        warn '[DEPRECATION] Use of username and password authentication is deprecated in favor of Salesforce OAuth. See https://developer.pardot.com/kb/authentication/ for more information.'
      end

      if !salesforce_access_token.nil? && business_unit_id.nil?
        raise 'business_unit_id required when using Salesforce access_token'
      end
      if !business_unit_id.nil? && (!business_unit_id.start_with?('0Uv') || business_unit_id.length != 18)
        raise "Invalid business_unit_id value. Expected ID to start with '0Uv' and be length of 18 characters."
      end

      @email = email
      @password = password
      @user_key = user_key
      @version = version
      @salesforce_access_token = salesforce_access_token
      @business_unit_id = business_unit_id

      @format = 'simple'
    end
  end
end
