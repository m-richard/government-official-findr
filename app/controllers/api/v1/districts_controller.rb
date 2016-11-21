class Api::DistrictsController < ApiController
  def create
    @source = params[:sourceTitle]
    @key = ENV["SUNLIGHT_API_KEY"]
    @url = "https://newsapi.org/v1/articles?source=" + @source + "&apiKey=" + "#{@key}"
    @articles = HTTParty.get(@url)["articles"]
    respond_to do |format|
      format.json do
        render json: @articles
      end
    end
  end
end
