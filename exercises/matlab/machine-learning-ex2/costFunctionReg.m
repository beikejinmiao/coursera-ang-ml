function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1:m
  s = sigmoid(X(i, :) * theta);
  J -= y(i)*log(s) + (1-y(i))*log(1-s);
endfor

# the first value in theta does not participate in regularization
reg_theta = theta;
reg_theta(1) = 0;
J = J/m + (reg_theta'*reg_theta)*lambda/2/m;
grad = [X' * (sigmoid(X * theta) - y) / m] + reg_theta*lambda/m;


% =============================================================

end
