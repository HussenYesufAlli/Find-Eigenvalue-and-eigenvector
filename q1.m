n = 5; % Size of the matrix
A = zeros(n); % Initialize the matrix A
b = zeros(n, 1); % Initialize the vector b
x_exact = [2; -1; 2; -1; 2]; % Exact solution for comparison

% Fill the matrix A and vector b
for i = 1:n
    for j = 1:n
        A(i, j) = i*j + (-1)^(i+j);
    end
    b(i) = sum(A(i, :));
end

% Solve Ax = b using LU decomposition
[L, U, P] = lu(A);
y = L\(P*b);
x = U\y;

