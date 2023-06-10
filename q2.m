
% Define the matrix B
n = 4;
B = rand(n);

% Set the initial vector
u = ones(n, 1);

% Set the stopping criterion parameters
max_iterations = 10;
tolerance = 1e-6;

% Power method iterations
for k = 1:max_iterations
    v = B * u;  % Calculate the product B * u
    [~, index] = max(abs(v));  % Find the index of the maximum element in v
    max_element = v(index);
    v_normalized = v / max_element;  % Normalize v
    
    % Check stopping criterion
    if norm(u - v_normalized) < tolerance
        break;
    end
    
    u = v_normalized;  % Update u for the next iteration
end

% Compute the eigenvalue
lambda = max_element;

% Normalize the eigenvector
eigenvector = u / norm(u);

% Output the results
iteration_number = k;
disp('Iteration number:');
disp(iteration_number);

disp('Eigenvalue:');
disp(lambda);

disp('Eigenvector:');
disp(eigenvector);

