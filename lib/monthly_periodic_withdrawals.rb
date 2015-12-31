require "monthly_periodic_withdrawals/version"
require "float"

module MonthlyPeriodicWithdrawals
	 
		def self.critical_withdrawal(rate, principal)
			(rate*principal).floor2(2)
		end

		def self.check_critical?(rate, withdrawal, principal)
			check = self.critical_withdrawal(rate, principal)
			if check > withdrawal
				false
			elsif check == withdrawal
				false
			else
				true
			end
		end

		def self.time_to_deplete(rate, withdrawal, principal)


			if self.check_critical?(rate, withdrawal, principal)
				numerator = (-withdrawal/rate)/(principal-withdrawal/rate)
				numerator = Math.log10(numerator)
				denominator = Math.log10(1+rate)
				result = (numerator/denominator).ceil2
			else
				"This monthly withdrawal will not deplete the principal"
			end
		end


	class Float
	  def floor2(exp = 0)
	   multiplier = 10 ** exp
	   ((self * multiplier).floor).to_f/multiplier.to_f
	  end

	  def ceil2(exp = 0)
	   multiplier = 10 ** exp
	   ((self * multiplier).ceil).to_f/multiplier.to_f
	  end
	end
end
