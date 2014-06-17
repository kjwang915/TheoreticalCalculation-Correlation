%Self Correlation (identical page)
%Gaussian distribution of random variables

%given values
lambdaF = 0.1;
lambdaL = 0.3;
lambdaM = 1.0;
lambdaO = 0.3;
lambdaA = 0;

xF = -100:100;
xL = -100:100;
xM = 200:1000;
xO = 0:100;
xA = -100:0;

xFmin = -100;
xFmax = 100;
xLmin = -100;
xLmax = 100;
xMmin = 200;
xMmax = 1000;
xOmin = 0;
xOmax = 100;
xAmin = -100;
xAmax = 0;

%initialize fixed values
fixedF = 0;
fixedL = 0;
fixedM = 0;

%do 5 times
for k = 1:5
    %PPN vector (consisting of 4096 integers)
    for j = 1:4096
        %set fixed value
        for i = 1:2

            randomF = (((xFmax+xFmin)/2)+((xFmax - xFmin)/6)*randn);
            randomL = (((xLmax+xLmin)/2)+((xLmax - xLmin)/6)*randn);
            randomM = (((xMmax+xMmin)/2)+((xMmax - xMmin)/6)*randn);
            randomO = (((xOmax+xOmin)/2)+((xOmax - xOmin)/6)*randn);
            randomA = (((xAmax+xAmin)/2)+((xAmax - xAmin)/6)*randn);

            if i == 1
                fixedF = randomF;
                fixedL = randomL;
                fixedM = randomM;
                ppn1(j,:) = lambdaF*fixedF + lambdaL*fixedL + lambdaM*fixedM + lambdaO*randomO + lambdaA*randomA;
            else
                ppn2(j,:) = lambdaF*fixedF + lambdaL*fixedL + lambdaM*fixedM + lambdaO*randomO + lambdaA*randomA;
            end
        end
    end
    
    selfCorr(k,:) = k;
    selfCorr(k,2) = abs(corr(ppn1,ppn2));
    
end

%plot correlation
plot(selfCorr(:,1),selfCorr(:,2))
ylim([0.99 1.01])
xlabel('Index')
ylabel('Correlation')
title('Self Correlation Gaussian')
    
    
    %selfCorr = corr(ppn1,ppn2)


