clear all;
clc;
close all;

% load .mat file-ova
samplesOriginal = load('samples.mat');
similarsSortedOriginal = load('similarsSorted.mat');

% izvlacenje polja iz celija
samples = samplesOriginal.samples;
similars = similarsSortedOriginal.similars;

%% 1. dio zadatka
% % simple average
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

numOfSamples = 1:18;                    % Sample Indices Vector
timeBase = numOfSamples*5;              % Time Vector (minutes)

%initialization of empty array/matrix
simpleAverageMatrix=[];

simpleAverageMSE = [];
simpleAverageMSEStdDev = [];
% loop through all 32 samples
for i=1:32
    
    simpleAverageColumn = samples{i};
    
    realSamplesData = samples{i};
    realSamplesData = realSamplesData.';
    
    realFutureSampl = samples {i,2};
    realFutureSamples = realFutureSampl.';
    
    realFutureSamples = [realSamplesData realFutureSamples];
    
    % loop 6 times through samples to calculate average/future values of
    % next 6 samples and save that to one matrix
   for j= 1:6 
        currentAvg = mean(simpleAverageColumn);
        simpleAverageColumn = [simpleAverageColumn; currentAvg]; 
   end 
  
    simpleAverageMatrix =[simpleAverageMatrix simpleAverageColumn]; 
    finalMatrixCol = simpleAverageMatrix(:, i);
  
 % mean square error (MSE) - output is array with 18 values, MSE of every
    % sample in iteration
    simpleAverageDiff = 0;
    simpleAverageDiff = ((finalMatrixCol.' - realFutureSamples).^2);
    
    N = 6;
    simpleAverageSum = sum(simpleAverageDiff);
    simpleAverageDividedSum = simpleAverageSum/(N-1);
    simpleAverageMSEi = sqrt(simpleAverageDividedSum);
    
    simpleAverageMSE = [simpleAverageMSE simpleAverageMSEi];
    
    simpleAverageMSEStdDevi = std(simpleAverageMSE);
    simpleAverageMSEStdDev = [simpleAverageMSEStdDev simpleAverageMSEStdDevi];

    %plotting calculated future values and real future values
    simpleAverageFigure = figure(i);
    simpleAveragePlot = plot(timeBase, finalMatrixCol, '-o', timeBase, realFutureSamples, '-o');

    
    % labels
    xlabel('Vrijeme trajanja mjerenja [min]');                             %Label the horizontal axis
    ylabel('Vrijednosti glukoze [mg/dl]');                                 %Label the vertical axis
    title(sprintf('Estimiranje buduæih vrijednosti pomoæu srednje vrijednosti N=%d', i));       %Give the plot a title
    
    % grid configuration
    grid on;
    xticks(0:5:90);
    xlim([5 90]); 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
    % SAVE plot as fig and jpg in folder
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    saveas(simpleAverageFigure, fullfile('average',sprintf('simpleAverageN=%d', i)));
    saveas(simpleAverageFigure, fullfile('average',sprintf('simpleAverageN=%d', i)), 'jpg');
    
    delete(simpleAveragePlot);
    close all  
end

simpleAverageMSE = simpleAverageMSE.';
simpleAverageMSEAverageSum = sum(simpleAverageMSE);
simpleAverageMSEAverage = simpleAverageMSEAverageSum/32;


simpleAverageMSEStdDevSum = sum(simpleAverageMSEStdDev);
simpleAverageMSEStdDevFinal = simpleAverageMSEStdDevSum/32;

simpleAverageMinMSE = min(simpleAverageMSE);
simpleAverageMaxMSE = max(simpleAverageMSE);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% all values plotted on one graph
allSimpleAverageFigure = figure;
simpleAveragePlot = plot(timeBase, simpleAverageMatrix);

% labels
xlabel('Vrijeme trajanja mjerenja [min]');                                          %Label the horizontal axis
ylabel('Vrijednosti glukoze [mg/dl]');                                              %Label the vertical axis
title(sprintf('Estimiranje buduæih vrijednosti pomoæu srednje vrijednosti'));       %Give the plot a title

% grid configuration
grid on;
xticks(0:5:90);
xlim([5 90]);
% vertical line on 60 min mark ( after that are future values
v=0; 
for (v= 60),line([v v],ylim,'linestyle','-','color','black');end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
% SAVE plot as fig and jpg in folder
saveas(allSimpleAverageFigure, fullfile('average/simpleAveragePlotAll',sprintf('allSimpleAverage')));
saveas(allSimpleAverageFigure, fullfile('average/simpleAveragePlotAll',sprintf('allSimpleAverage')), 'jpg');

delete(allSimpleAverageFigure);
close all  
