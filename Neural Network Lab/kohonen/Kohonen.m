load in.txt
x = in;

node = size(x,2);
output = 50;

Wij = [];
class = [];
for data = 1:size(x,1)
    wij = rand(node,output);
    nj = 3;
    gain = 0.5;
    while(true)
        dj = [];
        for j = 1:output
            dj(j) = 0;
            for i = 1:node
                dj(j) = dj(j) + (x(data,i) - wij(i,j)).^2;
            end
        end
        
        [dj id] = sort(dj,'ascend');
        for i = 1:node
            for j = 1:output
                if(dj(j) - dj(1) > nj)
                    break;
                end
                wij(i,id(j)) = wij(i,id(j)) + gain*(x(data,i)-wij(i,id(j)));
            end
        end
        
        if dj(1) < 0.00000000000000001
            class(data) = id(1);
            break;
        end
    end
    Wij(data,:,:) = wij;
end

%% Testing input pattern

res = [];
for data = 1:size(x,1)
    for t = 1:20
        dj = [];
        for j = 1:output
            dj(j) = 0;
            for i = 1:node
                dj(j) = dj(j) + (x(data,i) - Wij(t,i,j)).^2;
            end
        end
        
        [dj id] = sort(dj,'ascend');
        res(t) = dj(1);
    end
    [res id] = sort(res,'ascend');
    fprintf("Near to pattern " + id(1) + " with output class " + class(id(1)) + "\n");
end



