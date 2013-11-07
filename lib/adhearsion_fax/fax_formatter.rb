require 'punchblock/component/output'

module AdhearsionFax
  module FaxFormatter

    def self.format_faxes(faxes, options)
      faxes.map do |fax_object|
        if fax_object.is_a?(Hash)
          fax_object.map do |uri, individual_options|
            combined_options = options.merge individual_options
            format_fax uri, combined_options
          end
        else
          format_fax fax_object, options
        end
      end.flatten
    end

    def self.format_fax(fax, options)
      Punchblock::Component::SendFax::FaxDocument.new options.merge(url: fax)
    end
  end
end
