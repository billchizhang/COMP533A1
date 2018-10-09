package emailwithlogging;

import org.aspectj.lang.JoinPoint;



public abstract aspect LoggingAspect 
{ 
	
	public abstract pointcut pointsToBeLoggedBefore( );
	public abstract pointcut pointsToBeLoggedAfter( );
	   
	//public abstract pointcut pointsToBeExcluded( );
	
	   public pointcut filteredPointsToBeLoggedBefore(Object caller) : 
		   pointsToBeLoggedBefore( ) && 
		      //!pointsToBeExcluded( ) && 
		      !within(emailwithlogging.LoggingAspect+) && 
		      this(caller);
	   
	   public pointcut filteredPointsToBeLoggedAfter(Object caller) : 
		   pointsToBeLoggedAfter( ) && 
		      //!pointsToBeExcluded( ) && 
		      !within(emailwithlogging.LoggingAspect+) && 
		      this(caller);
	
	
	   before( Object caller) : filteredPointsToBeLoggedBefore(caller)
	   {
	      logBefore(thisJoinPoint);
	   }
	   
	   after( Object caller) : filteredPointsToBeLoggedAfter(caller)
	   {
	      logAfter(thisJoinPoint);
	   }
	   
	   public abstract void logBefore(JoinPoint joinPoint);
	   
	   public abstract void logAfter(JoinPoint joinPoint);
	
}
	

