     area     appcode, CODE, READONLY
     export __main
	 ENTRY 
__main  function		 
       VLDR.F32   s1, = 0.5  ;X value
	   ;VLDR.F32   s1, = 0.7
	   VLDR.F32   s2, = 1
       VLDR.F32   s4, = 1
	   VLDR.F32   s5, = 1
       
loop 
;subtraction of terms
 VADD.F32 S5,S4         ;incrementing the value that ia used as denominator
 VLDR.F32   s6, = 0.5   ;X VALUE
 ;VLDR.F32   s6, = 0.7
 VDIV.F32 S6,S5         ; x/(incremented value) 
 VLDR.F32   s7, = 0.5   ;X VALUE
 ;VLDR.F32   s7, = 0.7
 VMUL.F32 S2,S7         ; (s2*x) 
 VFMS.F32 S1,S2,S6      ;s1=s1+((-(s2*x))*(x/incremented value))

;addition of terms
 
 VMUL.F32 S2,S7
 VADD.F32 S5,S4          ;S5 gives the number of terms in series
 VLDR.F32   s6, = 0.5    ; x value
 ;VLDR.F32   s6, = 0.7
 VDIV.F32 S6,S5
 VFMA.F32 S1,S2,S6       ;s1=s1+(((s2*x))*(x/s6))   working of algorithm
 
 ;ln of 1+x value is stored in S1


 ; here in this example log(1.5) is caluculated as 0.405465 by calculating 16 terms in the series
 ; the value dont change much after 16 terms
 ; if we change the x value then we can get value of other numbers
 ; if we change the value to 0.7 to get the value of ln(1.7)=0.530628. by calculating 30 terms in the series
 ; the value dont change much after 30 terms
 ; uncomment the x value of 0.7 to get the value of ln(0.7) 
            
            b loop	  
	   
     endfunc
     end




