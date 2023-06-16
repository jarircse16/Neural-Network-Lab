%clc
%classA=[ 0 0 0; 0 1 0;0 1 1;1 0 0; 1 0 1;1 1 0];
%d=[0;0;0;1;1;1];
load input.txt;
load output.txt;
load delta.txt;
inTrain = input;
outTrain = output;
del =delta;
inTrain

n=0.1;
w=[.25 .4 .33];

y=inTrain*w';
y=y>.35;
d=outTrain-y;


while 1
    if isequal(d,del)
        break;
    end
    
       w=w+(n*(d'*inTrain));
       y=inTrain*w';
       y=y>.35;
       d=outTrain-y;
end
w
test=[0 1 1; 1 1 0];
ans=test*w';
ans=ans>.35;
ans
