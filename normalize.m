function [A] = normalize(A)

%
% This function enables to normalize a matrix :
%   A : matrix we want to normalize
%       N by M matrix where N is the number of samples and M the number of
%       features
% Returns :
%   A : normalized matrix with mean 0 and variance 1
%

% A becomes a M by N matrix (samples x features)
A = A';

mean_vector = mean(A);
A = bsxfun(@minus, A, mean_vector);
A = bsxfun(@rdivide, A, std(A));

A = A';
end

