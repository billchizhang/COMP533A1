package emailwithlogging;

import org.aspectj.lang.JoinPoint;


public aspect EmailSpecificComposition extends LoggingAspect {

	 
	public pointcut pointsToBeLoggedAfter():  initialization(Email.new(..));
	public pointcut pointsToBeLoggedBefore():  call(* Email.*(..));
		
	
	public void logBefore(JoinPoint joinPoint) {
		String method = joinPoint.getSignature().getName();

		method = method + " updated on Email Address " + joinPoint.getTarget().toString() + " with parameter ";
			
		Object[] paramValues = joinPoint.getArgs();
	
		for (Object object:paramValues) {
			method = method + object.toString();
		}

		Logger.log(method);
		
	}


	public void logAfter(JoinPoint joinPoint) {
		Logger.log("Created Email Address " + joinPoint.getTarget().toString());
		
	}

}
