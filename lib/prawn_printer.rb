require "prawn_printer/version"
require "prawn"

module PrawnPrinter
  # Your code goes here...
  class Printer
    attr_reader :document

    def initialize(orientation: :portrait)
      @document = Prawn::Document.new page_layout: orientation,
                                      page_size: "LETTER"
    end
  end
end
