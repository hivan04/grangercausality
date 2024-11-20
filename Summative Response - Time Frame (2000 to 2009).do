/*Misc.*/
//2000 to 2009 (GFC) - large shootup in house prices
twoway (tsline lndon lnshef in 61/169)

/*Informal Stationarity test*/
reg lndon lnshef in 61/169 //lnshef = 1.150 ~ 1 (suggesting variable is non-stationary)
reg lnshef lndon in 61/169 //lndon = 0.864 ~ 1 (suggesting variable is non-stationary)

/*Testing for Stationarity - Doncaster*/
twoway (tsline lndon in 61/169) //time series suggests that it should include a deterministic trend

di 12*((169-61)/100)^0.25 //Maximum lags ~ 13

dfuller lndon in 61/169, trend regress lags(13)
dfuller lndon in 61/169, trend regress lags(12)
dfuller lndon in 61/169, trend regress lags(11)
dfuller lndon in 61/169, trend regress lags(10)
dfuller lndon in 61/169, trend regress lags(9)
dfuller lndon in 61/169, trend regress lags(8)
dfuller lndon in 61/169, trend regress lags(7)
dfuller lndon in 61/169, trend regress lags(6)
dfuller lndon in 61/169, trend regress lags(5)
dfuller lndon in 61/169, trend regress lags(4)
dfuller lndon in 61/169, trend regress lags(3)
dfuller lndon in 61/169, trend regress lags(2)
dfuller lndon in 61/169, trend regress lags(1)
//When including the trend, we see that both lags and trend are insignificant when performing the sequential t-test at the 1% SL.

dfuller lndon in 61/169, regress lags(13)
dfuller lndon in 61/169, regress lags(12)
dfuller lndon in 61/169, regress lags(11)
dfuller lndon in 61/169, regress lags(10)
dfuller lndon in 61/169, regress lags(9)
dfuller lndon in 61/169, regress lags(8)
dfuller lndon in 61/169, regress lags(7)
dfuller lndon in 61/169, regress lags(6)
dfuller lndon in 61/169, regress lags(5)
dfuller lndon in 61/169, regress lags(4)
dfuller lndon in 61/169, regress lags(3)
dfuller lndon in 61/169, regress lags(2)
dfuller lndon in 61/169, regress lags(1)
//Even without the trend, we see that our variable is NON-stationary in levels form

twoway (tsline D.lndon in 61/169)
dfuller d.lndon in 61/169, regress lags(13)
dfuller d.lndon in 61/169, regress lags(12)
dfuller d.lndon in 61/169, regress lags(11)
dfuller d.lndon in 61/169, regress lags(10)
dfuller d.lndon in 61/169, regress lags(9)
dfuller d.lndon in 61/169, regress lags(8)
dfuller d.lndon in 61/169, regress lags(7)
dfuller d.lndon in 61/169, regress lags(6)
dfuller d.lndon in 61/169, regress lags(5)
dfuller d.lndon in 61/169, regress lags(4)
dfuller d.lndon in 61/169, regress lags(3)
dfuller d.lndon in 61/169, regress lags(2) 
//Therefore, we can see that when we include the constant term, our variable is stationry in first difference form at the 1% alpha, i.e. it has an order of integration: lndon~I(1) with the constant term being signficant at the 5%


/*Testing for Stationarity - Sheffield*/
twoway (tsline lnshef in 61/169) //time series suggests that it should include a deterministic trend

dfuller lnshef in 61/169, trend regress lags(13)
dfuller lnshef in 61/169, trend regress lags(12)
dfuller lnshef in 61/169, trend regress lags(11)
dfuller lnshef in 61/169, trend regress lags(10)
dfuller lnshef in 61/169, trend regress lags(9)
dfuller lnshef in 61/169, trend regress lags(8)
dfuller lnshef in 61/169, trend regress lags(7)
dfuller lnshef in 61/169, trend regress lags(6)
dfuller lnshef in 61/169, trend regress lags(5)
dfuller lnshef in 61/169, trend regress lags(4)
dfuller lnshef in 61/169, trend regress lags(3)
dfuller lnshef in 61/169, trend regress lags(2)
dfuller lnshef in 61/169, trend regress lags(1)
//When including the trend, we see that both lags and trend are insignificant when performing the sequential t-test at the 1% SL.

