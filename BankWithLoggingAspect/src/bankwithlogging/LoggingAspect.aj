package bankwithlogging;

public aspect LoggingAspect {
	
	pointcut logCreation() :
		initialization (Customer.new(..)) || initialization (Account.new(..));
	
	
	after() : logCreation()
	{
		Logger.log("Created object " + thisJoinPoint.getTarget().toString());
	}
	
	
	pointcut logDeposit(int amount):
		call(void Account.deposit(int)) && args(amount);
	
	before(int amount): logDeposit(amount)
	{
		String stringToLog = "deposit called on object " + thisJoinPoint.getTarget().toString() + " with parameter " + amount;
        Logger.log(stringToLog);
	}
			
	
	pointcut logWithdraw(int amount):
		call(void Account.withdraw(int)) && args(amount);
	
	before(int amount): logWithdraw(amount)
	{
        String stringToLog = "withdraw called on object " + thisJoinPoint.getTarget().toString() + " with parameter " + amount;
        Logger.log(stringToLog);
	}
	
}

