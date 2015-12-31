# MonthlyPeriodicWithdrawals

This gem allows you to calculate then number of monthly withdrawals it would take to reduce the principal on an interest-bearing account.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monthly_periodic_withdrawals'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monthly_periodic_withdrawals

## Usage

To calculate the number of months to deplete the principal on an interest-bearing account use the following:

rate  =  0.008333 - Monthly rate of interest on the principal annual is 10%
Monthly withdrawal = 200
Starting Principal = 1000

number_of_month_to_deplete_principal = MonthlyPeriodicWithdrawals(0.008333, 200, 1000)

number_of_month_to_deplete_principal = 65

If the withdrawal amount would not deplete the principal at all the following is returned:
rate  =  0.008333 - Monthly rate of interest on the principal annual is 10%
Monthly withdrawal = 200
Starting Principal = 25000

number_of_month_to_deplete_principal = MonthlyPeriodicWithdrawals(0.008333, 200, 25000)

number_of_month_to_deplete_principal = "This monthly withdrawal will not deplete the principal"

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/monthly_periodic_withdrawals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

