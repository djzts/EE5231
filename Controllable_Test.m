function [RankA,CoM]=Controllable_Test(A,B)
CoM = ctrb(A,B);
RankA=min(size(A));
if(rank(CoM)==RankA)
    disp(['the Control matrix has a rank of ',num2str(rank(CoM))]);
    disp(['the System has a rank of ',num2str(RankA)]);
    disp('Therefore, it is Controlable');
else
    disp(['the Control matrix has a rank of ',num2str(rank(CoM))]);
    disp(['the System matrix has a rank of ', num2str(RankA)]);
    disp('Therefore, it is not Controlable')
end