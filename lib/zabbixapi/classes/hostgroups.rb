class ZabbixApi
  class HostGroups < Basic

    def array_flag
      true
    end

    def method_name
      "hostgroup"
    end

    def indentify
      "name"
    end

    def key
      "groupid"
    end
    
        # Update hostgroup, add host to group
    # 
    # * *Args*    :
    #   - +data+ -> Hash with :groupid => id, :hostids => []
    # * *Returns* :
    #   - Integer
    def add_host(data)
      result = @client.api_request(
        :method => "hostgroup.massAdd", 
        :params => {
          :groups => [{:groupid => data[:groupid]}],
          :hosts => data[:hostids].map { |h| {:hostid => h} }
        }
      )
      result ? result['groupids'][0].to_i : nil
    end
    
  end
end
