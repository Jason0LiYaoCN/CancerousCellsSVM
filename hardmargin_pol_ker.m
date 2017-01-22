%% Hard margin SVM with a polynomial kernel

% Vector with values of p
p_values = [2 3 4 5];

% Error rate values
train_acc_hard_margin_pol = zeros(length(p_values), 1);
test_acc_hard_margin_pol = zeros(length(p_values), 1);

% Make the calculations for every p
for i = 1:length(p_values)
    % Compute the coefficients of the discriminant function
    [alpha, b] = coeff_discriminant_function(train_data, train_label, p_values(i), 10^6, 0.9);
    
    % Evaluate the discriminant function for each training sample
    train_g = eval_discriminant_function(train_data, train_data, train_label, alpha, b, p_values(i)); 
    % Error rate
    train_acc_hard_margin_pol(i) = mean(sign(train_g) == train_label);
    
    % Evaluate the discriminant function for each test sample
    test_g = eval_discriminant_function(test_data, train_data, train_label, alpha, b, p_values(i));
    
    % Error rate
    test_acc_hard_margin_pol(i) = mean(sign(test_g) == test_label);
end

% Plot the error rate against value of p
plot(p_values, train_acc_hard_margin_pol, 'r*', 'linewidth', 5)
hold on
plot(p_values, test_acc_hard_margin_pol, 'b+', 'linewidth', 5)
title('Accuracy of SVM with hard margin and polynomial kernel')
xlabel('value of p')
ylabel('accuracy')
axis([2 5 min(min(train_acc_hard_margin_pol), min(test_acc_hard_margin_pol) )-0.1 1])
legend('Training set', 'Test set')
