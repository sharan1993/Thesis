%class_count - outputs no of annotations in given class
%index - outputs a list of indexes (of the annotations), if more than one
%class is being considered, zero is used as a divider in the list
%class - argument to specify what class is being considered
%no_of_agreed - argument to consider how many agreed
%function outputs index for each class if class argument is empty

function [class_count, index] = count_class(overall_db, class, no_of_agreed)
class_count=0;k=1;index(k)=0;
if isempty(class)
    class=[201 202 203 204 205];
end
for j=1:length(class) 
for i=1:length(overall_db.Event_ID)
    if overall_db.inferred_groundtruth(i,1) == class(j) && overall_db.inferred_groundtruth(i,2)>no_of_agreed
        class_count=class_count+1;
        index(k)=i;
        k=k+1;
    end
end
if length(class)>1
    index(k)=0;k=k+1;
end
end