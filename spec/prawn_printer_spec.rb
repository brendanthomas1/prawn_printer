require "spec_helper"

RSpec.describe PrawnPrinter do
  it "has a version number" do
    expect(PrawnPrinter::VERSION).not_to be nil
  end

  it "makes a doc" do
    klass = PrawnPrinter::Printer.new
    expect(klass.document).to be_a Prawn::Document
  end
end
