function [K] = kernel(input_data, train_data, p)

%
% This function enables to compute Kernel of input dataset vectors with
% training dataset vectors
%   input_data : M * NN matrix, where M is the number of features and NN
%                the number of samples
%   train_data : M * N matrix, where M is the number of features and N the
%                number of samples
%   p : if p = 0, the linear kernel is used
%       if p > 0, the polynomial kernel with degree p is used
% Returns :
%   K : NN by N matrix of size N where K(i,j) = Kernel(xi(input) ,
%   xj(train))
%

% Define the number of samples in the input set
NN = length(input_data(1,:));
% Define the number of samples in the training set
N = length(train_data(1,:));
% Initialize the matrix K
K = zeros(NN, N);

for i = 1:NN
    for j = 1:N
        % For linear kernel
        if p == 0
            K(i,j) = input_data(:,i)' * train_data(:,j);
            
            % For polynomial kernel
        else
            K(i,j) = (input_data(:,i)'*train_data(:,j) + 1)^p;
        end
    end
    
end

end

