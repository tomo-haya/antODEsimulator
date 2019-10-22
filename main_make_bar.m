
clc
clear

figure(1)%%%STARVATION for journal
tcks={'';'';''};
y = [5.0e-4-2.6e-4 5.0e-4-3.5e-4 5.0e-4-3.5e-4; 5.0e-4-3.2e-4 5.0e-4-4.4e-4 5.0e-4-4.4e-4; 5.0e-4-2.7e-4 5.0e-4-2.8e-4 5.0e-4-3.4e-4];
y = [5.0e-4-2.6e-4 5.0e-4-3.2e-4 5.0e-4-2.7e-4; 5.0e-4-3.5e-4 5.0e-4-4.4e-4 5.0e-4-2.8e-4;5.0e-4-3.5e-4 5.0e-4-4.4e-4 5.0e-4-3.4e-4];

color_set = [1 1 0;1 0 1;0 0 1];
colors = [color_set(1,:);color_set(2,:);color_set(3,:);];
colormap(colors);

set(gcf, 'Position', [0 500 600 300])
b = bar(y);
set(gca, 'XTickLabel',tcks);
ylabel('$\rho_{fdet}$','FontSize',12,'Interpreter','latex');
ylim([0e-4 5e-4])

figure(2)%%%MIDDEN for journal
tcks={'';'';''};
y = [1.1e-3 5.0e-4 4.6e-4; 3.8e-2 2.9e-3 2.6e-3; 3.7e-5 8.6e-6 7.0e-6];

color_set = [0 0 1;1 0 1;1 1 0];
colors = [color_set(1,:);color_set(2,:);color_set(3,:);];
colormap(colors);

set(gcf, 'Position', [650 500 600 300])
b = bar(y);
set(gca, 'Yscale', 'log', 'XTickLabel',tcks);
legend({'${\rm S_Y(-1)}$','${\rm S_Y(0)}$','${\rm S_Y(+1)}$'},'FontSize',12,'Position',[0.75 0.75 0.08 0.03],'Interpreter','latex');
ylabel('$\theta$','FontSize',12,'Interpreter','latex');
ylim([1e-6 5.0e-2])
text(.75,.6e-6,'Long-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(1.75,.6e-6,'Short-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(2.75,.65e-6,'Short-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(2.63,.35e-6,'before grown up','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')

figure(3)%%%DEBRIS for journal
tcks={'';'';''};
y = [1.1e-2 3.3e-1 4.1e-4; 4.4e-3 2.6e-2 7.5e-5; 4.0e-3 2.4e-2 6.1e-5];
y = [1.1e-2 4.4e-3 4.0e-3; 3.3e-1 2.6e-2 2.4e-2; 4.1e-4 7.5e-5 6.1e-5];

color_set = [0 0 1;1 0 1;1 1 0];
colors = [color_set(1,:);color_set(2,:);color_set(3,:);];
colormap(colors);

set(gcf, 'Position', [1300 500 600 300])
b = bar(y);
set(gca, 'Yscale', 'log', 'XTickLabel',tcks);
legend({'${\rm S_Y(-1)}$','${\rm S_Y(0)}$','${\rm Y(+1)}$'},'FontSize',12,'Position',[0.75 0.75 0.08 0.03],'Interpreter','latex');
ylabel('$\psi$','FontSize',12,'Interpreter','latex');
ylim([1e-5 5.0e-1])
text(.75,.6e-5,'Long-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(1.75,.6e-5,'Short-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(2.75,.65e-5,'Short-term','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')
text(2.63,.35e-5,'before grown up','FontSize',12, 'FontName','Times new Roman','Interpreter','latex')



