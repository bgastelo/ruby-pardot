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
