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
        begin
          conn = Faraday.new 'http://dinjas.dyndns.org/' do |c|
            c.response :xml,  :content_type => /\bxml$/
            c.response :logger
            c.request  :url_encoded
            c.adapter  :net_http
            c.use :instrumentation
            c.adapter Faraday.default_adapter
          end
          conn.headers["Accept"] = 'application/xml'
          conn.headers["Content-Type"] = 'application/xml'

          # response = conn.post '/default.aspx', args
          response = conn.post '/test', args

          puts "RESPONSE: #{response.inspect}"
          # response = post("default.aspx", args, true, true)
          # parsed = MultiXml.parse(response.body)
          root = parsed["root"]
          reply = root["quoteReply"] unless root.nil?
          reply
        rescue Exception => ex
          puts "EXCEPTION: #{ex.inspect}"
        end
      end

    end
  end
end
