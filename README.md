This repository contains code used for an assignment I completed as part of the MSc Data Analytics from UCD for the module "Bayesian Analysis". I received an A+ grade for this assignment.

In this assigment, I was tasked with fitting two Bayesian models to the Irish COVID-19 case data during the initial 3 months of the pandemic. I fit two Bayesian Poisson models to explain the number of daily COVID-19 cases in Ireland, one using the Logistic function and another using the Gompertz function, for the rate parameter lambda of the Possion models. I then assess the posterior predictive model fit of both models and use them to predict the number of cases in the next 5 days. I also compare the performance of each of the models using the "loo" package in R.   

I found that the Gompertz model fit the Irish COVID-19 data better than the Logistic model but noted that neither model fit the data extremely well due to the over-simplified nature of the model (one parameter model with no explanatory variables considered e.g. behavioural data, government imposed restrictions etc.). 

I also believe that the COVID-19 daily case data for Ireland is particularly noisy and thus makes it quite difficult to accurately model. There was a known anomaly in daily case data which began in April-2020 as a result of outsourced COVID-19 tests being sent back from a German laboratory in bulk and therefore artificially inflating the case numbers on the days when the results of these outsourced tests were recorded (and subsequently deflating the days where the patients actually tested positive for COVID-19). 

I believe if these anomalies were corrected for in the data, a better model fit could be achieved.
