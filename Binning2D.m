%Function made by Oisin Maguire to make a histogram with the bin edges as
%the x ticks so you know whats actually going on!!!
function Binning2D(data,Number_of_bins,Xlabel,Ylabel,DecimalPlaces)
format shortg

if ndims(data)>=2
    [n,m]=size(data);
    tmpdata(:)=data(:,m);%takes last LCPQ data point
    data=tmpdata;
end

Mindata=min(data);
Maxdata=max(data);
if nargin==1
    Number_of_bins=10;
end
Bins=Mindata:(Maxdata-Mindata)./Number_of_bins:Maxdata;

tmp=discretize(data,Bins);
for ii=1:Number_of_bins
    lols(ii)=sum(tmp(:)==ii);
end

[x]=histogram(data,Number_of_bins)%,'BinEdges',Bins)
%use eval to form an array that gets printed in the 'XTickLabel' string 
string1=sprintf("%s to %s",num2str(round(x.BinEdges(1),DecimalPlaces)),num2str(round(x.BinEdges(2),DecimalPlaces)));
string2=sprintf("%s to %s",num2str(round(x.BinEdges(2),DecimalPlaces)),num2str(round(x.BinEdges(3),DecimalPlaces)));
string3=sprintf("%s to %s",num2str(round(x.BinEdges(3),DecimalPlaces)),num2str(round(x.BinEdges(4),DecimalPlaces)));
string4=sprintf("%s to %s",num2str(round(x.BinEdges(4),DecimalPlaces)),num2str(round(x.BinEdges(5),DecimalPlaces)));
string5=sprintf("%s to %s",num2str(round(x.BinEdges(5),DecimalPlaces)),num2str(round(x.BinEdges(6),DecimalPlaces)));
string6=sprintf("%s to %s",num2str(round(x.BinEdges(6),DecimalPlaces)),num2str(round(x.BinEdges(7),DecimalPlaces)));
string7=sprintf("%s to %s",num2str(round(x.BinEdges(7),DecimalPlaces)),num2str(round(x.BinEdges(8),DecimalPlaces)));
string8=sprintf("%s to %s",num2str(round(x.BinEdges(8),DecimalPlaces)),num2str(round(x.BinEdges(9),DecimalPlaces)));
string9=sprintf("%s to %s",num2str(round(x.BinEdges(9),DecimalPlaces)),num2str(round(x.BinEdges(10),DecimalPlaces)));
string10=sprintf("%s to %s",num2str(round(x.BinEdges(10),DecimalPlaces)),num2str(round(x.BinEdges(11),DecimalPlaces)));
if nargin<=5
    shift=((Maxdata-Mindata)./Number_of_bins)./2;
end

dif=(x.BinEdges(2)-x.BinEdges(1))./2;
set(gca,'XTick',[x.BinEdges(1)+dif:x.BinEdges(2)-x.BinEdges(1):x.BinEdges(11)+dif],'XTickLabel',{string1;string2;string3;string4;string5;string6;string7;string8;string9;string10;})
xtickangle(30)
if nargin<=2
    xlabel('Bin edge positions')
    ylabel('Counts')
else
    xlabel(sprintf('%s',Xlabel))
    ylabel(sprintf('%s',Ylabel))
end
xlim([x.BinEdges(1)-dif./3 x.BinEdges(11)+dif./3])
end
