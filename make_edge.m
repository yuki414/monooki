clear all
close all
%%
node = 10;
%%
figure(42)
% gca = 42;
hold on;
% gcaaxis
set(gca, 'XTick', 0:node)
set(gca, 'YTick', 0:node)
grid on
axis([0,node, 0, node])
data = [];
i = 0;
% end_flag = 0;
while 1
    i = i + 1;
    [x,y] = ginput(1);
    if round([x,y]) == [0, 0]
        break
    end
    data(i,:) = round([x,y]);
    plot(data(i,1),data(i,2),'o')
end
data
close all