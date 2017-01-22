clear all
close all 

%% Initialization of variables

% Load the training set
load('train.mat');
train_data = data;
train_label = label;

% Load the test set
load('test.mat');
test_data = data;
test_label = label;

clear data;
clear label;

% Normalize data between -1 and 1 
train_data = normalize(train_data);
test_data = normalize(test_data);
