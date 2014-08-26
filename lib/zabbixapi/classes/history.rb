class ZabbixApi
  class History < Basic

    def array_flag
      true
    end

    def method_name
      "history"
    end

    def indentify
      "itemid"
    end

    def default_options
      {
        :itemid => nil,
        :clock => nil,
        :value => nil,
        :ns => nil
      }
    end
  end
end
