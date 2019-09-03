%% 3. dio zadatka 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
close all;


%%  N = 1 - take only 1 simialr future samples
% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

similarsArr = [];

% c = column, r = row
% matrix{c,r}

x = 1:18;

similarSampleMSE1 = [];
similarSampleMSE1StdDev = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:32
    sam = samples{i,1};
    sam = sam.';
    realFutureSam = samples{i,2};
    realFutureSam = realFutureSam.';
    
    sim = similars{i,1};
    
    futureSim = sim{1,3};
    futureSim = futureSim.';

    x = 1:18;
    
    matrix = [];
    matrix(1,1:12) = sam;
    matrix(1,13:18) = realFutureSam;
    matrix(2,1:12) = sam;
    matrix(2,13:18)= futureSim;
    
    futureArr1 = [futureSim];    
    
    meanMatrix1 = [sam futureArr1];
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    
    similarSampleDiff1 = 0;
    similarSampleDiff1 = ((futureArr1 - realFutureSam).^2);
    
    N = 6;
    similarSampleSum1 = sum(similarSampleDiff1);
    similarSampleDividedSum1 = similarSampleSum1/(N-1);
    similarSampleMSEi = sqrt(similarSampleDividedSum1);
    
    similarSampleMSE1 = [similarSampleMSE1 similarSampleMSEi];
    
    similarSampleMSE1StdDevi = std(similarSampleMSE1);
    similarSampleMSE1StdDev = [similarSampleMSE1StdDev similarSampleMSE1StdDevi];

    
    % plotting 
    
%     figN1 = figure(i);
%     
%    % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
%     
%     % plot all N future graph values
%     plotN1 = plot(x*5, meanMatrix1, '-o', x*5, matrix(1,:), 'g-o');
%     
%     % grid config
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]);
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
%     title(sprintf('Estimacija buduæih vrijednosti pomoæu sliènosti N=%d', i));                            %Give the plot a title
%     
%     %legend
%     legend('Buduæe vrijednosti za k = 1','Stvarne vrijednosti', 'Location', 'best');      
%   
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % SAVE plot as fig and jpg in folder
%     saveas(figN1, fullfile('averageSimilarsN1',sprintf('averageSimilarsk=1N=%d', i)), 'jpg'); 
%     saveas(figN1, fullfile('averageSimilarsN1',sprintf('averageSimilarsk=1N=%d', i))); 
%     delete(plotN1);
%     close all
   
end

similarSampleMSE1 = similarSampleMSE1.';
similarSampleMSE1AverageSum = sum(similarSampleMSE1);
similarSampleMSE1Average = similarSampleMSE1AverageSum/32;


similarSampleMSE1StdDevSum = sum(similarSampleMSE1StdDev);
similarSampleMSE1StdDevFinal = similarSampleMSE1StdDevSum/32;

similarSampleMinMSE1 = min(similarSampleMSE1);
similarSampleMaxMSE1 = max(similarSampleMSE1);

%%  N = 2 - take only 2 simialr future samples
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

similarsArr = [];

% c = column, r = row
% matrix{c,r}

x = 1:18;

similarSampleMSE2 = [];
similarSampleMSE2StdDev = [];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:32
           
    sam = samples{i,1};
    sam = sam.';
    realFutureSam = samples{i,2};
    realFutureSam = realFutureSam.';
    
    % sim = similars{i,N} ?????
    sim = similars{i,1};
    sim2 = similars{i,2};
        
    futureSim = sim{1,3};
    futureSim = futureSim.';
    futureSim2 = sim2{1,3};
    futureSim2 = futureSim2.';
 
    x = 1:18;
    
    matrix = [];
    
    % pokusat ovo u petlji izvesti 
    % matrix(1:(N+1),1:12) = sam;
    % matrix(1, 13:18) = realfutureSam;
    % matrix(N:(N+1), 13:18) = futureSim;
    
    matrix(1,1:12) = sam;
    matrix(1,13:18) = realFutureSam;
    matrix(2,1:12) = sam;
    matrix(2,13:18)= futureSim;
    matrix(3,1:12) = sam;
    matrix(3,13:18)= futureSim2;
 
    futureArr2 = [futureSim; futureSim2];
    meanSim2 = mean(futureArr2);
       
    meanMatrix2 = [sam meanSim2];
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    similarSampleDiff2 = 0;
    similarSampleDiff2 = ((meanSim2 - realFutureSam).^2);
    
    N = 6;
    similarSampleSum2 = sum(similarSampleDiff2);
    similarSampleDividedSum2 = similarSampleSum2/(N-1);
    similarSampleMSE2i = sqrt(similarSampleDividedSum2);
    
    similarSampleMSE2 = [similarSampleMSE2 similarSampleMSE2i];
    
    similarSampleMSE2StdDevi = std(similarSampleMSE2);
    similarSampleMSE2StdDev = [similarSampleMSE2StdDev similarSampleMSE2StdDevi];
    
