require 'hashie'

module NRB
  class HTTPService
    class Response

      attr_reader :status, :body, :headers

      def errored?
        ! success?
      end


      def initialize(args)
        @status = args[:status]
        @body = args[:body]
        @headers = args[:headers]
        freeze
      end


      def success?
        status >= 200 && status < 300
      end

    end
  end
end
