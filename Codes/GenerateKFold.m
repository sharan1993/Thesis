%generate set
% clear;
% load 'sorted H aep first nonaep second.mat';
% Generates k fold on Classification H

load('\..\Data Files\Classification H.mat');

len=length(sortedH(:,1));
index=randperm(len);
temp=sortedH(index,:);
sortedH=temp;

%Generates folds - change kcross9 to kcross4-kcross9 for different number
%of folds
[s1,s2,s3,s4,s5,s6,s7,s8,s9]=kcross9(sortedH);

%Training and test set
train1=vertcat(s2,s3,s4,s5,s6,s7,s8,s9);test1=s1;
train2=vertcat(s1,s3,s4,s5,s6,s7,s8,s9);test2=s2;
train3=vertcat(s2,s1,s4,s5,s6,s7,s8,s9);test3=s3;
train4=vertcat(s2,s3,s4,s5,s6,s7,s8,s9);test4=s4;
train5=vertcat(s2,s3,s4,s1,s6,s7,s8,s9);test5=s5;
train6=vertcat(s2,s3,s4,s5,s1,s7,s8,s9);test6=s6;
train7=vertcat(s2,s3,s4,s5,s6,s1,s8,s9);test7=s7;
train8=vertcat(s2,s3,s4,s5,s6,s7,s1,s9);test8=s8;
train9=vertcat(s2,s3,s4,s5,s6,s7,s8,s1);test9=s9;

%PCA
[M1,~,u1,~,trainset1,testset1]=PrincCompAna(train1(:,1:13),test1(:,1:13),0);
[M2,~,u2,~,trainset2,testset2]=PrincCompAna(train2(:,1:13),test2(:,1:13),0);
[M3,~,u3,~,trainset3,testset3]=PrincCompAna(train3(:,1:13),test3(:,1:13),0);
[M4,~,u4,~,trainset4,testset4]=PrincCompAna(train4(:,1:13),test4(:,1:13),0);
[M5,~,u5,~,trainset5,testset5]=PrincCompAna(train5(:,1:13),test5(:,1:13),0);
[M6,~,u6,~,trainset6,testset6]=PrincCompAna(train6(:,1:13),test6(:,1:13),0);
[M7,~,u7,~,trainset7,testset7]=PrincCompAna(train7(:,1:13),test7(:,1:13),0);
[M8,~,u8,~,trainset8,testset8]=PrincCompAna(train8(:,1:13),test8(:,1:13),0);
[M9,~,u9,~,trainset9,testset9]=PrincCompAna(train9(:,1:13),test9(:,1:13),0);


trainset1(:,end+1)=train1(:,end);testset1(:,end+1)=test1(:,end);
trainset2(:,end+1)=train2(:,end);testset2(:,end+1)=test2(:,end);
trainset3(:,end+1)=train3(:,end);testset3(:,end+1)=test3(:,end);
trainset4(:,end+1)=train4(:,end);testset4(:,end+1)=test4(:,end);
trainset5(:,end+1)=train5(:,end);testset5(:,end+1)=test5(:,end);
trainset6(:,end+1)=train6(:,end);testset6(:,end+1)=test6(:,end);
trainset7(:,end+1)=train7(:,end);testset7(:,end+1)=test7(:,end);
trainset8(:,end+1)=train8(:,end);testset8(:,end+1)=test8(:,end);
trainset9(:,end+1)=train9(:,end);testset9(:,end+1)=test9(:,end);

