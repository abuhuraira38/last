class ApiController < ApplicationController
  before_action :authenticate
  before_action :require_json

private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.find_by(key: token, deactivated_at: nil).present?
    end
  end
# START:edit:3
  def require_json
    if !request.format.json?
      head 406
    end
  end
# END:edit:3
end
