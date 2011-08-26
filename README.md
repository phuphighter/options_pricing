# OptionsPricing

Module for financial options pricing models in Ruby.  Right now, only supports [Black Scholes](http://en.wikipedia.org/wiki/Black%E2%80%93Scholes).  I plan to add more models in the future.

## Installation

Just require it and include the module:    
    require 'options_pricing'    
    include OptionsPricing

Or in your Rails app as a plugin:

    script/plugin install git://github.com/phuphighter/options_pricing.git
    
## Usage
    
#### Examples

    put or call = 'c', stock price = 75.15, strike = 80, years to maturity = 0.15, risk free rate = 0.15, volatility = 0.6

Returns an object:    

    >> option = black_scholes('c', 75.15, 80, 0.15, 0.25, 0.6)    
    => <#Hashie::Mash call_put="c" d1=0.00843226590435667 d2=-0.223946734868088 risk_free_rate=0.25 stock_price=75.15 strike=80 value=6.12719273880037 volatility=0.6 years_to_maturity=0.15>

    >> option.value
    => 6.12719273880037
    
## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2009 Johnny Khai Nguyen, released under the MIT license
