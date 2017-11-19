% hall=1, wall=2, open=3, close=4

map = [2; 1; 2; 4; 2; 3; 2; 4; 2; 1];

state_model = [[0.1 0 0];
    [0.7 0.1 0.05];
    [0.15 0.8 0.15];
    [0.05 0.1 0.7];
    [0 0 0.1]];

measurement_model = [[0.65 0.1 0.2 0.05];
    [0.05 0.45 0.1 0.2];
    [0.2 0.1 0.5 0.15];
    [0.05 0.3 0.15 0.55];
    [0.05 0.05 0.05 0.05]];

state = [1; 0; 0; 0; 0; 0; 0; 0; 0; 0];

state_history = zeros(10, 10);
state_history(:, 1) = state;

state_history(:, 2) = bayes_step(state_history(:, 1), 1, 1, map, state_model, measurement_model);
state_history(:, 3) = bayes_step(state_history(:, 2), 1, 2, map, state_model, measurement_model);
state_history(:, 4) = bayes_step(state_history(:, 3), 1, 2, map, state_model, measurement_model);
state_history(:, 5) = bayes_step(state_history(:, 4), 0, 4, map, state_model, measurement_model);
state_history(:, 6) = bayes_step(state_history(:, 5), 1, 2, map, state_model, measurement_model);
state_history(:, 7) = bayes_step(state_history(:, 6), 1, 2, map, state_model, measurement_model);
state_history(:, 8) = bayes_step(state_history(:, 7), 1, 3, map, state_model, measurement_model);
state_history(:, 9) = bayes_step(state_history(:, 8), 1, 2, map, state_model, measurement_model);
state_history(:, 10) = bayes_step(state_history(:, 9), 1, 4, map, state_model, measurement_model);

state_history