dfuller lnshef in 61/169, regress lags(13)
dfuller lnshef in 61/169, regress lags(12)
dfuller lnshef in 61/169, regress lags(11)
dfuller lnshef in 61/169, regress lags(10)
dfuller lnshef in 61/169, regress lags(9)
dfuller lnshef in 61/169, regress lags(8)
dfuller lnshef in 61/169, regress lags(7)
dfuller lnshef in 61/169, regress lags(6)
dfuller lnshef in 61/169, regress lags(5)
dfuller lnshef in 61/169, regress lags(4)
dfuller lnshef in 61/169, regress lags(3)
dfuller lnshef in 61/169, regress lags(2)
dfuller lnshef in 61/169, regress lags(1)
//Even without the trend, we see that our variable is non-stationary in levels form

twoway (tsline d.lnshef in 61/169)
dfuller d.lnshef in 61/169, regress lags(13)
dfuller d.lnshef in 61/169, regress lags(12)
dfuller d.lnshef in 61/169, regress lags(11)
dfuller d.lnshef in 61/169, regress lags(10)
dfuller d.lnshef in 61/169, regress lags(9)
dfuller d.lnshef in 61/169, regress lags(8)
dfuller d.lnshef in 61/169, regress lags(7)
dfuller d.lnshef in 61/169, regress lags(6)
dfuller d.lnshef in 61/169, regress lags(5)
dfuller d.lnshef in 61/169, regress lags(4)
dfuller d.lnshef in 61/169, regress lags(3)
dfuller d.lnshef in 61/169, regress lags(2)
//Therefore, we can see that (with a constant term), our variable is stationry in first difference form at the 1% alpha, i.e. it has an order of integration: lndon~I(1)


/*Cointegraiton test: since they have the same order of integraiton, we can proceed with the Engle Granger test to test whether the variables are cointegrated or spurious*/

/*Informal test*/
reg lndon lnshef in 61/169
*R-Squared = 0.9937
*DW d-statistic = 0.1847... < R-Squared, suggesting a spurious regression

findit egranger
egranger lndon lnshef in 61/169, lags(13) regress
egranger lndon lnshef in 61/169, lags(12) regress
egranger lndon lnshef in 61/169, lags(11) regress
egranger lndon lnshef in 61/169, lags(10) regress
egranger lndon lnshef in 61/169, lags(9) regress
egranger lndon lnshef in 61/169, lags(8) regress
egranger lndon lnshef in 61/169, lags(7) regress
egranger lndon lnshef in 61/169, lags(6) regress
egranger lndon lnshef in 61/169, lags(5) regress
egranger lndon lnshef in 61/169, lags(4) regress
egranger lndon lnshef in 61/169, lags(3) regress
egranger lndon lnshef in 61/169, lags(2) regress //Can reject at the 5% alpha, hence, we can create an Error Correction Model (ECM)
egranger lndon lnshef in 61/169, lags(1) regress
//At the 1% alpha, the results suggest that there is a spurious regression. Therefore, we move onto the Granger Causality Test

/*Error Correction Model (from 5% alpha from coint test)*/
*Start by creating residuals
reg lndon lnshef in 61/169
predict resa in 61/169, residuals 
reg d.lndon d.lnshef d.l(1/13).lndon d.l(1/13).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/12).lndon d.l(1/12).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/11).lndon d.l(1/11).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/10).lndon d.l(1/10).lnshef l.resa in 61/169 // we can reject lnshef at the 1% alpha, residual value of -0.0849583
reg d.lndon d.lnshef d.l(1/9).lndon d.l(1/9).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/8).lndon d.l(1/8).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/7).lndon d.l(1/7).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/6).lndon d.l(1/6).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/5).lndon d.l(1/5).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/4).lndon d.l(1/4).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/3).lndon d.l(1/3).lnshef l.resa in 61/169 // we can reject both at 5% alpha, residual value of -0.0710773
reg d.lndon d.lnshef d.l(1/2).lndon d.l(1/2).lnshef l.resa in 61/169
reg d.lndon d.lnshef d.l(1/1).lndon d.l(1/1).lnshef l.resa in 61/169

