require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hoummos ------- £4.50" }

  it "shows the menu of dishes and their prices" do
    expect(takeaway.print_menu).to eq(printed_menu) 
  end
end
