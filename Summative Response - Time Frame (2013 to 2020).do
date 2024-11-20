/*Misc.*/
//2013 to 2020 (Brexit & Start of COVID) - rate of growth much slower compared to above chart
twoway (tsline lndon lnshef in 217/301)

/*Informal Stationarity test*/
reg lndon lnshef in 217/301 //coefficient = 0.628832, weak suggestion that it is non-stationary in levels form
reg lnshef lndon in 217/301 //coefficient = 1.480095 ~ 1, suggests, it is non-stationary in levels form


/*Testing for Stationarity - Doncaster*/
twoway (tsline lndon in 217/301) //looking visually, it suggests that we should include a trend term in the stationary
 
di 12*((301-217)/100)^0.25 //maximum lag length ~ 12

dfuller lndon in 217/301, trend regress lags(12)
dfuller lndon in 217/301, trend regress lags(11)
dfuller lndon in 217/301, trend regress lags(10)
dfuller lndon in 217/301, trend regress lags(9)
dfuller lndon in 217/301, trend regress lags(8)
dfuller lndon in 217/301, trend regress lags(7)
dfuller lndon in 217/301, trend regress lags(6) //at 5% alpha, trend p-value < 0.01
dfuller lndon in 217/301, trend regress lags(5)
dfuller lndon in 217/301, trend regress lags(4)
dfuller lndon in 217/301, trend regress lags(3)
dfuller lndon in 217/301, trend regress lags(2) //at 1% alpha, trend p-value < 0.01
//Here we see that regardless of the cofidence interval, it suggests that our variable is trend stationary, therefore lndon~I(0)

/*Testing for Stationarity - Sheffield*/
twoway (tsline lnshef in 217/301) //looking visually, it suggests that we should include a trend term in the stationary

dfuller lnshef in 217/301, trend regress lags(12)
dfuller lnshef in 217/301, trend regress lags(11)
dfuller lnshef in 217/301, trend regress lags(10)
dfuller lnshef in 217/301, trend regress lags(9)
dfuller lnshef in 217/301, trend regress lags(8)
dfuller lnshef in 217/301, trend regress lags(7)
dfuller lnshef in 217/301, trend regress lags(6)
dfuller lnshef in 217/301, trend regress lags(5)
dfuller lnshef in 217/301, trend regress lags(4)
dfuller lnshef in 217/301, trend regress lags(3)
dfuller lnshef in 217/301, trend regress lags(2) //at 1% alpha, trend p-value < 0.01
//Here it suggests that our variable is trend stationary, therefore lndon~I(0)

//Since we find that both variables are trend stationary at the 1% alpha, we should detrend the series and then perform our Granger Causality Test.

/*De-trending our time-series variables*/
/*De-trendig - Doncaster*/
reg lndon time in 217/301
predict resb in 217/301, residuals
twoway (tsline resb in 217/301)

*Test whether residuals are stationary or not*
dfuller resb in 217/301, regress lags(12)
dfuller resb in 217/301, regress lags(11)
dfuller resb in 217/301, regress lags(10)
dfuller resb in 217/301, regress lags(9)
dfuller resb in 217/301, regress lags(8)
dfuller resb in 217/301, regress lags(7)
dfuller resb in 217/301, regress lags(6)
dfuller resb in 217/301, regress lags(5)
dfuller resb in 217/301, regress lags(4)
dfuller resb in 217/301, regress lags(3)
dfuller resb in 217/301, regress lags(2) //note: constant p-value = 0.746
//Therefore, we find that with 2 lags included, our residuals is stationary and we have detrended lndon

	//Without constant term:
dfuller resb in 217/301, noconstant regress lags(12)
dfuller resb in 217/301, noconstant regress lags(11)
dfuller resb in 217/301, noconstant regress lags(10)
dfuller resb in 217/301, noconstant regress lags(9)
dfuller resb in 217/301, noconstant regress lags(8)
dfuller resb in 217/301, noconstant regress lags(7)
dfuller resb in 217/301, noconstant regress lags(6)
dfuller resb in 217/301, noconstant regress lags(5)
dfuller resb in 217/301, noconstant regress lags(4)
dfuller resb in 217/301, noconstant regress lags(3)
//Therefore, we find that with 3 lags and no constant, our residuals is stationary and we have detrended lndon


/*De-trending - Sheffield*/
reg lnshef time in 217/301
predict resc in 217/301, residuals
twoway (tsline resc in 217/301)

