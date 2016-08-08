function [clusters,cluster_freq,index,centroids,dist]=clustering(Hndtrim,no_of_clusters)
%Generates clusters, no of member per cluster, centroids and distance of
%members from centroid
%Specify no of clustes as required
clusters=[];cluster_freq=[];

%uses k means clustering
[index,centroids,~,dist]=kmeans(Hndtrim(:,1:end-1),no_of_clusters);

for i=1:no_of_clusters
    sum_ind(i)=sum(index==i);
end

clusters{no_of_clusters}=[];
for i=1:length(Hndtrim(:,1))
    clusters{index(i)}=vertcat(clusters{index(i)},Hndtrim(i,:));
end

dist=[];
for i=1:no_of_clusters
    [~,~,~,dist{i}]=kmeans(clusters{1}(:,1:end-1),1);
end

cluster_freq=sum_ind;