require "prawn_printer/version"
require "prawn"

module PrawnPrinter
  # Your code goes here...
  class Printer
    attr_reader :document

    def initialize(orientation: :portrait, positionables: [])
      @document = Prawn::Document.new page_layout: orientation,
                                      page_size: "LETTER"
      print_printables(printables)
    end

    private

    def print(printable)
      @document.formatted_text_box(printable.text)
    end

    def print_printables(printables)
      printables.each(&method(:print))
    end
  end
end
