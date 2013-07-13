module Cohber
  # Wrapper for the Cohber API
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Cohber::Client::Orders
  end
end
