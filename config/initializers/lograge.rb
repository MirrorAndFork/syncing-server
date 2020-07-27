Rails.application.configure do
  config.lograge.enabled = Rails.env.production?

  # Generate log in JSON
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.custom_options = lambda do |event|
    {
      :ddsource => ["ruby"],
      :params => event.payload[:params],
      :level => event.payload[:level]
    }
  end
end
