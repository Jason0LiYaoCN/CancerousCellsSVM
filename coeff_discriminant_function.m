function [alpha, b0] = coeff_discriminant_function(data, label, p, C, threshold)

%
% This function enables to compute the discriminant function g(.) for
% different SVMs
%   data : M * N matrix, where M is the number of features and N the
%                number of samples
%   label : N * 1 vector, which contains the labels
%   p : if p = 0, the linear kernel is used
%       if p > 0, the polynomial kernel with degree p is used
%   C : if C very high (10^6), the SVM type is hard margin
%       if C lower, the SVM type is soft margin
%   threshold : value between 0 and 1 to define the support vectors chosen
% Returns :
%   alpha : alpha values given by the optimisation problem
%   b0 : value of b0
% These two values enable to compute the discriminant function
% with the function eval_discriminant_function
%


%% Initialization

% Define the number of samples
N = length(data(1,:));
% Define the number of features;
M = length(data(:,1));


%% Solving the optimisation problem

% Compute the Kernel matrix
K = kernel(data, data, p);

% Initialize the matrix H
H = zeros(N,N);
for i = 1:N
    for j = 1:N
        H(i,j) = label(i) * label(j) * K(i,j);
    end
end

% Define the vector f
f = - 1 * ones(1,N);

% Define Aeq and Beq
Aeq = label';
Beq = 0;

% Define the lower and upper bound for alpha
lb = zeros(1,N);
ub = C * ones(1,N);

% Solve the quadratic optimisation problem
alpha0 = [];
options = optimset('LargeScale','off','MaxIter',1000);
[alpha,fval,exitflag] = quadprog(H,f,[],[], Aeq,Beq,lb,ub,alpha0,options);

%% Determine b0

% Choice of the threshold to determine the support vectors
support_vector_idx = find(alpha > threshold * max(alpha));
%support_vector_idx = get_support_vector_k_means(alpha);

% Soft margin
if C < 10^6
    b = zeros(length(support_vector_idx),1);
    for i = 1:length(b)
        % Current support vector
        support_vector = data(:,support_vector_idx(i));
        % Kernel vector Kxs
        b(i) = label(support_vector_idx(i)) - (alpha.*label)' * K(support_vector_idx(i),:)';
    end
    
    b0 = mean(b);
    
% Hard margin : we take the maximum value for alpha
else   
    % We choose the maximum value of alpha, and the corresponding vector is
    % chosen as a support vector
    [max_alpha, max_sv_idx] = max(alpha);
    
    % Calculate b0
    b0 = label(max_sv_idx) - (alpha.*label)' * K(max_sv_idx,:)';   
end


end


