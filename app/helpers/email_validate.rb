module EmailValidate
  require "net/http"
  require "net/https"

  def make_abstract_request(email)
    uri = URI("https://emailvalidation.abstractapi.com/v1/?api_key=37f05b4446684c3182d2bdf7873ef167&email=#{email}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri)

    response = http.request(request)
    JSON.parse(response.body)
  rescue StandardError => error
    puts "Error (#{error.message})"
  end
end
