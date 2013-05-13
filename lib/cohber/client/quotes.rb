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
        conn = nil
        begin
          # conn = Faraday.new(:url => 'http://dinjas.dyndns.org') do |faraday|;
          conn = Faraday.new(:url => 'http://orders.cohber.com/snapstagram/') do |faraday|
            faraday.response :logger                  # log requests to STDOUT
            faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          end
          # conn = Faraday.new 'http://dinjas.dyndns.org' do |c|
          #   c.response :xml,  :content_type => /\bxml$/
          #   c.response :logger
          #   c.request  :url_encoded
          #   c.adapter  :net_http
          #   c.use :instrumentation
          #   c.headers["Accept"] = 'application/xml'
          #   c.headers["Content-Type"] = 'application/xml'
          #   c.adapter Faraday.default_adapter
          #   c.body = args
          # end
        rescue Exception => ex
          puts "EXCEPTION: #{ex.inspect}"
        end

        begin
        rescue Exception => ex
          puts "EXCEPTION2: #{ex.inspect}"
        end

        begin
          # response = conn.post '/default.aspx', args
          puts ("args: #{args.inspect}")
          # response = conn.post '/test', nil
          response = conn.post do |req|
            req.url 'default.aspx'
            req.headers['Accept'] = 'application/xml'
            req.headers['Content-Type'] = 'application/xml'
            req.body = args[0]
          end
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
