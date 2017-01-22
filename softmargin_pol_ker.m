% Soft margin SVM with a polynomial kernel

% Vector with values of p
p_values = [2 3 4 5];

% Vector with values of C
C_values = [0.1 0.6 1.1 2.1];

% Error rate values
train_acc_soft_margin_pol = zeros(length(p_values), length(C_values));
test_acc_soft_margin_pol = zeros(length(p_values), length(C_values));

% Make the calculations for every p
for i = 1:length(p_values)
    for l = 1:length(C_values)
        % Compute the coefficients of the discriminant function
        [alpha, b] = coeff_discriminant_function(train_data, train_label, p_values(i), C_values(l), 0.9);
        
        % Evaluate the discriminant function for each training sample
        train_g = eval_discriminant_function(train_data, train_data, train_label, alpha, b,p_values(i));
        % Error rate
        train_acc_soft_margin_pol(i,l) = mean(sign(train_g) == train_label);
        
        % Evaluate the discriminant function for each test sample
        test_g = eval_discriminant_function(test_data, train_data, train_label, alpha, b,p_values(i));
        % Error rate
        test_acc_soft_margin_pol(i,l) = mean(sign(test_g) == test_label);
    end
end


%% Plot the results
figure
colormap spring
surf(p_values, C_values, train_acc_soft_margin_pol')
hold on
surf(p_values, C_values, test_acc_soft_margin_pol')
xlabel('p')
ylabel('C')
zlabel('accuracy')
title('SVM accuracy with soft margin and polynomial kernel, against p and C values')
legend('Training set', 'Test set')

