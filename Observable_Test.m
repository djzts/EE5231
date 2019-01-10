function [RankA,ObM]=Observable_Test(A,C)
ObM = obsv(A,C);
RankA=min(size(A));
if(rank(ObM)==RankA)
    disp(['the Observe matrix has a rank of ',num2str(rank(ObM))]);
    disp(['the System has a rank of ',num2str(RankA)]);
    disp('Therefore, it is Observable');
else
    disp(['the Observe matrix has a rank of ',num2str(rank(ObM))]);
    disp(['the System matrix has a rank of ', num2str(RankA)]);
    disp('Therefore, it is not Observable')
end