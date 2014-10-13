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
    
    # Get all medias for a user
    # 
    # * *Args*    :
    #   - +data+ -> Hash with :userid => "userid"
    # * *Returns* :
    #   - result -> Array of user medias
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
    
    # Replace all medias for a user
    # 
    # * *Args*    :
    #   - +data+ -> Hash with :userid => "userid", :medias => [ "array_of_medias" ]
    # * *Returns* :
    #   - Integer
    def update_medias(data)
      result = @client.api_request(
        :method => "user.updatemedia",
        :params => {
          :users => { :userid => data[:userid] },
          :medias => data[:medias],
          :output => "extend"
        }
      )
      result ? result['userids'][0].to_i : nil
    end
  end
end
