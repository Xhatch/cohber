module Cohber
  class Client
    # Defines methods related to placing an order
    module Orders

      def order(xml)
        response = post 'default.aspx', xml, true, true
        parsed = MultiXml.parse(response.body)
      end

    end
  end
end
