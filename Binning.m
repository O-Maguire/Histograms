%Version 1.1
%Fixed issue with only allowing 10 bins
function [Values,Edges]=Binning(data,Number_of_bins,Xlabel,Ylabel,DecimalPlaces)
format shortg

Mindata=min(data);
Maxdata=max(data);
if nargin==1
    Number_of_bins=10;
    DecimalPlaces=2;
end
Bins=Mindata:(Maxdata-Mindata)./Number_of_bins:Maxdata;

tmp=discretize(data,Bins);
for ii=1:Number_of_bins
    lols(ii)=sum(tmp(:)==ii);
end

[x]=histogram(data,Number_of_bins)%,'BinEdges',Bins)
strings={};
for ii=1:Number_of_bins
    strings{end+1}=sprintf("%s to %s",num2str(round(x.BinEdges(ii),DecimalPlaces)),num2str(round(x.BinEdges(ii+1),DecimalPlaces)));
end

dif=(x.BinEdges(2)-x.BinEdges(1))./2;
set(gca,'XTick',[x.BinEdges(1)+dif:x.BinEdges(2)-x.BinEdges(1):x.BinEdges(Number_of_bins+1)+dif],'XTickLabel',(strings))
xtickangle(30)
if nargin<=2
    xlabel('Bin edge positions')
    ylabel('Counts')
else
    xlabel(sprintf('%s',Xlabel))
    ylabel(sprintf('%s',Ylabel))
end
xlim([x.BinEdges(1)-dif./3 x.BinEdges(Number_of_bins+1)+dif./3])
Values(:,1)=x.Values(:);
Edges(:,1)=x.BinEdges(:);
end