*Test whether residuals are stationary or not*
dfuller resc in 217/301, regress lags(12)
dfuller resc in 217/301, regress lags(11)
dfuller resc in 217/301, regress lags(10)
dfuller resc in 217/301, regress lags(9)
dfuller resc in 217/301, regress lags(8)
dfuller resc in 217/301, regress lags(7)
dfuller resc in 217/301, regress lags(6)
dfuller resc in 217/301, regress lags(5)
dfuller resc in 217/301, regress lags(4)
dfuller resc in 217/301, regress lags(3)
dfuller resc in 217/301, regress lags(2)
//Therefore, we find that with 2 lags included, our residuals is stationary and we have detrended lnshef

	//Without constant term:
dfuller resc in 217/301, noconstant regress lags(12)
dfuller resc in 217/301, noconstant regress lags(11)
dfuller resc in 217/301, noconstant regress lags(10)
dfuller resc in 217/301, noconstant regress lags(9)
dfuller resc in 217/301, noconstant regress lags(8)
dfuller resc in 217/301, noconstant regress lags(7)
dfuller resc in 217/301, noconstant regress lags(6)
dfuller resc in 217/301, noconstant regress lags(5)
dfuller resc in 217/301, noconstant regress lags(4)
dfuller resc in 217/301, noconstant regress lags(3)
//Therefore, we find that with 3 lags and no constant, our residuals is stationary and we have detrended lnshef


/*Granger Causality Test*/
//[Y = lndon, X = lnshef]
/*Does X (Granger) cause Y?*/
reg l(1/12).lndon l(1/12).lnshef in 217/301
reg l(1/11).lndon l(1/11).lnshef in 217/301
reg l(1/10).lndon l(1/10).lnshef in 217/301
reg l(1/9).lndon l(1/9).lnshef in 217/301 //If we relax our strict rule of having both lags statistically signicant when performing the sequential t test, lnshef is statistically significant at the 1% alpha
reg l(1/8).lndon l(1/8).lnshef in 217/301
reg l(1/7).lndon l(1/7).lnshef in 217/301
reg l(1/6).lndon l(1/6).lnshef in 217/301
reg l(1/5).lndon l(1/5).lnshef in 217/301
reg l(1/4).lndon l(1/4).lnshef in 217/301
reg l(1/3).lndon l(1/3).lnshef in 217/301
reg l(1/2).lndon l(1/2).lnshef in 217/301
reg l(1/1).lndon l(1/1).lnshef in 217/301
//If we follow through with our strict rules, then there is evidence that X (Granger) causes Y with 1 lag

testparm l.lnshef //p-value < 0.01, suggesting that X does (Granger) cause Y at the 5% SL

*Following with relaxed rules*
reg l(1/9).lndon l(1/9).lnshef in 217/301
testparm l(1/9).lnshef //p-value < 0.05 [=0.0191], therefore suggesting that X does (Granger) cause Y at the 5% SL


/*Does Y (Granger) cause X?*/
reg l(1/12).lnshef l(1/12).lndon in 217/301
reg l(1/11).lnshef l(1/11).lndon in 217/301
reg l(1/10).lnshef l(1/10).lndon in 217/301
reg l(1/9).lnshef l(1/9).lndon in 217/301
reg l(1/8).lnshef l(1/8).lndon in 217/301 //If we relax our strict rule of having both lags statistically signicant when performing the sequential t test, lnshef is statistically significant at the 1% alpha
reg l(1/7).lnshef l(1/7).lndon in 217/301
reg l(1/6).lnshef l(1/6).lndon in 217/301
reg l(1/5).lnshef l(1/5).lndon in 217/301
reg l(1/4).lnshef l(1/4).lndon in 217/301
reg l(1/3).lnshef l(1/3).lndon in 217/301
reg l(1/2).lnshef l(1/2).lndon in 217/301
reg l.lnshef l.lndon in 217/301
//If we follow through with our strict rules, then there is evidence that Y (Granger) causes X with 1 lag

testparm l.lndon //p-value < 0.01, suggesting that X does (Granger) cause Y at the 5% SL

*Following with relaxed rules*
reg l(1/8).lnshef l(1/8).lndon in 217/301
testparm l(1/8).lndon //p-value < 0.10 [= 0.0805], therefore suggesting that X does (Granger) cause Y at 10%

//Therefore, we find that with strict rules (i.e. only rejecting H0 at 1% alpha), that there is Granger Causality between house prices in Doncaster and Sheffield between 2013 - 2020.

//However, at the 10% alpha (to capture longer-term dependencies), we find a bi-directional causal relationship between Doncaster and Sheffield between 2013 - 2020.



















