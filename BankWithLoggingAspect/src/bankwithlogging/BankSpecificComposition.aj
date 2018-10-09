package bankwithlogging;


import org.aspectj.lang.JoinPoint;

public aspect BankSpecificComposition extends LoggingAspect
{
	
	   public pointcut pointsToBeLoggedAfter() : initialization(Customer.new(..)) || 
	   											initialization(Account.new(..));
	   
	   public pointcut pointsToBeLoggedBefore() : call(* Account.*(..)); 

	   public void logBefore(JoinPoint joinPoint)
	   {
		   String method = joinPoint.getSignature().getName();

		   method = method + " called on object " + joinPoint.getTarget().toString() + " with parameter ";
			
		   Object[] paramValues = joinPoint.getArgs();
	
		   for (Object object:paramValues)
		   {
			   method = method + object.toString();
		   }

		   Logger.log(method);
		   
	   }
	   
	   public void logAfter(JoinPoint joinPoint)
	   {
		   Logger.log("Created object " + joinPoint.getTarget().toString());
	   }

}
