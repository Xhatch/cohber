module Cohber
  class Client
    # Defines methods related to getting a quote
    module Quotes

      def quote(*args)
        response = Faraday.post do |req|
          req.url 'http://orders.cohber.com/snapstagram/default.aspx'
          req.headers['Content-Type'] = 'application/xml'
          req.headers['Accempt'] = 'application/xml'
          req.body = args
          put "REQUEST:: #{req.inspect}"
        end
        # response = post("default.aspx", args, true, true)
        # response = post("default.aspx", args, {'Accept' => 'application/xml', 'Content-Type' => 'application/xml'}, true)
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["quoteReply"] unless root.nil?
        reply
      end

    end
  end
end
