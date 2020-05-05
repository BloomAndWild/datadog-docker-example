Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.base_controller_class = 'ActionController::API'
    # Generate log in JSON
    config.lograge.formatter = Lograge::Formatters::Json.new
    config.lograge.custom_options = lambda do |event|
      { :ddsource => ["ruby"],
        :params => event.payload[:params]
      }
    end
end