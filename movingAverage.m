%% 2. dio zadatka
% moving average
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 clear all;
clc;
close all;

% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

% initialization of MSE array
movingAverageMSE = [];
movingAverageMSEStdDev = [];
 
for i = 1
    
    numOfSamples = 1:18;                    % Sample Indices Vector
    timeBase = numOfSamples*5;              % Time Vector (minutes)

    movAvgSamples = samples{i};             % 12 samples from original data
    movAvgSamples = movAvgSamples.';
    movAvgFutureSamples = samples{i,2};         % 6 real future samples from original data
    movAvgFutureSamples = movAvgFutureSamples.';

    %all 18 samples (12 original and 6 future) 
    allSamples = [movAvgSamples movAvgFutureSamples];

    % create moving average
    movingAverageArr = movmean(allSamples, 3);
    movAvgFutureArr = movingAverageArr(13:18);
%     movingAverageArr = movingAverageArr.';
    
%     %filter moving average verzija 2.
%     
%     windowSize = 3; 
%     b = (1/windowSize)*ones(1,windowSize);
%     a = 1;
%          
%     y = filter(b,a,allSamples);
% 
%     plot(timeBase,allSamples)
%     hold on
%     plot(timeBase,y)
%     legend('Input Data','Filtered Data')
    
    
    
    % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    
    movingAverageDiff = 0;
    movingAverageDiff = ((movAvgFutureArr - movAvgFutureSamples).^2);
    
    N = 6;
    movingAverageSum = sum(movingAverageDiff);
    movingAverageDividedSum = movingAverageSum/(N-1);
    movingAverageMSEi = sqrt(movingAverageDividedSum);
    
    movingAverageMSE = [movingAverageMSE movingAverageMSEi];
    
    movingAverageMSEStdDevi = std(movingAverageMSE);
    movingAverageMSEStdDev = [movingAverageMSEStdDev movingAverageMSEStdDevi];
    
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % PLOTTING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%     movAvgFig = figure;
%     
%      % Enlarge figure to full screen.
%     set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0,0.5, 0.8]);
%     
%     movAvgPlot = plot(timeBase, movingAverageArr,'b-o', timeBase, allSamples, 'g-o');
% 
%     % grid configuration
%     grid on;
%     xticks(0:5:90);
%     xlim([5 90]); 
%     
%     % labels
%     xlabel('Vrijeme trajanja mjerenja [min]');                             %Label the horizontal axis
%     ylabel('Vrijednosti glukoze [mg/dl]');                                 %Label the vertical axis
%     title(sprintf('Estimacija buduæih vrijednosti pomoæu pokretne sredine N=%d', i));                         %Give the plot a title
%     legend('Pokretna sredina', 'Stvarne vrijednosti', 'Location', 'bestoutside');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     % SAVE plot as fig and jpg in folder
%     saveas(movAvgFig, fullfile('movingAverage',sprintf('Moving average N=%d', i)));
%     saveas(movAvgFig, fullfile('movingAverage',sprintf('Moving average N=%d', i)), 'jpg');
%     
%     delete(movAvgPlot);
%     close all
end

movingAverageMSE = movingAverageMSE.';
movingAverageMSEAverageSum = sum(movingAverageMSE);
movingAverageMSEAverage = movingAverageMSEAverageSum/32;


movingAverageMSEStdDevSum = sum(movingAverageMSEStdDev);
movingAverageMSEStdDevFinal = movingAverageMSEStdDevSum/32;

movingAverageMinMSE = min(movingAverageMSE);
movingAverageMaxMSE = max(movingAverageMSE);

