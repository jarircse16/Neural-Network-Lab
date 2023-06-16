load input.txt;
load output.txt;
inTrain = input;
outTrain = output;

[tmp inputNode] = size(inTrain);
hiddenNode = 2;
outputNode = 1;
Wij = rand(inputNode,hiddenNode);
Wjk = rand(hiddenNode,outputNode);
Uhj = rand(1,hiddenNode);
Uok = rand(1,outputNode);

tmpj = hiddenNode; %hidden node
[tmp tmpi] = size(inTrain);
[tmp tmpk] = size(Wjk);

k1 = 0.5;
k2 = 0.5;

gain = 0.5;

Oaj = [];
Oak = [];

[l m] = size(inTrain); 

data = 1;
while(data <= l)
    Oai = inTrain(data,:);
    
    netaj = Oai * Wij;
    activj = netaj + Uhj;
    for j = 1: tmpj
        Oaj(j) = 1/(1+exp(-k1*activj(j)));
    end
    
    netak = Oaj * Wjk;
    activk = netak + Uok;
    for k = 1:tmpk
        Oak(k) = 1/(1+exp(-k2*activk(k)));
    end
    
    delak = outTrain(data,:) - Oak;
    
    
    delWjk = [];
    for j = 1:tmpj
        for k = 1:tmpk
            delWjk(j,k) = gain * k2 * Oaj(j) * Oak(k) * (1 - Oak(k));
            Wjk(j,k) = Wjk(j,k) + delWjk(j,k);          
        end
    end
    
    for k = 1:tmpk
        delUok(k) = gain * k2 * delak(k) * Oak(k) * (1 - Oak(k));
        Uok(k)  = Uok(k) + delUok(k);
    end
    
    
    delWij = [];
    for i = 1:tmpi
        for j = 1:tmpj
            add = 0;
            for k = 1: tmpk
                add  = add + delak(k)* Wjk(j,k);
            end
            delWij(i,j) = gain * k1 * Oai(i) * Oaj(j) * (1 - Oaj(j))* add;
            Wij(i,j) = Wij(i,j) + delWij(i,j);
            
        end
    end
    
    for j = 1:tmpj
        add = 0;
        for k = 1: tmpk
            add  = add + delak(k)* Wjk(j,k);
        end
        delUhj(j) = gain * k1 * Oaj(j) * (1 - Oaj(j))* add;
        Uhj(j)  = Uhj(j) + delUhj(j);
    end
    
    tmp = (outTrain(data,:) - Oak);
    tmp = tmp * tmp';
    error = 0.5 * tmp;
    
    if( le(error, 0.001))
        data = data + 1;
    else
        data = 1;
    end
%     fprintf(data + "\n");
end

%% testing data
inTest = [0 1 0; 1 1 0];
outTest = [0 1];

% inTest = inTrain;
% outTest = outTrain;

[l m] = size(inTest); 
for i = 1:l
    Oai = inTest(i,:);
    
    netaj = Oai * Wij;
    activj = netaj + Uhj;
    for j = 1: tmpj
        Oaj(j) = 1/(1+exp(-k1*activj(j)));
    end
    
    netak = Oaj * Wjk;
    activk = netak + Uok;
    for k = 1:tmpk
        Oak(k) = 1/(1+exp(-k2*activk(k)));
    end
    
    fprintf(Oak+"\n");
%    fprintf(Oak(1)+" "+ Oak(2)+"\n");
end