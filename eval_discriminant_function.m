function [g] = eval_discriminant_function(input_data, train_data, train_label, alpha, b0, p)

%
% This function enables to evaluate the discriminant function g(.) for each sample of a dataset :
%   input_data : M * NN matrix, where M is the number of features and NN
%                the number of samples
%   train_data : M * N matrix, where M is the number of features and N the
%                number of samples
%   train_label : N * 1 vector, which contains the label of the training
%   set
%   alpha & b0 : coefficients used to calculate the discriminant function,
%   found with "coeff_discriminant_function"
%   p : if p = 0, the linear kernel is used
%       if p > 0, the polynomial kernel with degree p is used
% Returns :
%   g : vector which contains the values of the discriminant function
%

% Define the number of samples in the input set
NN = length(input_data(1,:));
% Define the number of samples in the training set
N = length(train_data(1,:));

% Compute the Kernel matrix
K = kernel(input_data, train_data, p);


% Calculate g
g = sum(bsxfun(@times, K, (alpha .* train_label)') , 2) + b0 * ones(NN, 1);

end

