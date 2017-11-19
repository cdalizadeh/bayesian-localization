function state_update = bayes_step(state, u_k, z_kplus, map, state_model, measurement_model)

m = size(state, 1);

state_model_control = state_model(:, u_k + 2);

state_prediction = zeros(m, 1);
for i = 1:m
    control = [zeros(max(i-3, 0), 1);
        state_model_control(max(1, 4 - i):min(5, m - i + 3));
        zeros(max(m-i-2, 0), 1)];
    state_prediction = state_prediction + state(i) * control;
end

state_update = zeros(m, 1);
for i = 1:m
    state_update(i) = measurement_model(z_kplus, map(i)) .* state_prediction(i);
end
state_update = state_update / sum(state_update);


end