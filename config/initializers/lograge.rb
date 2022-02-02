Rails.application.configure do
  if !Rails.env.development? || 
      ENV["LOGRAGE_IN_DEVELOPMENT"] == "true"
    config.lograge.enabled = true
  else
    config.lograge.enabled = false
  end
# START:edit:3
  config.lograge.custom_options = lambda do |event|
    {
      request_id: event.payload[:request_id]
    }
  end
# END:edit:3
end
