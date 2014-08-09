class ZabbixApi
  class Basic

    def get(data)
      if data.length > 1 || data[indentify.to_sym].nil?
        get_data_custom_params(data)
      else
        get_full_data(data)
      end
    end

    def add(data)
      create(data)
    end

    def destroy(data)
      delete(data)
    end

    def method_name
      
    end

  end
end
