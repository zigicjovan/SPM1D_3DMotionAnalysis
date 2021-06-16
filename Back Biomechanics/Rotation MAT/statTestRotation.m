function statTestRotation

    % This is for standing data

    %Female LBP (27 sub): 4 7 8 9 10 11 18 19 20 21 24 25 28 30 32 34 35 36 37 39 42
    %43 44 46 47 48 50
    %Female NLBP (21 sub): 2 3 6 12 15 16 22 23 26 31 33 38 40 41 45 51 52 55
    %56 57 58
    %Male LBP (9 sub): 1 5 13 14 17 27 29 49 54
    %Male NLBP (3 sub): 53 59 60
    %z axial, y sagittal, x frontal
    
    %for Sit, 6 to 14 minus 1, 16 to 60 minus 2.
    %for SRR, 6 to 14 minus 1, 16 to 18 minus 2, 20 to 42 minus 3, 44 to 60 minus 4.
    
    %UTULZ
    
    data = load('datasetUTULZ_RotateL.mat','datasetUTULZ_RotateL');
    [YP,YNP] = deal([data.datasetUTULZ_RotateL.Subject4 data.datasetUTULZ_RotateL.Subject7 ...
        data.datasetUTULZ_RotateL.Subject8 data.datasetUTULZ_RotateL.Subject9 ...
        data.datasetUTULZ_RotateL.Subject10 data.datasetUTULZ_RotateL.Subject11 ...
        data.datasetUTULZ_RotateL.Subject18 data.datasetUTULZ_RotateL.Subject19 ...
        data.datasetUTULZ_RotateL.Subject20 data.datasetUTULZ_RotateL.Subject21 ...
        data.datasetUTULZ_RotateL.Subject24 data.datasetUTULZ_RotateL.Subject25 ...
        data.datasetUTULZ_RotateL.Subject28 data.datasetUTULZ_RotateL.Subject30 ...
        data.datasetUTULZ_RotateL.Subject32 data.datasetUTULZ_RotateL.Subject34 ...
        data.datasetUTULZ_RotateL.Subject35 data.datasetUTULZ_RotateL.Subject36 ...
        data.datasetUTULZ_RotateL.Subject37 data.datasetUTULZ_RotateL.Subject39 ...
        data.datasetUTULZ_RotateL.Subject42 data.datasetUTULZ_RotateL.Subject43 ...
        data.datasetUTULZ_RotateL.Subject44 data.datasetUTULZ_RotateL.Subject46 ...
        data.datasetUTULZ_RotateL.Subject47 data.datasetUTULZ_RotateL.Subject48 ...
        data.datasetUTULZ_RotateL.Subject50 ], ...
        [data.datasetUTULZ_RotateL.Subject2 data.datasetUTULZ_RotateL.Subject3 ...
        data.datasetUTULZ_RotateL.Subject6 data.datasetUTULZ_RotateL.Subject12 ...
        data.datasetUTULZ_RotateL.Subject15 data.datasetUTULZ_RotateL.Subject16 ...
        data.datasetUTULZ_RotateL.Subject22 data.datasetUTULZ_RotateL.Subject23 ...
        data.datasetUTULZ_RotateL.Subject26 data.datasetUTULZ_RotateL.Subject31 ...
        data.datasetUTULZ_RotateL.Subject33 data.datasetUTULZ_RotateL.Subject38 ...
        data.datasetUTULZ_RotateL.Subject40 data.datasetUTULZ_RotateL.Subject41 ...
        data.datasetUTULZ_RotateL.Subject45 data.datasetUTULZ_RotateL.Subject51 ...
        data.datasetUTULZ_RotateL.Subject52 data.datasetUTULZ_RotateL.Subject55 ...
        data.datasetUTULZ_RotateL.Subject56 data.datasetUTULZ_RotateL.Subject57 ...
        data.datasetUTULZ_RotateL.Subject58 ]);
    spm       = spm1d.stats.ttest2(YP', YNP');
    spmi      = spm.inference(0.05, 'two_tailed', true, 'interp',true);
    disp(spmi);

    close all
    subplot(1,2,1);
    spmi.plot();
    title('Two-Sample T-Test');
    xlabel('Time (%)','FontSize',12,'FontWeight','bold');
    ylabel('Variance','FontSize',12,'FontWeight','bold');
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    
    subplot(1,2,2);
    YPmean = mean (YP');
    YPstd = std (YP');
    numYPPts = length (YPmean);
    YNPmean = mean (YNP');
    YNPstd = std (YNP');
    numYNPPts = length (YNPmean);
    p1 = plot (1:numYPPts, YPmean, 'b','LineWidth',2);
    hold on
	plot (1:numYPPts, YPmean + YPstd, 'b--');
	plot (1:numYPPts, YPmean - YPstd, 'b--');
    p2 = plot (1:numYNPPts, YNPmean, 'r','LineWidth',2);
	plot (1:numYNPPts, YNPmean + YNPstd, 'r--');
    plot (1:numYNPPts, YNPmean - YNPstd, 'r--');
    xlim ([1 numYPPts]);
    legend([p1 p2],'Pain','No Pain', 'Location','northwest')
    title('Mean and SD');
    xlabel('Time (%)','FontSize',12,'FontWeight','bold');
    ylabel('Angle','FontSize',12,'FontWeight','bold');
    
    savefig('UTULZ_RotateL_Females');
    saveas(gcf,'UTULZ_RotateL_Females.png');
    
end