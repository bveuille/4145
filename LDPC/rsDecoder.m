function [ decoded, error_pos, error_mag, g, S ] = rsDecoder( encoded, m, prim_poly, n, k )
%RSDECODER Decode a reed-solomon encoded message
%   Example:
% [dec, ~, ~, ~, ~] = rsDecoder(enc_msg, 8, 301, 12, numel(msg))
max_errors = floor((n-k)/2);
orig_vals = encoded.x;
% Initialize the error vector
errors = zeros(1, n);
g = [];
S = [];

% Get the alpha
alpha = gf(2, m, prim_poly);

% Find the syndromes (Check if dividing the message by the generator
% polynomial the result is zero)
Synd = polyval(encoded, alpha .^ (1:n-k));
Syndromes = trim(Synd);

% If all syndromes are zeros (perfectly divisible) there are no errors
if isempty(Syndromes.x)
    decoded = orig_vals(1:k);
    error_pos = [];
    error_mag = [];
    g = [];
    S = Synd;
    return;
end

% Prepare for the euclidean algorithm (Used to find the error locating
% polynomials)
r0 = [1, zeros(1, 2*max_errors)]; r0 = gf(r0, m, prim_poly); r0 = trim(r0);
size_r0 = length(r0);
r1 = Syndromes;
f0 = gf([zeros(1, size_r0-1) 1], m, prim_poly);
f1 = gf(zeros(1, size_r0), m, prim_poly);
g0 = f1; g1 = f0;

% Do the euclidian algorithm on the polynomials r0(x) and Syndromes(x) in
% order to find the error locating polynomial
while true
    % Do a long division
    [quotient, remainder] = deconv(r0, r1);    
    % Add some zeros
    quotient = pad(quotient, length(g1));
    
    % Find quotient*g1 and pad
    c = conv(quotient, g1);
    c = trim(c);
    c = pad(c, length(g0));
    
    % Update g as g0-quotient*g1
    g = g0 - c;
    
    % Check if the degree of remainder(x) is less than max_errors
    if all(remainder(1:end - max_errors) == 0)
        break;
    end
    
    % Update r0, r1, g0, g1 and remove leading zeros
    r0 = trim(r1); r1 = trim(remainder);
    g0 = g1; g1 = g;
end

% Remove leading zeros
g = trim(g);

% Find the zeros of the error polynomial on this galois field
evalPoly = polyval(g, alpha .^ (n-1 : -1 : 0));
error_pos = gf(find(evalPoly == 0), m);

% If no error position is found we return the received work, because
% basically is nothing that we could do and we return the received message
if isempty(error_pos)
    decoded = orig_vals(1:k);
    error_mag = [];
    return;
end

% Prepare a linear system to solve the error polynomial and find the error
% magnitudes
size_error = length(error_pos);
Syndrome_Vals = Syndromes.x;
b(:, 1) = Syndrome_Vals(1:size_error);
for idx = 1 : size_error
    e = alpha .^ (idx*(n-error_pos.x));
    err = e.x;
    er(idx, :) = err;
end

% Solve the linear system
error_mag = (gf(er, m, prim_poly) \ gf(b, m, prim_poly))';
% Put the error magnitude on the error vector
errors(error_pos.x) = error_mag.x;
% Bring this vector to the galois field
errors_gf = gf(errors, m, prim_poly);

% Now to fix the errors just add with the encoded code
decoded_gf = encoded(1:k) + errors_gf(1:k);
decoded = decoded_gf.x;

end

% Remove leading zeros from galois array
function gt = trim(g)
gx = g.x;
gt = gf(gx(find(gx, 1) : end), g.m, g.prim_poly);
end

% Add leading zeros
function xpad = pad(x,k)
len = length(x);
if (len<k)
    xpad = [zeros(1, k-len) x];
end
end