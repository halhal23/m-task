Rails.application.routes.draw do
  root "samples#hello"
  1.upto(10) do |i|
    get "samples/lesson#{i}(/:name)" => "samples#lesson#{i}"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
