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
        rescue Exception => ex
          puts "EXCEPTION: #{ex.inspect}"
        end

        begin
          conn.headers["Accept"] = 'application/xml'
          conn.headers["Content-Type"] = 'application/xml'
        rescue Exception => ex
          puts "EXCEPTION2: #{ex.inspect}"
        end

        begin
          # response = conn.post '/default.aspx', args
          logger.debug ("args: #{args.inspect}")
          response = conn.post '/test', args
        rescue Exception => ex
          puts "EXCEPTION3: #{ex.inspect}"
        end
        begin
          puts "RESPONSE: #{response.inspect}"
          # response = post("default.aspx", args, true, true)
          parsed = MultiXml.parse(response.body)
          root = parsed["root"]
          reply = root["quoteReply"] unless root.nil?
          reply
        rescue Exception => ex
          puts "EXCEPTION4: #{ex.inspect}"
        end
      end

    end
  end
end
