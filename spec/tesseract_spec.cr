require "./spec_helper"

describe Tesseract do
  it "extracts basic text" do
    api = Tesseract::API.new
    api.image("./spec/fixtures/stop.png").should eq("STOP\n")
    api.finalize
  end
end
