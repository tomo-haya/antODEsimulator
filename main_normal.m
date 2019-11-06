
reset(groot);
set(groot,'defaultAxesFontSize',12);
set(groot,'defaultAxesFontWeight','demi'); % normal/demi/bold
set(groot,'defaultTextFontSize',12);
set(groot,'defaultTextFontWeight','demi');

clear
clc

%%%%%%Program to make Fig. 3

figh = 0.15;%%Size of figure for height
figw = 0.23;%%Size of figure for width
dist_h = 0.23;%%Distance between figure for height
dist_w1 = 0.30;%%Distance between figure for width
below_ini0 = 0.08;
left_ini1 = 0.14;%%Distance between figure for height

pos1 = zeros(12, 4);  
pos1(1,:) = [left_ini1 below_ini0 + 3 * dist_h  figw figh];
pos1(2,:) = [left_ini1 below_ini0 + 2 * dist_h figw figh];
pos1(3,:) = [left_ini1 below_ini0 + 1 * dist_h  figw figh];
pos1(4,:) = [left_ini1  below_ini0 figw figh];
pos1(5,:) = [left_ini1 + dist_w1  below_ini0 + 3 * dist_h figw figh];
pos1(6,:) = [left_ini1 + dist_w1 below_ini0 + 2 * dist_h figw figh];
pos1(7,:) = [left_ini1 + dist_w1 below_ini0 + 1 * dist_h  figw figh];
pos1(8,:) = [left_ini1 + 1 * dist_w1 below_ini0 figw figh];
pos1(9,:) = [left_ini1 + 2 * dist_w1  below_ini0 + 3 * dist_h figw figh];
pos1(10,:) = [left_ini1 + 2 * dist_w1 below_ini0 + 2 * dist_h figw figh];
pos1(11,:) = [left_ini1 + 2 * dist_w1 below_ini0 + 1 * dist_h  figw figh];
pos1(12,:) = [left_ini1 + 2 * dist_w1 below_ini0  figw figh];

below_ini2 = 0.119;%%Distance between figure for height

pos2 = zeros(12, 4);  
pos2(1,:) = [left_ini1 below_ini2 + 3 * dist_h  figw figh];
pos2(2,:) = [left_ini1 below_ini2 + 2 * dist_h figw figh];
pos2(3,:) = [left_ini1 below_ini2 + 1 * dist_h  figw figh];
pos2(4,:) = [left_ini1 below_ini2 figw figh];
pos2(5,:) = [left_ini1 + dist_w1  below_ini2 + 3 * dist_h figw figh];
pos2(6,:) = [left_ini1 + dist_w1 below_ini2 + 2 * dist_h figw figh];
pos2(7,:) = [left_ini1 + dist_w1 below_ini2 + 1 * dist_h  figw figh];
pos2(8,:) = [left_ini1 + dist_w1 below_ini2 figw figh];
pos2(9,:) = [left_ini1 + 2 * dist_w1  below_ini2 + 3 * dist_h figw figh];
pos2(10,:) = [left_ini1 + 2 * dist_w1 below_ini2 + 2 * dist_h figw figh];
pos2(11,:) = [left_ini1 + 2 * dist_w1 below_ini2 + 1 * dist_h  figw figh];
pos2(12,:) = [left_ini1 + 2 * dist_w1 below_ini2  figw figh];
    
    
S = zeros(1,12);
for i=1:12
    figure(1)%% Colony size calculation & plot
    set(gcf, 'Position', [1100 100 1100 800])
    subplot('Position',pos1(i,:));

    [t,y]=solve_vdp(i);
    ty=t/(6.5*60*60*30*7);
    CCS =y(:,1)+y(:,2)+y(:,3)+y(:,4)+y(:,5)+y(:,6)+y(:,7)+y(:,8)+y(:,9)+y(:,10);%コロニーサイズ
    %% plot
    colormap('jet');
    plot(ty,CCS,'LineWidth',3)
    axis([0,15,0,10000])
    set(gca,'FontSize',15);
    set(gca, 'FontName','Times new Roman'); 

    if (i == 1)%%SX(-1) SY(-1)
        ylabel('Colony size','FontSize',15)
        text(-8.5,5000,'${\rm S_X(-1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')    
        text(5.,12000,'${\rm S_Y(-1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')    
    end
    if (i == 2)%%SX(0H) SY(-1)
        text(-8.5,5000,'${\rm S_X(0H)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
    end
    if (i == 3)%%SX(0L) SY(-1) 
        text(-8.5,5000,'${\rm S_X(0L)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
    end
    if (i == 4)%%SX(+1) SY(-1)
        text(-8.5,5000,'${\rm S_X(+1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
    end
    if (i == 5)%%SX(-1) SY(0)
         text(5.,12000,'${\rm S_Y(0)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
    end
    if (i == 8)%%SX(+1) SY(0)
        xlabel('t[Year]')
    end
    if (i == 9)%%SX(-1) SY(+1)
        text(5.,12000,'${\rm S_Y(+1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
    end

    hold off
    
    %%%%%%Inset of figure
    figure(3)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 3)%%SX(0L) SY(-1) 
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end    
    figure(4)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 4)%%SX(+1) SY(-1)
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end   
    figure(5)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 7)%%SX(0L) SY(0)
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end   
    figure(6)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 8)%%SX(+1) SY(0)
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end   
    figure(7)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 11)%%SX(0L) SY(+1)
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end   
    figure(8)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 12)%%SX(+1) SY(+1)
        plot(ty,CCS,'LineWidth',3)
        axis([0,0.01,0,100])
    end   
    
