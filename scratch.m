x1 = [0 2];
x2 = [0 0];
x3 = [1.5 0];
x4 = [5 0];
x5 = [5 2];
mu1 = [1.66 .667];
mu2 = [3.25 1];
sig1 = [8.3333 0;0 1.3333];
sig2 = [6.125 0;0 2];

p11 = mvnpdf(x1, mu1, sig1);
p12 = mvnpdf(x2, mu1, sig1);
p13 = mvnpdf(x3, mu1, sig1);
p14 = mvnpdf(x4, mu1, sig1);
p15 = mvnpdf(x5, mu1, sig1);
p21 = mvnpdf(x1, mu2, sig2);
p22 = mvnpdf(x2, mu2, sig2);
p23 = mvnpdf(x3, mu2, sig2);
p24 = mvnpdf(x4, mu2, sig2);
p25 = mvnpdf(x5, mu2, sig2);

pc1 = .5; pc2 = .5;
w11 = p11*pc1/((p11*pc1)+(p21*pc2)); w21 = 1-w11;
w12 = p12*pc1/((p12*pc1)+(p22*pc2)); w22 = 1-w12;
w13 = p13*pc1/((p13*pc1)+(p23*pc2)); w23 = 1-w13;
w14 = p14*pc1/((p14*pc1)+(p24*pc2)); w24 = 1-w14;
w15 = p15*pc1/((p15*pc1)+(p25*pc2)); w25 = 1-w15;

mu1again = (w11*x1+w12*x2+w13*x3+w14*x4+w15*x5)/(w11+w12+w13+w14+w15);
mu2again = (w21*x1+w22*x2+w23*x3+w24*x4+w25*x5)/(w21+w22+w23+w24+w25);
sigm1again = w11*(x1-mu1again)'*(x1-mu1again)+w12*(x2-mu1again)'*(x2-mu1again)+w13*(x3-mu1again)'*(x3-mu1again)+w14*(x4-mu1again)'*(x4-mu1again)+w15*(x5-mu1again)'*(x5-mu1again);
sigm1again = sigm1again/(w11+w12+w13+w14+w15);
sigm2again = w21*(x1-mu2again)'*(x1-mu2again)+w22*(x2-mu2again)'*(x2-mu2again)+w23*(x3-mu2again)'*(x3-mu2again)+w24*(x4-mu2again)'*(x4-mu2again)+w25*(x5-mu2again)'*(x5-mu2again);
sigm2again = sigm2again/(w21+w22+w23+w24+w25);
pc2again = (w21+w22+w23+w24+w25)/5;
pc1again = (w11+w12+w13+w14+w15)/5;
