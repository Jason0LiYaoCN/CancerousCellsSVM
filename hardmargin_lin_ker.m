%% Hard margin SVM with the linear kernel

% Compute the coefficients of the discriminant function
[alpha_hard_linear_kernel, b_hard_linear_kernel] = coeff_discriminant_function(train_data, train_label, 0, 1000000, 0.90);

% Evaluate the discriminant function for the training set
train_g = eval_discriminant_function(train_data, train_data, train_label,alpha_hard_linear_kernel, b_hard_linear_kernel,0);
% Accuracy
train_accuracy_hard_margin_linear = mean(sign(train_g) == train_label);

% Evaluate the discriminant function for the test set
test_g = eval_discriminant_function(test_data, train_data, train_label, alpha_hard_linear_kernel, b_hard_linear_kernel, 0);
% Accuracy
test_accuracy_hard_margin_linear = mean(sign(test_g) == test_label);