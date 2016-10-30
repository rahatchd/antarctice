area = zeros(1, 341);
days = linspace(1, 183, 341);

frame = imread('data/filter/img10.png');
area(1) = sum(frame(:));
area_0 = area(1);

for n = 10:350
    frame = imread(['data/filter/img' num2str(n) '.png']);
    area(n-9) = (sum(frame(:)) - area_0) / area_0 * 100;
end

figure
plot(days, area);
title('Change in Ice Area');
ylabel('percentage change');
xlabel('days from Mar 21, 2014');
grid on
grid minor
saveas(gcf, 'fig/fig5.png');

polynomial = polyfit(days, area, 2);
figure
plot(days, area);
hold on
plot(days, polyval(polynomial, days));
title('Change in Ice Area');
ylabel('percentage change');
xlabel('days from Mar 21, 2014');
legend('data','poly', 'Location','northwest');
axis([0, 200, 0, 70]);
grid on
grid minor
hold off
saveas(gcf, 'fig/fig6.png');

sept30 = polyval(polynomial, 194);