%     % plotting 
%     figN2 = figure(i);
%     
%     % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
%     
%     % plot all N future graph values
%     subplot(2,1,1);
%     plotN2 = plot(x*5, matrix(2:3,:), '-o', x*5, matrix(1,:), 'g-o');
%     
%     % grid config
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]);
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
%     title(sprintf('Estimacija buduæih vrijednosti pomoæu sliènosti N=%d', i));                            %Give the plot a title
%     
%     %legend
%     legend('Buduæe vrijednosti za k = 1','Buduæe vrijednosti za k = 2','Stvarne vrijednosti', 'Location', 'bestoutside');
%     
%     subplot(2,1,2);
%     plotN2Mean = plot(x*5, meanMatrix2, 'b-o', x*5, matrix(1,:), 'g-o');
% 
%     % grid config
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]);
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
%     
%     %legend
%     legend('Srednja vrijednost - estimacija', 'Stvarne vrijednosti', 'Location', 'bestoutside');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % SAVE plot as fig and jpg in folder
%     saveas(figN2, fullfile('averageSimilarsN2',sprintf('averageSimilarsk=2N=%d', i)));
%     saveas(figN2, fullfile('averageSimilarsN2',sprintf('averageSimilarsk=2N=%d', i)), 'jpg');
%     delete(plotN2);
%     delete(plotN2Mean);
%     close all
    
end


similarSampleMSE2 = similarSampleMSE2.';
similarSampleMSE2AverageSum = sum(similarSampleMSE2);
similarSampleMSE2Average = similarSampleMSE2AverageSum/32;


similarSampleMSE2StdDevSum = sum(similarSampleMSE2StdDev);
similarSampleMSE2StdDevFinal = similarSampleMSE2StdDevSum/32;

similarSampleMinMSE2 = min(similarSampleMSE2);
similarSampleMaxMSE2 = max(similarSampleMSE2);

%%  N = 3 - take only 3 simialr future samples
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

similarsArr = [];

% c = column, r = row
% matrix{c,r}

x = 1:18;

similarSampleMSE3 = [];
similarSampleMSE3StdDev = [];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:32
    sam = samples{i,1};
    sam = sam.';
    realFutureSam = samples{i,2};
    realFutureSam = realFutureSam.';
    sim = similars{i,1};
    sim2 = similars{i,2};
    sim3 = similars{i,3};
    futureSim = sim{1,3};
    futureSim = futureSim.';
    futureSim2 = sim2{1,3};
    futureSim2 = futureSim2.';
    futureSim3 = sim3{1,3};
    futureSim3 = futureSim3.';


    x = 1:18;
    
    matrix = [];
    matrix(1,1:12) = sam;
    matrix(1,13:18) = realFutureSam;
    matrix(2,1:12) = sam;
    matrix(2,13:18)= futureSim;
    matrix(3,1:12) = sam;
    matrix(3,13:18)= futureSim2;
    matrix(4,1:12) = sam;
    matrix(4,13:18)= futureSim3;
    
    futureArr3 = [futureSim; futureSim2; futureSim3];
    meanSim3 = mean(futureArr3);
       
    meanMatrix3 = [sam meanSim3];
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    similarSampleDiff3 = 0;
    similarSampleDiff3 = ((meanSim3 - realFutureSam).^2);
    
    N = 6;
    similarSampleSum3 = sum(similarSampleDiff3);
    similarSampleDividedSum3 = similarSampleSum3/(N-1);
    similarSampleMSE3i = sqrt(similarSampleDividedSum3);
    
    similarSampleMSE3 = [similarSampleMSE3 similarSampleMSE3i];
    
    similarSampleMSE3StdDevi = std(similarSampleMSE3);
    similarSampleMSE3StdDev = [similarSampleMSE3StdDev similarSampleMSE3StdDevi];
    
