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
    
    # replace a users media with the provided media. This just blows away existing media.
    # data[:userid] => userid
    # data[:medias] => [ {:mediatypeid => 1, :sendto => "support@company.com", :active => 0, :severity => 0x3C,
    #                   :period => "1-7,00:00-23:59;"}, {:mediatypeid => 2, :sendto => "13067138956",
    #                   :active => 0, :severity => 0x30, :period => "1-7,00:00-23:59;"} ]
    # :active, 0 is enabled
    # :severity, bit mask MSB to LSB (Disaster|High|Average|Warning|Info|None)
    def update_medias(data)
      result = @client.api_request(
        :method => "user.updatemedia",
        :params => {
          :users => { :userid => data[:userid] },
          :medias => data[:medias],
          :output => "extend"
        }
      )
      result ? result : nil
    end
  end
end
