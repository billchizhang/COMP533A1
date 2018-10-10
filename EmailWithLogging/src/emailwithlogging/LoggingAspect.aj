package emailwithlogging;

import org.aspectj.lang.JoinPoint;

public abstract aspect LoggingAspect 
{ 
	
	public abstract pointcut pointsToBeLoggedBefore( );
	public abstract pointcut pointsToBeLoggedAfter( );
	   

	
	
	   before( ) : pointsToBeLoggedBefore()
	   {
	      logBefore(thisJoinPoint);
	   }
	   
	   after( ) : pointsToBeLoggedAfter()
	   {
	      logAfter(thisJoinPoint);
	   }
	   
	   public abstract void logBefore(JoinPoint joinPoint);
	   
	   public abstract void logAfter(JoinPoint joinPoint);
	
}
