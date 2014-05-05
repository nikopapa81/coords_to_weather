CoordsToWeather::Application.routes.draw do
  get("/coords", { :controller => "coords", :action => "fetch_weather" })
end
