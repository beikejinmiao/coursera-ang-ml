function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    # calculate the separate row error by iterate the dataset 
    %{
    diff = zeros(1, size(X, 2));
    for i=1:m
        diff += (X(i, :)*theta - y(i))*X(i, :);
    endfor
    theta -= (diff*alpha/m)';
    %}
    
    # calculate the errors based on matrix
    h = X * theta;  % hypothesis   
    errors = h - y;
    delta = alpha / m * (X' * errors);
    theta -= delta;
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