%     % plotting 
%     figN3 = figure(i);
%     
%     % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
%     
%     % plot all N future graph values
%     subplot(2,1,1);
%     plotN3 = plot(x*5, matrix(2:4,:), '-o', x*5, matrix(1,:), 'g-o');
%     
%     % grid config
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]);
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
%     title(sprintf('Estimacija buduæih vrijednosti pomoæu sliènosti N=%d', i));                            %Give the plot a title
%     
%     %legend
%     legend('Buduæe vrijednosti za k = 1','Buduæe vrijednosti za k = 2','Buduæe vrijednosti za k = 3','Stvarne vrijednosti', 'Location', 'bestoutside');
%     
%     subplot(2,1,2);
%     plotN3Mean = plot(x*5, meanMatrix3, 'b-o', x*5, matrix(1,:), 'g-o');
% 
%     % grid config
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]);
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
%     
%     %legend
%     legend('Srednja vrijednost - estimacija', 'Stvarne vrijednosti', 'Location', 'bestoutside');
%         
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % SAVE plot as fig and jpg in folder
%     saveas(figN3, fullfile('averageSimilarsN3',sprintf('averageSimilarsk=3N=%d', i))); 
%     saveas(figN3, fullfile('averageSimilarsN3',sprintf('averageSimilarsk=3N=%d', i)), 'jpg');
%     delete(plotN3);
%     delete(plotN3Mean);
%     close all
    

end
similarSampleMSE3 = similarSampleMSE3.';
similarSampleMSE3AverageSum = sum(similarSampleMSE3);
similarSampleMSE3Average = similarSampleMSE3AverageSum/32;


similarSampleMSE3StdDevSum = sum(similarSampleMSE3StdDev);
similarSampleMSE3StdDevFinal = similarSampleMSE3StdDevSum/32;

similarSampleMinMSE3 = min(similarSampleMSE3);
similarSampleMaxMSE3 = max(similarSampleMSE3);

%%  N = 5 - take only 5 simialr future samples

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

similarsArr = [];

% c = column, r = row
% matrix{c,r}

x = 1:18;

