%% PD Results

% clean variables of the system 
clc, clear all, close all;

% Load Data of the system
load("Mobile_Kinematics.mat")

% Change dimentions in the variables
q = q(:, 1:end-1);

% Colors and size of the letters
lw = 1.5; % linewidth 1
lwV = 2; % linewidth 2
fontsizeLabel = 11; %11
fontsizeLegend = 11;
fontsizeTicks = 11;
fontsizeTitel = 11;
sizeX = 1250; % size figure
sizeY = 550; % size figure

% color propreties
c1 = [80, 81, 79]/255;
c2 = [244, 213, 141]/255;
c3 = [242, 95, 92]/255;
c4 = [112, 141, 129]/255;

C18 = [0 0 0];
aux_time_1 = (t >= 0) & (t < 2.05);
aux_time_2 = (t >= 0) & (t < 20.05);
aux_time_3 = (t >= 0) & (t < 40.05);

% Create Figure
figure('Position', [500 500 sizeX sizeY])
set(gcf, 'Position', [500 500 sizeX sizeY]);
fig1_comps.fig = gcf;

%% Data generation
axes('Position',[0.1 0.60 .22 .36]);

%% Desired  system plot
real_1_plot_t_0 = line(q(1, aux_time_1), q(2, aux_time_1));
desired_1_plot_t_0 = line(qd(1, aux_time_1), qd(2, aux_time_1));


set(real_1_plot_t_0, 'LineStyle', '-', 'Color', c1, 'LineWidth', lw*1.5)
set(desired_1_plot_t_0, 'LineStyle', '--', 'Color', c3, 'LineWidth', lw*1.5)



