module Pardot
  class Client
    include HTTParty
    base_uri 'https://pi.pardot.com'
    format :xml

    include Authentication
    include Http

    include Objects::Accounts
    include Objects::Campaigns
    include Objects::CustomFields
    include Objects::CustomRedirects
    include Objects::DynamicContents
    include Objects::EmailClicks
    include Objects::EmailTemplates
    include Objects::Emails
    include Objects::Forms
    include Objects::LifecycleHistory
    include Objects::LifecycleStages
    include Objects::ListMemberships
    include Objects::Lists
    include Objects::Opportunities
    include Objects::Prospects
    include Objects::ProspectAccounts
    include Objects::TagObjects
    include Objects::Tags
    include Objects::Users
    include Objects::Visitors
    include Objects::Visits
    include Objects::VisitorActivities

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
