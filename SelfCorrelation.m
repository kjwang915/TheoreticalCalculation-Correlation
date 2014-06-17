%Self Correlation (identical page)
%Uniform distribution of random variables

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

            randomF = (xFmax - xFmin) * rand + xFmin;
            randomL = (xLmax - xLmin) * rand + xLmin;
            randomM = (xMmax - xMmin) * rand + xMmin;
            randomO = (xOmax - xOmin) * rand + xOmin;
            randomA = (xAmax - xAmin) * rand + xAmin;

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
    selfCorr(k,2) = corr(ppn1,ppn2);
    
    
end

%plot correlation
plot(selfCorr(:,1),selfCorr(:,2))
ylim([0.99 1.01])
xlabel('Index')
ylabel('Correlation')
title('Self Correlation')