similarSampleMSE5 = [];
similarSampleMSE5StdDev = [];
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1: 32
    sam = samples{i,1};
    sam = sam.';
    realFutureSam = samples{i,2};
    realFutureSam = realFutureSam.';
    sim = similars{i,1};
    sim2 = similars{i,2};
    sim3 = similars{i,3};
    sim4 = similars{i,4};
    sim5 = similars{i,5};
    
    futureSim = sim{1,3};
    futureSim = futureSim.';
    futureSim2 = sim2{1,3};
    futureSim2 = futureSim2.';
    futureSim3 = sim3{1,3};
    futureSim3 = futureSim3.';
    futureSim4 = sim4{1,3};
    futureSim4 = futureSim4.';
    futureSim5 = sim5{1,3};
    futureSim5 = futureSim5.';


    x = 1:18;
    
    matrix = [];
    matrix(1,1:12) = sam;
    matrix(1,13:18) = realFutureSam;
    matrix(2,1:12) = sam;
    matrix(2,13:18)= futureSim;
    matrix(3,1:12) = sam;
    matrix(3,13:18)= futureSim2;
    matrix(4,1:12) = sam;
    matrix(4,13:18)= futureSim3;
    matrix(5,1:12) = sam;
    matrix(5,13:18)= futureSim4;
    matrix(6,1:12) = sam;
    matrix(6,13:18)= futureSim5;
     
    futureArr5 = [futureSim; futureSim2; futureSim3; futureSim4; futureSim5];
    meanSim5 = mean(futureArr5);
    
    meanMatrix5 = [sam meanSim5];
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    similarSampleDiff5 = 0;
    similarSampleDiff5 = ((meanSim5 - realFutureSam).^2);
    
    N = 6;
    similarSampleSum5 = sum(similarSampleDiff5);
    similarSampleDividedSum5 = similarSampleSum5/(N-1);
    similarSampleMSE5i = sqrt(similarSampleDividedSum5);
    
    similarSampleMSE5 = [similarSampleMSE5 similarSampleMSE5i];
    
    similarSampleMSE5StdDevi = std(similarSampleMSE5);
    similarSampleMSE5StdDev = [similarSampleMSE5StdDev similarSampleMSE5StdDevi];
    
    
    % plotting 
    figN5 = figure(i);
    
    % Enlarge figure to full screen.
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
    
    % plot all N future graph values
    subplot(2,1,1);
    plotN5 = plot(x*5, matrix(2:6,:), '-o', x*5, matrix(1,:), 'g-o');
    
    % grid config
    grid on;
    xticks(0:5:90);
    xlim([5 90]);
    
    % labels
    xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
    ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
    title(sprintf('Estimacija buduæih vrijednosti pomoæu sliènosti N=%d', i));                            %Give the plot a title
    
    %legend
    legend('Buduæe vrijednosti za k = 1','Buduæe vrijednosti za k = 2','Buduæe vrijednosti za k = 3', 'Buduæe vrijednosti za k = 4','Buduæe vrijednosti za k = 5','Stvarne vrijednosti', 'Location', 'bestoutside');
    
    subplot(2,1,2);
    plotN5Mean = plot(x*5, meanMatrix5, 'b-o', x*5, matrix(1,:), 'g-o');

    % grid config
    grid on;
    xticks(0:5:90);
    xlim([5 90]);
    
    % labels
    xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
    ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
    
    %legend
    legend('Srednja vrijednost - estimacija', 'Stvarne vrijednosti', 'Location', 'bestoutside');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % SAVE plot as fig and jpg in folder
    saveas(figN5, fullfile('averageSimilarsN5',sprintf('averageSimilarsk=5N=%d', i)));
    saveas(figN5, fullfile('averageSimilarsN5',sprintf('averageSimilarsk=5N=%d', i)), 'jpg');
    delete(plotN5);
    delete(plotN5Mean);
    close all
    

end

similarSampleMSE5 = similarSampleMSE5.';
similarSampleMSE5AverageSum = sum(similarSampleMSE5);
similarSampleMSE5Average = similarSampleMSE5AverageSum/32;


similarSampleMSE5StdDevSum = sum(similarSampleMSE5StdDev);
similarSampleMSE5StdDevFinal = similarSampleMSE5StdDevSum/32;

similarSampleMinMSE5 = min(similarSampleMSE5);
similarSampleMaxMSE5 = max(similarSampleMSE5);

%%  N = 10 - take only 10 simialr future samples

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

similarsArr = [];

% c = column, r = row
% matrix{c,r}

x = 1:18;

