%seperate out bandwidth
%Requires wavelet decompostion outputs as input
function bandwidth=bands(input)

for i=1:length(input.C)
    bandwidth.Delta{i}=input.C{i}(1:input.L{i}(1));
    bandwidth.Theta{i}=input.C{i}(input.L{i}(1)+1:input.L{i}(1)+input.L{i}(2));
    bandwidth.Alpha{i}=input.C{i}(1+input.L{i}(1)+input.L{i}(2):input.L{i}(1)+input.L{i}(2)+input.L{i}(3));
    bandwidth.Beta{i}=input.C{i}(1+input.L{i}(1)+input.L{i}(2)+input.L{i}(3):input.L{i}(1)+input.L{i}(4)+input.L{i}(2)+input.L{i}(3));
    bandwidth.Gamma{i}=input.C{i}(end-input.L{i}(5)+1:end);
end