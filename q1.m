%##########################################################
%#####     Name: ALLI HUSSEN YESUF
%#####     Student ID: 722106020008
%##########################################################
n = 5; % Number of unknowns
A = zeros(n);
b = zeros(n, 1);

% Constructing matrix A and vector b
for i = 1:n
    for j = 1:n
        A(i, j) = 1 / (i + j - 1);
    end
    b(i) = sum(A(i, :));
end

% Solving Ax = b using the direct method (backslash operator)
x_direct = A \ b;

% Solving Ax = b using the iterative method (Jacobi or Gauss-Seidel)
x_iterative = ones(n, 1); % Initial guess for x
tolerance = 1e-6; % Tolerance for convergence
max_iterations = 1000; % Maximum number of iterations

% Iterative method (e.g., Jacobi)
for iteration = 1:max_iterations
    x_previous = x_iterative;
    for i = 1:n
        x_iterative(i) = (b(i) - sum(A(i, :) * x_previous) + A(i, i) * x_previous(i)) / A(i, i);
    end
    if norm(x_iterative - x_previous, 2) < tolerance
        break;
    end
end

% Computing b - Ax and x - x_direct
residual_direct = norm(b - A * x_direct, 2);
residual_iterative = norm(b - A * x_iterative, 2);
difference = norm(x_iterative - x_direct, 2);

% Displaying the results
disp("Direct method:");
disp("x:");
disp(x_direct');
disp("b - Ax (2-norm):");
disp(residual_direct);
disp("x - x_direct (2-norm):");
disp(difference);
disp("Iterative method:");
disp("x:");
disp(x_iterative');
disp("b - Ax (2-norm):");
disp(residual_iterative);
disp("x - x_direct (2-norm):");
disp(difference);
