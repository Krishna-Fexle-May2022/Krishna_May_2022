public class Pattern {
    public static void leftTriangle() {
		for(integer i=1;i<=5;i++)
    	{
        	string s='  ';
        	for(integer j=1;j<=5;j++)
        	{
            	if(j>=6-i )
            	{
                	s = s + 'x';
            	}
            	else
            	{
                 	s = s + '_';
            	}
        	}
        	system.debug(s);
        
    	}

		for(integer i=4;i>=1;i--)
    	{
        	string s='  ';
        	for(integer j=1;j<=5;j++)
        	{
            	if(j>=6-i )
            	{
                	s = s + 'x';
            	}
            	else
            	{
                 	s = s + '_';
            	}
        	}
        system.debug(s);
        
    	}
    }
    public static void downTriangleStar(){
		integer a=1;
        for(integer i=5;i>0;i--){
            string s='';
			for (integer k = 1; k <= (2*5 -a) ;k++)   
			{  
        		if( k==a || i == 5 || k==(2*5-a)){
            		s = s + 'x';
        		}  
        		else{
            	s = s + '_';
        		}
    		}
    		system.debug(s);
    		a++;
		}	
   }
}