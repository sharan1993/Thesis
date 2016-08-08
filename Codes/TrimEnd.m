function out=TrimEnd(Split)
%trims data set of data for EEG signals beyond time duration (zero
%flatlining data)
out=Split;
for i=1:length(Split.MontageSigIndex)
    for j=length(Split.Sigdata{i}):-1:1
        if sum(Split.Sigdata{i}{1,j})==0
            out.Sigdata{i}(:,j)=[];
        else
            break;
        end
    end
end


