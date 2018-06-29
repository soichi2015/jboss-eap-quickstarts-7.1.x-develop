package sample;

public class Calc {
	//----------------------------------//
	//	浮動小数点値の三角関数の計測	//
	//----------------------------------//
	static long calcCos(){
		long stTim,endTim;
		int i,j;
		@SuppressWarnings("unused")
		double a;

		stTim=System.currentTimeMillis();

		a=0.0;
		for(i=0;i<4000;i++){
			for(j=1;j<10001;j++){	/* 0除算が発生しないようにjは1から */
				a+=Math.cos(j);
			}
			a=0.0;
		}
		
		endTim=System.currentTimeMillis();
		endTim-=stTim;
		
		return endTim;
	}
    
	static double average(long[] score)
    {              
        double sum = 0.0;
        for(long i:score)
        {
            sum += i;
        }
        return score.length != 0 ? sum / score.length : sum ;
    }
}
