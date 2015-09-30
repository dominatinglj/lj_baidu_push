require 'open-uri'
require 'digest/md5'
require "net/http"
require 'json'

module LjBaiduPush
  
  #签名
  def self.sign(secret_key, method, url, params)
    result                    = "#{method}#{url}"
    paramArrays               = params.sort
    paramArrays.each do |k|
      result += "#{k[0]}=#{k[1]}"
    end
    result += secret_key
    Digest::MD5.hexdigest(URI::encode_www_form_component(result))
  end
  
  def self.push_single_device
    url                       = "http://api.tuisong.baidu.com/rest/3.0/push/single_device"
    uri                       = URI.parse(url)
    http                      = Net::HTTP.new(uri.host,uri.port)
    params                    = { "apikey" => "rZ8XbPri7PPlB8TpLWGRFsDd", "timestamp" => Time.now.to_i}
    params["channel_id"]      = "4975304986872672241"
    message           = {
      "aps"         => { 
        "alert"  => "消息测试",
        "content-available" => '1'
      },
      "key1"        => "value1",
      "key2"        => "value2"
    }

    params["msg"]           = message.to_json
    params["deploy_status"] = 1
    sign                      = self.sign("B7hbXYPte9FiyAawaa6LnAhR8TMM2mAl", "POST", url, params)
    params["sign"]            = sign
    req                       = Net::HTTP::Post.new(uri)
    req.set_form_data(params)
    req["User-Agent"]         = "BCCS_SDK/3.0 (Linux version 3.13.0-45-generic) Ruby/2.2 (Baidu Push Server SDK V3.0.0)"
    req.content_type          = "application/x-www-form-urlencoded;charset=utf-8"
    response                  = http.request(req)
  end
end
