require 'test_helper'

class OptionsPricingTest < Test::Unit::TestCase
  include OptionsPricing

  context "While using options_pricing" do
    
    should "find the options values using black scholes" do
      option = black_scholes('c', 75.15, 80, 0.15, 0.25, 0.6)
      option.value.to_s.should == '6.12719273880037'
      option.d1.to_s.should == '0.00843226590435667'
      option.d2.to_s.should == '-0.223946734868088'
    end
    
  end
  
end
