mu = [6 -12];
Sigma = [22 -47.5; -47.5 110.5];
x1 = -20:.5:40; x2 = -40:.5:20;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-20 40 -40 20 0 .02])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');