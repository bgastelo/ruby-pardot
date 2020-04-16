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

    attr_accessor :email, :password, :user_key, :api_key, :version, :format

    def initialize email, password, user_key, version = 3
      @email = email
      @password = password
      @user_key = user_key
      @version = version

      @format = "simple"
    end

  end
end
