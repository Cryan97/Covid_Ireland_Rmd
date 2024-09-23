 
data {
  int<lower=1> T; // total number of days we have data for
  int<lower=0> days[T]; // vector of days 1-T
  int<lower=0> cases[T]; // vector containing number of cases each day
}
parameters {
  real<lower=0> theta_1;
  real<lower=0,upper=100> theta_2;
  real<lower=0,upper=1> theta_3;
}
transformed parameters{
  vector[T] lambda; 
    for (t in 1:T){
      lambda[t] = (-theta_1*theta_2*(theta_3^t)*(log(theta_3))*(exp(-theta_2*(theta_3^t))));
    }
}
model {
  target += normal_lpdf(theta_1 | 1000, 100000);
  target += normal_lpdf(theta_2 | 50, 100);
  target += poisson_lpmf(cases | lambda);
}
generated quantities {
  vector[T] log_lik;
  vector[T] cases_rep;
  vector[5] cases_pred;
  for (n in 1:T){
    log_lik[n] = poisson_lpmf(cases[n] | lambda[n]); //log-likelihood values
    cases_rep[n] = poisson_rng(lambda[n]); //predicted cases
  }
  for (i in 1:5){
    cases_pred[i] = poisson_rng(-theta_1*theta_2*(theta_3^(T+i))*(log(theta_3))*(exp(-theta_2*(theta_3^(T+i)))));
  }
}