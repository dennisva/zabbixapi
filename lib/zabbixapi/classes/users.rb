class ZabbixApi
  class Users < Basic
    
    def array_flag
      true
    end
    
    def method_name
      "user"
    end

    def keys
      "userids"
    end

    def key 
      "userid"
    end

    def indentify
      "alias"
    end

    def add_medias(data)
      result = @client.api_request(
        :method => "user.addMedia",
        :params => {
          :users => data[:userids].map { |t| {:userid => t} },
          :medias => data[:media]
        }
      )
      result ? result['mediaids'][0].to_i : nil
    end
    
    def get_medias(data)
      result = @client.api_request(
        :method => "usermedia.get",
        :params => {
          :userids => data[:userid],
          :output => "extend"
        }
      )
      result ? result : nil
    end

  end
end
