block = urlread('ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/south/daily/data/SH_seaice_extent_final_v2.csv');
C = textscan(block, '%d, %d, %d, %f, %*[^\n]', 'HeaderLines', 2, 'EndOfLine', '\n');
S = cell2struct(C, {'year','month','day','extent'}, 2);

daily2014 = S.extent(S.year == 2014);
figure
plot(daily2014);
title('Daily Ice Extent 2014');
ylabel('ice extent (milllion sq km)');
xlabel('day');
grid on
grid minor
saveas(gcf, 'fig/fig7.png');

maximum = max(daily2014);
minimum = min(daily2014);

mar2sept = daily2014(31 + 28 + 21: 5*31 + 28 + 2*30 + 19);
area_0 = mar2sept(1);
area = zeros(1, length(mar2sept));
for i = 1:length(mar2sept)
    area(i) = (mar2sept(i) - area_0)/area_0 * 100;
end

figure
plot(area);
title('Change in Ice Area (NSIDC)');
ylabel('percentage change');
xlabel('days from Mar 21, 2014');
grid on
grid minor
saveas(gcf, 'fig/fig8.png');
