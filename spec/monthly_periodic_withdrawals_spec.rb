require 'rspec'
require 'spec_helper'

describe "periodic payment test" do
	it 'should have a critical rate' do
		p = MonthlyPeriodicWithdrawals.critical_withdrawal(0.008333, 25000)
		p.should == 208.32
	end
end

describe "time to deplete an Interest bearing account with periodic withdrawals" do
	context "this withdrawal is not above the critical rate so the time period is infinity" do

		it 'should return false if the withdrawal is less than the critical withdrawal' do
			p = 200
			r = 0.008333
			pr = 25000
			q = MonthlyPeriodicWithdrawals.check_critical?(r, p, pr)
			q.should == false
		end
		it 'should return false if the withrawal equals the critical withdrawal' do
			p = 208.32
			r = 0.008333
			pr = 25000
			q = MonthlyPeriodicWithdrawals.check_critical?(r, p, pr)
			q.should == false
		end
	end

	context "this withdrawal is above the critical withdrawal" do
		it "should return true if the withdrawal is just above the critical withdrawal" do
			p = 208.33
			r = 0.008333
			pr = 25000
			q = MonthlyPeriodicWithdrawals.check_critical?(r, p, pr)
			q.should == true
		end

		it "should calculate the the time to deplete principal if the withdrawal is above the critical withdrawal" do

			p = 200
			r = 0.008333
			pr = 10000
			q = MonthlyPeriodicWithdrawals.check_critical?(r, p, pr)
			q.should == true

			x = MonthlyPeriodicWithdrawals.time_to_deplete(r,p,pr)

			x.should == 65

		end	



	end

	context "on reciept of a request the program should check the critical then return the correct result" do
		it "should assess that this withdrawal will not deplete the princiapl and return message" do
			p = 200
			r = 0.008333
			pr = 25000

			q = MonthlyPeriodicWithdrawals.time_to_deplete(r,p,pr)
			q.should == "This monthly withdrawal will not deplete the principal"

		end

		it "should assess that this withdrawal will  deplete the principal and return a value" do
			p = 200
			r = 0.008333
			pr = 10000

			q = MonthlyPeriodicWithdrawals.time_to_deplete(r,p,pr)
			q.should == 65

		end
	end
end