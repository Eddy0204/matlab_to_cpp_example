function [C, t] = square_matrix(N)
    % Generate N x N matrix
    A = rand(N, N); % Fill with random floats [0,1]
    
    % Time the squaring operation
    tic;
    C = A .^ 2;      % Elementwise square
    t = toc;

    fprintf('MATLAB time for %d x %d: %.6f seconds\n', N, N, t);
end