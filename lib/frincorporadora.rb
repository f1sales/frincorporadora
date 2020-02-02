require "frincorporadora/version"

require "f1sales_custom/parser"
require "f1sales_custom/source"
require "f1sales_custom/hooks"
require "f1sales_helpers"

module Frincorporadora
  class Error < StandardError; end
  class F1SalesCustom::Hooks::Lead 

    def self.switch_source(lead)
      product_name = lead.product.name.split('-').first rescue nil

      return lead.source.name unless product_name


      if product_name.include?('URBS')

        return sources[0][:name]
      elsif product_name.include?('Marcel')

        return sources[1][:name]
      else

        return lead.source.name
      end
    end

    def self.sources
      [
        {
          name: 'URBS - Facebook'
        },
        {
          name: 'Marcelo - Facebook'
        }
      ]
    end
  end
end