similarSampleMSE10 = [];
similarSampleMSE10StdDev = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:32
    sam = samples{i,1};
    sam = sam.';
    realFutureSam = samples{i,2};
    realFutureSam = realFutureSam.';
    
    sim = similars{i,1};
    sim2 = similars{i,2};
    sim3 = similars{i,3};
    sim4 = similars{i,4};
    sim5 = similars{i,5};
    sim6 = similars{i,6};
    sim7 = similars{i,7};
    sim8 = similars{i,8};
    sim9 = similars{i,9};
    sim10 = similars{i,10};
    
    futureSim = sim{1,3};
    futureSim = futureSim.';
    futureSim2 = sim2{1,3};
    futureSim2 = futureSim2.';
    futureSim3 = sim3{1,3};
    futureSim3 = futureSim3.';
    futureSim4 = sim4{1,3};
    futureSim4 = futureSim4.';
    futureSim5 = sim5{1,3};
    futureSim5 = futureSim5.';
    futureSim6 = sim6{1,3};
    futureSim6 = futureSim6.';
    futureSim7 = sim7{1,3};
    futureSim7 = futureSim7.';
    futureSim8 = sim8{1,3};
    futureSim8 = futureSim8.';
    futureSim9 = sim9{1,3};
    futureSim9 = futureSim9.';
    futureSim10 = sim10{1,3};
    futureSim10 = futureSim10.';

    x = 1:18;
    
    matrix = [];
    matrix(1,1:12) = sam;
    matrix(1,13:18) = realFutureSam;
    matrix(2,1:12) = sam;
    matrix(2,13:18)= futureSim;
    matrix(3,1:12) = sam;
    matrix(3,13:18)= futureSim2;
    matrix(4,1:12) = sam;
    matrix(4,13:18)= futureSim3;
    matrix(5,1:12) = sam;
    matrix(5,13:18)= futureSim4;
    matrix(6,1:12) = sam;
    matrix(6,13:18)= futureSim5;
    matrix(7,1:12) = sam;
    matrix(7,13:18)= futureSim6;
    matrix(8,1:12) = sam;
    matrix(8,13:18)= futureSim7;
    matrix(9,1:12) = sam;
    matrix(9,13:18)= futureSim8;
    matrix(10,1:12) = sam;
    matrix(10,13:18)= futureSim9;
    matrix(11,1:12) = sam;
    matrix(11,13:18)= futureSim10;
    
    futureArr10 = [futureSim; futureSim2; futureSim3; futureSim4; futureSim5; futureSim6; futureSim7; futureSim8; futureSim9; futureSim10];
    meanSim10 = mean(futureArr10);
    
    meanMatrix10 = [sam meanSim10];
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    similarSampleDiff10 = 0;
    similarSampleDiff10 = ((meanSim10 - realFutureSam).^2);
    
    N = 6;
    similarSampleSum10 = sum(similarSampleDiff10);
    similarSampleDividedSum10 = similarSampleSum10/(N-1);
    similarSampleMSE10i = sqrt(similarSampleDividedSum10);
    
    similarSampleMSE10 = [similarSampleMSE10 similarSampleMSE10i];
    
    similarSampleMSE10StdDevi = std(similarSampleMSE10);
    similarSampleMSE10StdDev = [similarSampleMSE10StdDev similarSampleMSE10StdDevi];
    
    
    
    % plotting 
    figN10 = figure(i);
    
     % Enlarge figure to full screen.
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
    
    % plot all N future graph values
    subplot(2,1,1);
    plotN10 = plot(x*5, matrix(2:11,:), '-o', x*5, matrix(1,:), 'g-o');
    
    % grid config
    grid on;
    xticks(0:5:90);
    xlim([5 90]);
    
    % labels
    xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
    ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
    title(sprintf('Estimacija buduæih vrijednosti pomoæu sliènosti N=%d', i));                            %Give the plot a title
    
    %legend
    legend('Buduæe vrijednosti za k = 1','Buduæe vrijednosti za k = 2','Buduæe vrijednosti za k = 3','Buduæe vrijednosti za k = 4','Buduæe vrijednosti za k = 5','Buduæe vrijednosti za k = 6','Buduæe vrijednosti za k = 7','Buduæe vrijednosti za k = 8','Buduæe vrijednosti za k = 9', 'Buduæe vrijednosti za k = 10','Stvarne vrijednosti', 'Location', 'bestoutside');
    
    subplot(2,1,2);
    plotN10Mean = plot(x*5, meanMatrix10, 'b-o', x*5, matrix(1,:), 'g-o');

    % grid config
    grid on;
    xticks(0:5:90);
    xlim([5 90]);
    
    % labels
    xlabel('Vrijeme trajanja mjerenja [min]');                                 %Label the horizontal axis
    ylabel('Vrijednosti glukoze [mg/dl]');                                     %Label the vertical axis
    
    %legend
    legend('Srednja vrijednost - estimacija', 'Stvarne vrijednosti', 'Location', 'bestoutside');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % SAVE plot as fig and jpg in folder
    saveas(figN10, fullfile('averageSimilarsN10',sprintf('averageSimilarsk=10N=%d', i)));
    saveas(figN10, fullfile('averageSimilarsN10',sprintf('averageSimilarsk=10N=%d', i)), 'jpg');
    delete(plotN10Mean);
    delete(plotN10);
    close all

end

similarSampleMSE10 = similarSampleMSE10.';
similarSampleMSE10AverageSum = sum(similarSampleMSE10);
similarSampleMSE10Average = similarSampleMSE10AverageSum/32;


similarSampleMSE10StdDevSum = sum(similarSampleMSE10StdDev);
similarSampleMSE10StdDevFinal = similarSampleMSE10StdDevSum/32;

similarSampleMinMSE10 = min(similarSampleMSE10);
similarSampleMaxMSE10 = max(similarSampleMSE10);