require "prawn_printer/version"
require "prawn"

module PrawnPrinter
  # Your code goes here...
  class Printer
    attr_reader :document

    def initialize(orientation: :portrait, printables: [])
      @document = Prawn::Document.new page_layout: orientation,
                                      page_size: "LETTER"
      print_printables(printables)
    end

    private

    def additional_options(printable)
      custom_options = printable.fetch(:options, {})
      default_options.merge(custom_options)
    end

    def color(printable)
      printable.fetch(:color, '000000')
    end

    def default_options
      { valign: :center, size: 12, height: 18, width: 300,
        overflow: :shrink_to_fit, min_font_size: 8, single_line: true }
    end

    def get_coords(printable)
      [printable.fetch(:x, 100), printable.fetch(:y, 100)]
    end

    def print(printable)
      @document.formatted_text_box(
        [{ text: printable[:text], color: color(printable) }],
        at: get_coords(printable), **additional_options(printable)
      )
    end

    def print_printables(printables)
      printables.each(&method(:print))
    end
  end
end
