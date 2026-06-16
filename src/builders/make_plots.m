function [I_img, I_mu, I_mc, J_mi] = make_plots( ...
    all_params, ...
    all_meshs, ...
    result, ...
    I_axes, ...
    J_axes ...
)
    result.u_hist = result.u_hist*1e6;
    result.I_cent_hist = 1e6*result.I_cent_hist;
    x_f = 1e6*all_meshs.lens_metric_coords.X(1, :);

    I_axes.CLim = [min(result.I_hist{1}(:)), max(result.I_hist{1}(:))];
    I_axes.XLim = [x_f(1), x_f(end)];
    I_axes.YLim = [x_f(1), x_f(end)];
    I_axes.DataAspectRatio = [1 1 1];
    I_axes.DataAspectRatioMode = 'manual';
    I_axes.PlotBoxAspectRatioMode = 'auto';
    I_axes.Colormap = colormap(I_axes, 'hot');
    I_axes.Title.String = sprintf('Интенсивность (итерация %d)', 1);
    I_axes.XLabel.String = 'x (мкм)';
    I_axes.YLabel.String = 'y (мкм)';
    hold(I_axes, 'on');
    
    colorbar(I_axes);
    
    I_img = imagesc(I_axes, x_f, x_f, result.I_hist{1});
    I_img.Interpolation = 'nearest';
    
    I_mu = plot(I_axes, result.u_hist(1,1), result.u_hist(1,2));
    I_mu.Marker = 'o';
    I_mu.MarkerEdgeColor = [0 0 0];
    I_mu.MarkerFaceColor = [0 0 1];
    I_mu.MarkerSize = 6;
    
    I_mc = plot(I_axes, result.I_cent_hist(1,1), result.I_cent_hist(1,2));
    I_mc.Marker = 'o';
    I_mc.MarkerEdgeColor = [0 0 0];
    I_mc.MarkerFaceColor = [0 1 0];
    I_mc.MarkerSize = 6;
    
    I_origin = plot(I_axes, 0, 0);
    I_origin.Marker = '+';
    I_origin.MarkerEdgeColor = 'cyan';
    I_origin.MarkerFaceColor = 'cyan';
    I_origin.MarkerSize = 6;
    
    w_f_um = all_params.lens_params.w_f*1E6;
    theta_circ = linspace(0, 2*pi, 200);
    x_circ = w_f_um * cos(theta_circ);
    y_circ = w_f_um * sin(theta_circ);
    
    I_fiber_circle = plot(I_axes, x_circ, y_circ);
    I_fiber_circle.Color = 'cyan';
    I_fiber_circle.LineWidth = 1.5;
    I_fiber_circle.LineStyle = '-.';
    
    I_lg = legend( ...
        I_axes, ...
        [I_mc, I_mu, I_fiber_circle], ...
        {'I_{cent}', 'u', sprintf('Волокно (r = %.1f мкм)', w_f_um)} ...
    );
    I_lg.Location = 'northeast';
    I_lg.Box = 'off';
    I_lg.FontSize = 10;
    
    J_axes.PlotBoxAspectRatio = [1 1 1];
    J_axes.Title.String = 'Сходимость алгоритма';
    J_axes.YLabel.String = 'Эффективность связи (J)';
    J_axes.XLabel.String = 'Итерация';
    J_axes.NextPlot = 'add';
    J_axes.XGrid = 'on';
    J_axes.YGrid = 'on';
    hold(J_axes, 'on');
    
    J_plot = plot(J_axes, 1:all_params.hyper_params.N_iter, result.J_hist);
    J_plot.Color = [0 0 1];
    J_plot.LineStyle = "-";
    J_plot.LineWidth = 2;
    
    J_mi = plot(J_axes, 1, result.J_hist(1));
    J_mi.Marker = 'o';
    J_mi.MarkerEdgeColor = [0 0 0];
    J_mi.MarkerFaceColor = [0 1 0];
    J_mi.MarkerSize = 6;
    
    J_lg = legend(J_axes, [J_plot, J_mi], {'CE', 'Текущая итерация'});
    J_lg.Location = 'southeast';
    J_lg.Box = 'off';
    J_lg.FontSize = 10;
end