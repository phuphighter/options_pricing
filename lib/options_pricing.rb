# OptionsPricing
require 'rubygems'
require 'hashie'

module OptionsPricing
  
  # Black Scholes    
  # by Michael Neumann, Germany
  # Cumulative normal distribution
  
  def cnd(x)
    a1, a2, a3, a4, a5 = 0.31938153, -0.356563782, 1.781477937, -1.821255978, 1.330274429
    
    l = x.abs
    k = 1.0 / (1.0 + 0.2316419 * l)
    w = 1.0 - 1.0 / Math.sqrt(2*Math::PI)*Math.exp(-l*l/2.0) * (a1*k + a2*k*k + a3*(k**3) + a4*(k**4) + a5*(k**5))
    w = 1.0 - w if x < 0
    
    return w
  end
  
  # call_put = 'p' or 'c'
  # s = stock price
  # x = strike price
  # t = years to maturity
  # r = risk-free rate
  # v = volatility

  def black_scholes(call_put, s, x, t, r, v)
    d1 = (Math.log(s/x)+(r+v*v/2.0)*t)/(v*Math.sqrt(t))
    d2 = d1-v*Math.sqrt(t)
    
    if call_put == 'c'
      value = s*cnd(d1)-x*Math.exp(-r*t)*cnd(d2)
    else
      value = x*Math.exp(-r*t)*cnd(-d2)-s*cnd(-d1)
    end
    
    Hashie::Mash.new(:d1 => d1, :d2 => d2, :call_put => call_put, :stock_price => s,
                     :strike => x, :years_to_maturity => t, :risk_free_rate => r,
                     :volatility => v, :value => value)
  end
       
end

