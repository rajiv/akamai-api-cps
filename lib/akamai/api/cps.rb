require 'akamai/api/cps/version'
require 'akamai/edgegrid'
require 'json'
require 'net/http'
require 'openssl'
require 'uri'

module Akamai
  module API
    class CPS
      def initialize
        @http = Akamai::Edgegrid::HTTP.new(get_host(), 443)
        @http.setup_from_edgerc(section: 'default')
      end

      def enrollments(contract_id)
        response = api_get("/enrollments?contractId=#{contract_id}", 'application/vnd.akamai.cps.enrollments.v5+json')
        response.enrollments
      end

      def production_certificate(enrollment_id)
        get_certificate(enrollment_id, 'production')
      end

      def production_full_chain(enrollment_id)
        get_full_chain(enrollment_id, 'production')
      end

      def staging_certificate(enrollment_id)
        get_certificate(enrollment_id, 'staging')
      end

      def staging_full_chain(enrollment_id)
        get_full_chain(enrollment_id, 'staging')
      end


      private

      def api_get(endpoint, accept)
        baseuri = URI('https://' + @http.host)
        uri = URI.join(baseuri.to_s, '/cps/v2' + endpoint).to_s

        request = Net::HTTP::Get.new(uri)
        request['Accept'] = accept
        response = @http.request(request)

        return nil if response.code.to_i == 404
        JSON.parse(response.body, object_class: OpenStruct)
      end

      def get_certificate(enrollment_id, environment)
        response = get_deployment(enrollment_id, environment)
        return nil if response.nil?
        OpenSSL::X509::Certificate.new(response.certificate)
      end

      def get_full_chain(enrollment_id, environment)
        response = get_deployment(enrollment_id, environment)
        return nil if response.nil?
        [response.certificate, response.trustChain].join("\n")
      end

      def get_deployment(enrollment_id, environment)
        api_get("/enrollments/#{enrollment_id}/deployments/#{environment}", 'application/vnd.akamai.cps.deployment.v3+json')
      end
    end
  end
end
