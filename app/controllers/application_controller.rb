class ApplicationController < ActionController::Base
# START:edit:3
  before_action :set_requestid_in_thread_local

  def set_request_id_in_thread_local
    Thread.current.thread_variable_set(
      "request_id", request.request_id)
  end

# END:edit:3
  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.request_id
  end
end