/*Granger Causality Test - with 5% alpha from cointegration test [ECM]*/
*HERE, since we found that they were cointegrated, the variables must at least have uni-directional GC
//[Y = lndon, X = lnshef]
/*Does X (Granger) cause Y?*/
reg d.l(1/13).lndon d.l(1/13).lnshef l.resa in 61/169
reg d.l(1/12).lndon d.l(1/12).lnshef l.resa in 61/169
reg d.l(1/11).lndon d.l(1/11).lnshef l.resa in 61/169
reg d.l(1/10).lndon d.l(1/10).lnshef l.resa in 61/169
reg d.l(1/9).lndon d.l(1/9).lnshef l.resa in 61/169
reg d.l(1/8).lndon d.l(1/8).lnshef l.resa in 61/169
reg d.l(1/7).lndon d.l(1/7).lnshef l.resa in 61/169
reg d.l(1/6).lndon d.l(1/6).lnshef l.resa in 61/169
reg d.l(1/5).lndon d.l(1/5).lnshef l.resa in 61/169
reg d.l(1/4).lndon d.l(1/4).lnshef l.resa in 61/169 //significant at the 1% 

testparm d.l(1/4).lnshef l.resa //Running the F-test, the p-value < 0.01, therefore, suggesting that X (Granger) cause Y

/*Does Y (Granger) cause X?*/
reg d.l(1/13).lnshef d.l(1/13).lndon l.resa in 61/169
reg d.l(1/12).lnshef d.l(1/12).lndon l.resa in 61/169
reg d.l(1/11).lnshef d.l(1/11).lndon l.resa in 61/169
reg d.l(1/10).lnshef d.l(1/10).lndon l.resa in 61/169
reg d.l(1/9).lnshef d.l(1/9).lndon l.resa in 61/169
reg d.l(1/8).lnshef d.l(1/8).lndon l.resa in 61/169
reg d.l(1/7).lnshef d.l(1/7).lndon l.resa in 61/169
reg d.l(1/6).lnshef d.l(1/6).lndon l.resa in 61/169
reg d.l(1/5).lnshef d.l(1/5).lndon l.resa in 61/169
reg d.l(1/4).lnshef d.l(1/4).lndon l.resa in 61/169 //significant at the 1% 

testparm d.l(1/4).lndon l.resa //Running the F-test, the p-value < 0.01, therefore, suggesting that Y (Granger) cause X

//We identify that going down the 5% route [ECM], that there is a bi-directional relationship between house prices in Doncaster and Sheffield between 2000 - 2009



/*Granger Causality Test - with 1% alpha from cointegration test - we find a spurious regression*/
//[Y = lndon, X = lnshef]
/*Does X (Granger) cause Y?*/
reg d.l(1/13).lndon d.l(1/13).lnshef in 61/169
reg d.l(1/12).lndon d.l(1/12).lnshef in 61/169
reg d.l(1/11).lndon d.l(1/11).lnshef in 61/169
reg d.l(1/10).lndon d.l(1/10).lnshef in 61/169
reg d.l(1/9).lndon d.l(1/9).lnshef in 61/169
reg d.l(1/8).lndon d.l(1/8).lnshef in 61/169
reg d.l(1/7).lndon d.l(1/7).lnshef in 61/169
reg d.l(1/6).lndon d.l(1/6).lnshef in 61/169
reg d.l(1/5).lndon d.l(1/5).lnshef in 61/169
reg d.l(1/4).lndon d.l(1/4).lnshef in 61/169

testparm d.l(1/4).lnshef //Running the F-test, the p-value < 0.01, therefore, suggesting that X (Granger) cause Y

/*Does Y (Granger) cause X?*/
reg d.l(1/13).lnshef d.l(1/13).lndon in 61/169
reg d.l(1/12).lnshef d.l(1/12).lndon in 61/169
reg d.l(1/11).lnshef d.l(1/11).lndon in 61/169
reg d.l(1/10).lnshef d.l(1/10).lndon in 61/169
reg d.l(1/9).lnshef d.l(1/9).lndon in 61/169
reg d.l(1/8).lnshef d.l(1/8).lndon in 61/169
reg d.l(1/7).lnshef d.l(1/7).lndon in 61/169
reg d.l(1/6).lnshef d.l(1/6).lndon in 61/169
reg d.l(1/5).lnshef d.l(1/5).lndon in 61/169
reg d.l(1/4).lnshef d.l(1/4).lndon in 61/169

testparm d.l(1/4).lndon //Running the F-test, the p-value < 0.01, therefore, suggesting that Y (Granger) cause X

//We identify that going down the 1% route [w/o ECM], that there is still a bi-directional relationship between house prices in Doncaster and Sheffield between 2000 - 2009









 