class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

    def authenticated?
      authenticate_or_request_with_http_basic do |name|
        User.where( name: name).present?
      end
    end
end
