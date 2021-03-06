module OTX
  #
  # AlienVault OTX Pulse Record
  #
  # @author Stephen Kapp
  # @attr [String] id OTX ID value for the pulse Record
  # @attr [String] name Pulse Name
  # @attr [String] description Description of the pulse
  # @attr [String] author_name Name of the pulse author_name
  # @attr [Array<String>] tags Array of 'tags' to describe the pulse
  # @attr [Array<String>] referenes Array of references attached to the pulse
  # @attr [String] revision Revision number of the OTX Pulse Record
  # @attr [Array<OTX::Indicators>] indicators Array of the IoC attached to the OTX pulse
  #
  class Pulse < OTX::Type::Base
    attr_accessor :id, :name, :description, :author_name,
      :tags, :references, :revision, :indicators

    def initialize(attributes={})
      attributes.each do |key, value|
        if key != 'indicators'
          send("#{key}=", value)
        else
          @indicators = []
          value.each do |indicator|
            @indicators << OTX::Indicators.new(indicator)
          end
        end
      end
    end
  end
end
