%report.m




y = [.25 .0433 .0223 .0234 0.0471 0.0488 0.0241];
x = 1:7;

bar(1,y(1),'FaceColor',[.3 .0 .4],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(2,y(2),'FaceColor',[.5 .0 .2],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(3,y(3),'FaceColor',[.3 .4 .3],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(4,y(4),'FaceColor',[.7 .3 .0],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(5,y(5),'FaceColor',[.3 .2 .7],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(6,y(6),'FaceColor',[.7 .6 .0],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on
bar(7,y(7),'FaceColor',[.5 .3 .0],'EdgeColor',[.7 .7 .7],'LineWidth',1.5);
hold on

ylabel('MSE')
ylim([0 .27])
title('Mean Squared Error of Linear Regression Models')