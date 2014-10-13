class ZabbixApi
  class Actions < Basic

    def array_flag
      true
    end
    
    def method_name
      "action"
    end

    def indentify
      "actionid"
    end
    
    def keys
      "actionids"
    end
    
  end
end