%% Title of the image
hTitle_1 = title({'$t = 2[s]$'},'fontsize',14,'interpreter','latex','Color',C18);
hXLabel_1 = xlabel('$x[m]$','fontsize',10,'interpreter','latex', 'Color',C18);
hYLabel_1 = ylabel('$y[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

%% Legend nomeclature
hLegend_1 = legend([real_1_plot_t_0, desired_1_plot_t_0],{'$\textrm{Robot}$','$\textrm{Reference}$'},'fontsize',10,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
set(gca,'ticklabelinterpreter','latex',...
        'fontsize',fontsizeTicks)
% Figure properties
ax_1 = gca;
ax_1.Box = 'on';
ax_1.BoxStyle = 'full';
ax_1.TickLength = [0.02;0.02];
ax_1.TickDirMode = 'auto';
ax_1.YMinorTick = 'on';
ax_1.XMinorTick = 'on';
ax_1.XMinorGrid = 'on';
ax_1.YMinorGrid = 'on';
ax_1.MinorGridAlpha = 0.15;
ax_1.LineWidth = 0.8;
ax_1.XLim = [-4 4];
ax_1.YLim = [-4 4];

%% Data generation
axes('Position',[0.35 0.6 .22 .36]);

%% Desired  system plot
real_2_plot_t_0 = line(q(1, aux_time_2), q(2, aux_time_2));
desired_2_plot_t_0 = line(qd(1, aux_time_2), qd(2, aux_time_2));


set(real_2_plot_t_0, 'LineStyle', '-', 'Color', c1, 'LineWidth', lw*1.5)
set(desired_2_plot_t_0, 'LineStyle', '--', 'Color', c3, 'LineWidth', lw*1.5)



%% Title of the image
hTitle_2 = title({'$t = 5[s]$'},'fontsize',14,'interpreter','latex','Color',C18);
hXLabel_2 = xlabel('$x[m]$','fontsize',10,'interpreter','latex', 'Color',C18);
hYLabel_2 = ylabel('$y[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

%% Legend nomeclature
hLegend_2 = legend([real_2_plot_t_0, desired_2_plot_t_0],{'$\textrm{Robot}$','$\textrm{Reference}$'},'fontsize',10,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
set(gca,'ticklabelinterpreter','latex',...
        'fontsize',fontsizeTicks)
% Figure properties
ax_2 = gca;
ax_2.Box = 'on';
ax_2.BoxStyle = 'full';
ax_2.TickLength = [0.02;0.02];
ax_2.TickDirMode = 'auto';
ax_2.YMinorTick = 'on';
ax_2.XMinorTick = 'on';
ax_2.XMinorGrid = 'on';
ax_2.YMinorGrid = 'on';
ax_2.MinorGridAlpha = 0.15;
ax_2.LineWidth = 0.8;
ax_2.XLim = [-4 4];
ax_2.YLim = [-4 4];

%% Data generation
axes('Position',[0.6 0.6 .22 .36]);

%% Desired  system plot
real_3_plot_t_0 = line(q(1, aux_time_3), q(2, aux_time_3));
desired_3_plot_t_0 = line(qd(1, aux_time_3), qd(2, aux_time_3));


set(real_3_plot_t_0, 'LineStyle', '-', 'Color', c1, 'LineWidth', lw*1.5)
set(desired_3_plot_t_0, 'LineStyle', '--', 'Color', c3, 'LineWidth', lw*1.5)



%% Title of the image
hTitle_3 = title({'$t = 10[s]$'},'fontsize',14,'interpreter','latex','Color',C18);
hXLabel_3 = xlabel('$x[m]$','fontsize',10,'interpreter','latex', 'Color',C18);
hYLabel_3 = ylabel('$y[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

%% Legend nomeclature
hLegend_3 = legend([real_3_plot_t_0, desired_3_plot_t_0],{'$\textrm{Robot}$','$\textrm{Reference}$'},'fontsize',10,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
set(gca,'ticklabelinterpreter','latex',...
        'fontsize',fontsizeTicks)
% Figure properties
ax_3 = gca;
ax_3.Box = 'on';
ax_3.BoxStyle = 'full';
ax_3.TickLength = [0.02;0.02];
ax_3.TickDirMode = 'auto';
ax_3.YMinorTick = 'on';
ax_3.XMinorTick = 'on';
ax_3.XMinorGrid = 'on';
ax_3.YMinorGrid = 'on';
ax_3.MinorGridAlpha = 0.15;
ax_3.LineWidth = 0.8;
ax_3.XLim = [-4 4];
ax_3.YLim = [-4 4];

axes('Position',[0.1 0.30 .72 .21]);
%% Data generation
error1_plot = line(t,qe(1,:));
set(error1_plot, 'LineStyle', '-', 'Color', c3, 'LineWidth', lw);
error2_plot = line(t,qe(2,:));
set(error2_plot, 'LineStyle', '-', 'Color', c4, 'LineWidth', lw);

% fig1_comps.p1 = ul_plot;
%% Title of the image
%hTitle_1 = title({'$\textrm{(c)}$'},'fontsize',14,'interpreter','latex','Color',C18);
%xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Error}[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

%% Legend nomeclature
hLegend_1 = legend([error1_plot,error2_plot],{'$\tilde{{x}}$','${\tilde{{y}}}$'},'fontsize',10,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',fontsizeTicks)
     
%% Figure properties
ax_4 = gca;
ax_4.Box = 'on';
ax_4.BoxStyle = 'full';
ax_4.XTickLabel = [];
ax_4.TickLength = [0.01;0.01];
ax_4.TickDirMode = 'auto';
ax_4.YMinorTick = 'on';
ax_4.XMinorTick = 'on';
ax_4.XMinorGrid = 'on';
ax_4.YMinorGrid = 'on';

%ax_1.MinorGridColor = '#8f8f8f';
ax_4.MinorGridAlpha = 0.15;
ax_4.LineWidth = 0.8;

axes('Position',[0.1 0.07 .72 .21]);
%% Data generation
control1_plot = line(t,u(1,:));
set(control1_plot, 'LineStyle', '-', 'Color', c4, 'LineWidth', lw);
control2_plot = line(t,u(2,:));
set(control2_plot, 'LineStyle', '-', 'Color', c2, 'LineWidth', lw);

% fig1_comps.p1 = ul_plot;
%% Title of the image
%hTitle_1 = title({'$\textrm{(c)}$'},'fontsize',14,'interpreter','latex','Color',C18);
xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Control}[m/s,rad/s]$','fontsize',10,'interpreter','latex', 'Color',C18);

%% Legend nomeclature
hLegend_5 = legend([control1_plot,control2_plot],{'$\mu_c$','$\omega_c$'},'fontsize',10,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',fontsizeTicks)
     
%% Figure properties
ax_5 = gca;
ax_5.Box = 'on';
ax_5.BoxStyle = 'full';
ax_5.TickLength = [0.01;0.01];
ax_5.TickDirMode = 'auto';
ax_5.YMinorTick = 'on';
ax_5.XMinorTick = 'on';
ax_5.XMinorGrid = 'on';
ax_5.YMinorGrid = 'on';
%ax_1.MinorGridColor = '#8f8f8f';
ax_5.MinorGridAlpha = 0.15;
ax_5.LineWidth = 0.8;

%% Zoom Plot
axes('Position',[0.385 0.37 .15 .11]);
index_zoom_1 = (t>=10) & (t<=15);
error_x_plot_zoom = line(t(index_zoom_1),qe(1, index_zoom_1));
error_y_plot_zoom = line(t(index_zoom_1),qe(2, index_zoom_1));

set(error_x_plot_zoom, 'LineStyle', '-', 'Color', c4, 'LineWidth', lw*0.8);
set(error_y_plot_zoom, 'LineStyle', '-', 'Color', c3, 'LineWidth', lw*0.8);

set(gca,'ticklabelinterpreter','latex',...
         'fontsize',fontsizeTicks*0.5)
ax_1_zoom = gca;
ax_1_zoom.Box = 'on';
ax_1_zoom.BoxStyle = 'full';
ax_1_zoom.TickLength = [0.01;0.01];
%ax_1_zoom.YLim = [-0.5 0.5];
%ax_1_zoom.YTickLabel = [];
%ax_1_zoom.XTickLabel = [];
ax_1_zoom.TickDirMode = 'manual';
ax_1_zoom.TickDir = 'in';
ax_1_zoom.YMinorTick = 'on';
ax_1_zoom.XMinorTick = 'on';
ax_1_zoom.LineWidth = 0.5;
ax_1_zoom.XMinorGrid = 'on';
ax_1_zoom.YMinorGrid = 'on';

% set(gcf, 'Color', 'w'); % Sets axes background
% export_fig Results_Kinematics.pdf -q101