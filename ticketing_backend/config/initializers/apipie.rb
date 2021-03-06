Apipie.configure do |config|
  config.app_name                = "TicketingBackend"
  config.api_base_url            = "api"
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  #config.api_controllers_matcher = "#{Rails.root}/app/controllers/{[!concerns/]**/*,*}.rb"
end

class Apipie::Application
  alias_method :orig_load_controller_from_file, :load_controller_from_file
  def load_controller_from_file(controller_file)
    begin
      orig_load_controller_from_file(controller_file)
    rescue LoadError => e
       controller_file.gsub(/\A.*\/app\/controllers\//,"").gsub(/\.\w*\Z/,"").gsub("concerns/","").camelize.constantize
    end
  end
end
