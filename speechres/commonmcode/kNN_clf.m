% kNN_clf: k-nearest neighbor classifier

function yPred = kNN_clf(k, XTrain, yTrain, XTest)
NTest = size(XTest, 1);

yPred = nan(NTest, 1);
for i1 = 1 : NTest 
    t_xTest = XTest(i1, :);
    N = size(XTrain, 1);
    dists = nan(N, 1);
    for j1 = 1 : N
        dists(j1) = sum((t_xTest - XTrain(j1, :)) .^ 2);        
    end
    [foo, idxsrt] = sort(dists, 'ascend');
    
    ys = yTrain(idxsrt(1 : k));
    yPred(i1) = mode(ys);
end

return
