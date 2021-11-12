clc;
L=input('Length of transmission line in km');
r=input('Resistance per km in ohm');
l=input('Inductance per km in H');
L1=L*(l);
R=r*(L);
Z=complex(R,2*pi*50*L1);
if L<=80
    A=1;
    B=Z;
    C=0;
    D=A;
    fprintf('\nA=%d',A);
    fprintf('\nB=%d',B);
    fprintf('\nC=%d',C);
    fprintf('\nD=%d',D);
elseif L>80 && L<=180
    c=input('Capacitance per km in microF');
    c=c*(10^(-6));
    Y=2*pi*50*c*L*1i;
    A=(Y/2)*(Z+1);
    B=Z*((Y/4)*(Z+1));
    C=Y;
    D=A;
    fprintf('\nc=%d',c);
    fprintf('\nA=%d',A);
    fprintf('\nB=%d',B);
    fprintf('\nC=%d',C);
    fprintf('\nD=%d',D);
else
    c=input('Capacitance per km in microF');
    c=c*10^(-6);
    Y=2*pi*50*1i*c*L;
    K=sqrt(Y*Z);
    M=sqrt(Y/Z);
    A=cosh(K);
    B=sinh(K)/M;
    C=M*(sinh(K));
    D=A;
    fprintf('\nA=%d',A);
    fprintf('\nB=%d',B);
    fprintf('\nC=%d',C);
    fprintf('\nD=%d',D);
    
    