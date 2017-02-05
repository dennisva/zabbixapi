class ZabbixApi
  class Events < Basic

    def array_flag
      true
    end
    
    def method_name
      "event"
    end

    def indentify
      "eventid"
    end
    
    def keys
      "eventids"
    end
    
    def acknowledge(data)
      result = @client.api_request(
        :method => "event.acknowledge", 
        :params => {
          :eventids => data[:eventids],
          :message => data[:message]
        }
      )
    end

  end
end