%% Task Rate calculation   
   [m,n] = size(y); 
   S(1,i) = m;
   if (i == 1)
      ty1 = ty;
      F1 = zeros(m,1);
      M1 = zeros(m,1);
      N1 = zeros(m,1);
      I1 = zeros(m,1);
      CCS1 = zeros(m,1);
       F1(:,1) = y(:,4);
       M1(:,1) = y(:,5);
       N1(:,1) = y(:,6);
       I1(:,1) = y(:,10)*0.2;
       CCS1(:,1) = F1(:,1) + M1(:,1) + N1(:,1) + I1(:,1);
       Y1 = [F1(:,1), M1(:,1), N1(:,1), I1(:,1)];
       Z1 = zeros(m,4);
   end
   if (i == 2)
       ty2 = ty;
       F2 = zeros(m,1);
       M2 = zeros(m,1);
       N2 = zeros(m,1);
       I2 = zeros(m,1);    
       CCS2 = zeros(m,1); 
       F2(:,1) = y(:,4);
       M2(:,1) = y(:,5);
       N2(:,1) = y(:,6);
       I2(:,1) = y(:,10)*0.2;
       CCS2(:,1) = F2(:,1) + M2(:,1) + N2(:,1) + I2(:,1);
       Y2 = [F2(:,1), M2(:,1), N2(:,1), I2(:,1)];
       Z2 = zeros(m,4);
   end
   if (i == 3)
       ty3 = ty;
       F3 = zeros(m,1);
       M3 = zeros(m,1);
       N3 = zeros(m,1);
       I3 = zeros(m,1);
       CCS3 = zeros(m,1);
       F3(:,1) = y(:,4);
       M3(:,1) = y(:,5);
       N3(:,1) = y(:,6);
       I3(:,1) = y(:,10)*0.2;
       CCS3(:,1) = F3(:,1) + M3(:,1) + N3(:,1) + I3(:,1);
       Y3 = [F3(:,1), M3(:,1), N3(:,1), I3(:,1)];
       Z3 = zeros(m,4);
   end
   if (i == 4)
       ty4 = ty;
       F4 = zeros(m,1);
       M4 = zeros(m,1);
       N4 = zeros(m,1);
       I4 = zeros(m,1);    
       CCS4 = zeros(m,1); 
       F4(:,1) = y(:,4);
       M4(:,1) = y(:,5);
       N4(:,1) = y(:,6);
       I4(:,1) = y(:,10)*0.2;
       CCS4(:,1) = F4(:,1) + M4(:,1) + N4(:,1) + I4(:,1);
       Y4 = [F4(:,1), M4(:,1), N4(:,1), I4(:,1)];
       Z4 = zeros(m,4);
   end
   if (i == 5)
       ty5 = ty;
       F5 = zeros(m,1);
       M5 = zeros(m,1);
       N5 = zeros(m,1);
       I5 = zeros(m,1);    
       CCS5 = zeros(m,1); 
       F5(:,1) = y(:,4);
       M5(:,1) = y(:,5);
       N5(:,1) = y(:,6);
       I5(:,1) = y(:,10)*0.2;
       CCS5(:,1) = F5(:,1) + M5(:,1) + N5(:,1) + I5(:,1);
       Y5 = [F5(:,1), M5(:,1), N5(:,1), I5(:,1)];
       Z5 = zeros(m,4);
   end
   if (i == 6)
         ty6 = ty;
         F6 = zeros(m,1);
         M6 = zeros(m,1);
         N6 = zeros(m,1);
         I6 = zeros(m,1);    
         CCS6 = zeros(m,1); 
         F6(:,1) = y(:,4);
         M6(:,1) = y(:,5);
         N6(:,1) = y(:,6);
         I6(:,1) = y(:,10)*0.2;
         CCS6(:,1) = F6(:,1) + M6(:,1) + N6(:,1) + I6(:,1);
         Y6 = [F6(:,1), M6(:,1), N6(:,1), I6(:,1)];
         Z6 = zeros(m,4);
   end
   if (i == 7)
         ty7 = ty;
         F7 = zeros(m,1);
         M7 = zeros(m,1);
         N7 = zeros(m,1);
         I7 = zeros(m,1);    
         CCS7 = zeros(m,1); 
         F7(:,1) = y(:,4);
         M7(:,1) = y(:,5);
         N7(:,1) = y(:,6);
         I7(:,1) = y(:,10)*0.2;
         CCS7(:,1) = F7(:,1) + M7(:,1) + N7(:,1) + I7(:,1);
         Y7 = [F7(:,1), M7(:,1), N7(:,1), I7(:,1)];
         Z7 = zeros(m,4);
   end
   if (i == 8)
         ty8 = ty;
         F8 = zeros(m,1);
         M8 = zeros(m,1);
         N8 = zeros(m,1);
         I8 = zeros(m,1);    
         CCS8 = zeros(m,1); 
         F8(:,1) = y(:,4);
         M8(:,1) = y(:,5);
         N8(:,1) = y(:,6);
         I8(:,1) = y(:,10)*0.2;
         CCS8(:,1) = F8(:,1) + M8(:,1) + N8(:,1) + I8(:,1);
         Y8 = [F8(:,1), M8(:,1), N8(:,1), I8(:,1)];
         Z8 = zeros(m,4);
   end
   if (i == 9)
         ty9 = ty;
         F9 = zeros(m,1);
         M9 = zeros(m,1);
         N9 = zeros(m,1);
         I9 = zeros(m,1);    
         CCS9 = zeros(m,1); 
         F9(:,1) = y(:,4);
         M9(:,1) = y(:,5);
         N9(:,1) = y(:,6);
         I9(:,1) = y(:,10)*0.2;
         CCS9(:,1) = F9(:,1) + M9(:,1) + N9(:,1) + I9(:,1);
         Y9 = [F9(:,1), M9(:,1), N9(:,1), I9(:,1)];
         Z9 = zeros(m,4);
   end
   if (i == 10)
         ty10 = ty;
         F10 = zeros(m,1);
         M10 = zeros(m,1);
         N10 = zeros(m,1);
         I10 = zeros(m,1);    
         CCS10 = zeros(m,1); 
         F10(:,1) = y(:,4);
         M10(:,1) = y(:,5);
         N10(:,1) = y(:,6);
         I10(:,1) = y(:,10)*0.2;
         CCS10(:,1) = F10(:,1) + M10(:,1) + N10(:,1) + I10(:,1);
         Y10 = [F10(:,1), M10(:,1), N10(:,1), I10(:,1)];
         Z10 = zeros(m,4);
   end
   if (i == 11)
         ty11 = ty;
         F11 = zeros(m,1);
         M11 = zeros(m,1);
         N11 = zeros(m,1);
         I11 = zeros(m,1);    
         CCS11 = zeros(m,1); 
         F11(:,1) = y(:,4);
         M11(:,1) = y(:,5);
         N11(:,1) = y(:,6);
         I11(:,1) = y(:,10)*0.2;
         CCS11(:,1) = F11(:,1) + M11(:,1) + N11(:,1) + I11(:,1);
         Y11 = [F11(:,1), M11(:,1), N11(:,1), I11(:,1)];
         Z11 = zeros(m,4);
   end
   if (i == 12)
         ty12 = ty;
         F12 = zeros(m,1);
         M12 = zeros(m,1);
         N12 = zeros(m,1);
         I12 = zeros(m,1);    
         CCS12 = zeros(m,1); 
         F12(:,1) = y(:,4);
         M12(:,1) = y(:,5);
         N12(:,1) = y(:,6);
         I12(:,1) = y(:,10)*0.2;
         CCS12(:,1) = F12(:,1) + M12(:,1) + N12(:,1) + I12(:,1);
         Y12 = [F12(:,1), M12(:,1), N12(:,1), I12(:,1)];
         Z12 = zeros(m,4);
   end
   
    figure(2)%% Task Rate plot
     set(gcf, 'Position', [100 100 1100 800])
     subplot('Position', pos2(i,:));
     set( gca, 'FontName','Times new Roman','FontSize',15); 
   if (i == 1)
       for X= 1:S(1,i)
            for T = 1:4
                Z1(X,T) = Y1(X,T)/CCS1(X,1);
            end
       end
       area(ty1, Z1)
       axis([0,15,0,1])
       text(-8.5,0.5,'${\rm S_X(-1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
       text(5.,1.2,'${\rm S_Y(-1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')  
       ylabel({'Task allocation rate','in engaged workers'},'FontSize',15)
      
   end  
   if (i == 2)
       for X= 1:S(1,i)
            for T = 1:4
                Z2(X,T) = Y2(X,T)/CCS2(X,1);
            end
       end
       area(ty2, Z2)
       axis([0,15,0,1])
       text(-8.5,0.5,'${\rm S_X(0H)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex') 
   end    
   if (i == 3)
       for X= 1:S(1,i)
            for T = 1:4
                Z3(X,T) = Y3(X,T)/CCS3(X,1);
            end
       end
       area(ty3, Z3)
       axis([0,15,0,1])
       text(-8.5,0.5,'${\rm S_X(0L)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex') 
   end       
   if (i == 4)
       for X= 1:S(1,i)
            for T = 1:4
                Z4(X,T) = Y4(X,T)/CCS4(X,1);
            end
       end
       area(ty4, Z4)
       axis([0,15,0,1])
       text(-8.5,0.5,'${\rm S_X(+1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex') 
    end     
   if (i == 5)
       for X= 1:S(1,i)
            for T = 1:4
                Z5(X,T) = Y5(X,T)/CCS5(X,1);
            end
       end
       area(ty5, Z5)
       axis([0,15,0,1])
       text(5.,1.2,'${\rm S_Y(0)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')
   end      
   if (i == 6)
       for X= 1:S(1,i)
            for T = 1:4
                Z6(X,T) = Y6(X,T)/CCS6(X,1);
            end
       end
       area(ty6, Z6)
       axis([0,15,0,1])       
   end      
   if (i == 7)
       for X= 1:S(1,i)
            for T = 1:4
                Z7(X,T) = Y7(X,T)/CCS7(X,1);
            end
       end
       area(ty7, Z7)
       axis([0,15,0,1])
   end      
   if (i == 8)
       for X= 1:S(1,i)
            for T = 1:4
                Z8(X,T) = Y8(X,T)/CCS8(X,1);
            end
       end
       area(ty8, Z8)
       axis([0,15,0,1])
       text(5.5,-0.4,'t[Year]','FontSize', 15, 'FontName','Times new Roman')
   end   
   if (i == 9)
       for X= 1:S(1,i)
            for T = 1:4
                Z9(X,T) = Y9(X,T)/CCS9(X,1);
            end
       end
       area(ty9, Z9)
       axis([0,15,0,1])
       text(5.,1.2,'${\rm S_Y(+1)}$','FontSize',15, 'FontName','Times new Roman','Interpreter','latex')
   end   
   if (i == 10)
       for X= 1:S(1,i)
            for T = 1:4
                Z10(X,T) = Y10(X,T)/CCS10(X,1);
            end
       end
       area(ty10, Z10)
       axis([0,15,0,1])
   end      
   if (i == 11)
       for X= 1:S(1,i)
            for T = 1:4
                Z11(X,T) = Y11(X,T)/CCS11(X,1);
            end
       end
       area(ty11, Z11)
       axis([0,15,0,1])
   end   
   if (i == 12)
       for X= 1:S(1,i)
            for T = 1:4
                Z12(X,T) = Y12(X,T)/CCS12(X,1);
            end
       end
       area(ty12, Z12)
       axis([0,15,0,1])
       set(gca,'FontSize', 15, 'FontName','Times new Roman');
       l=legend({'Foraging','Midden Work','Nest maintenance','Brood care'},'Position',[0.45 -0.08 0.1 0.2],'Orientation','horizontal', 'FontName','Times new Roman');
       set(l,'FontSize', 15)
   end   
   
       %%%%%%Inset of figure
    figure(9)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 3)%%SX(0L) SY(-1) 
        area(ty3, Z3)
        axis([0,0.01,0,1])
    end    
    figure(10)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 4)%%SX(+1) SY(-1)
        area(ty4, Z4)
        axis([0,0.01,0,1])
    end   
    figure(11)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 7)%%SX(0L) SY(0)
        area(ty7, Z7)
        axis([0,0.01,0,1])
    end   
    figure(12)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 8)%%SX(+1) SY(0)
        area(ty8, Z8)
        axis([0,0.01,0,1])
    end   
    figure(13)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 11)%%SX(0L) SY(+1)
        area(ty11, Z11)
        axis([0,0.01,0,1])
    end   
    figure(14)
    set(gcf, 'Position', [100 100 200 100])
    if (i == 12)%%SX(+1) SY(+1)
        area(ty12, Z12)
        axis([0,0.01,0,1])
    end   

end


