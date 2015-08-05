class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

    def authenticated?
      authenticate_or_request_with_http_basic do |name|
        User.where( name: name).present?
      #authenticate_or_request_with_http_basic do |name, password|
        #User.where( name: name, password: password ).present?
        
      end
    end
end
