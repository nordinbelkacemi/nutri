class EdamamService
  # use https://github.com/lostisland/faraday methods to make requests
  def initialize(args)
    # service to call the edaman api from any controller or model
    # use with EdamanService.new(__optional_param__)#search
    @api_key = ENV['EDAMAM_API_KEY']
    @app_id = ENV['EDAMAM_APP_ID']
    @base_url = "https://api.edamam.com/"
  end

  def search
    endpoint = "search"

  end
end
