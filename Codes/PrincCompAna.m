function [M,N,u,covx,reduced_train,reduced_test]=PrincCompAna(in_set,test_set,k)
%Performs Principal Componenet Analysis
%returns mean, covariance matrices and reduced dimensionality (Set value of
%k)
for i=1:length(in_set(1,:))
    mean_in(i)=mean(in_set(:,i));
end

zero_meaned_train=in_set-repmat(mean_in,length(in_set(:,1)),1);
zero_meaned_test=test_set-repmat(mean_in,length(test_set(:,1)),1);
covx=cov(zero_meaned_train);
u=mean_in;
[M,N]=eig(covx);

if k==0
    reduced_train=zero_meaned_train*M;reduced_test=zero_meaned_test*M;
else reduced_train=zero_meaned_train*M(:,7:9);reduced_test=zero_meaned_test*M(:,8:9);
end
