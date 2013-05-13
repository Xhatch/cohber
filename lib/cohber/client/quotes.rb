module Cohber
  class Client
    # Defines methods related to getting a quote
    module Quotes

      def quote(*args)
        # response = Faraday.post do |req|
        #   req.url 'http://orders.cohber.com/snapstagram/default.aspx'
        #   req.headers['Content-Type'] = 'application/xml'
        #   req.headers['Accept'] = 'application/xml'
        #   req.body = args
        #   put "REQUEST:: #{req.inspect}"
        # end
        conn = Faraday.new('http://orders.cohber.com/snapstagram/', ssl: {verify: false}) do |builder|
          builder.request  :url_encoded
          builder.response :logger
          builder.adapter  :net_http
        end

        resp = conn.post '/default.aspx', args

        puts resp.body
        # response = post("default.aspx", args, true, true)
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["quoteReply"] unless root.nil?
        reply
      end

    end
  end
end
