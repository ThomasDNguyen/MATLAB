% Nguyen Duy Thanh - e1601122 %

%{
Compute

(A) 2+3*4-5/6 = 13.166666666666666 and 2+3*(4-5)/6 = 3/2 = 1.5

(B) the natural logarithm of 3 = 1.098612288668110

(C) the 10-based logarithm of 3 = 0.477121254719662.

(D) Why does 'log1p(1.718281828)' produce the result quite close to one? (help)

(E) Explain the difference (and connection) between the results of [a,b]=log2(8);[a,b] --> [0.5000 4.0000] and log2(8)=3.

(F) What is the 4-decimal approximation to the number, whose 2nd power equals 3? (1.7321)

(G) Find the real and imaginary parts of the complex number 2*exp(i*pi/2). How about sqrt(2)*exp(i*pi/4)?
%}

A1=2+3.*4-(5/6)
A2=2+3.*((4-5)/6)

B=log(3)

C=log10(3)

% (D): because 'log1p(1.71828...)' = 'log(1+1.71828...' = ln(e) = 1


%{
  (E): Command 'log2(8)' returns the value 
  of the 2-based logarithm of the argument 8, 
  which equals 3.
  
  Command '[a,b]=log2(8)' instead returns 
  the mantissa a=0.5 and exponent b=4
  of the ARGUMENT 8 in base 2: 8 = 0.5 * 2^4 
%}
  
F=sqrt(3)

G1=2*exp(i*pi/2)
G1_REAL=real(G1)%NOTE! numerical noise  %<-- what does that mean ? 
G1_IMG=imag(G1)

G2=sqrt(2)*exp(i*pi/4)
G2_REAL=real(G2)
G2_IMG=imag(G2)
