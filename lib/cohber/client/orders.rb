module Cohber
  class Client
    # Defines methods related to placing an order
    module Orders

      def order(*args)
        response = post("default.aspx", args, true, true)
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["orderReply"] unless root.nil?
        reply
      end

    end
  end
end
