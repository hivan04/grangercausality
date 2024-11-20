/*Setting up the dataset*/
gen time = tm(1995m1)+_n-1
format time %tm
tsset time

gen lndon = log(doncaster)
gen lnshef = log(sheffield)

*Created log variables for Rotherham, Chesterfield and Barnsley for analysis later to see how closely related house prices are between areas in Sheffield*

gen lnroth = log(rotherham)
gen lnches = log(chesterfield)
gen lnbarn = log(barnsley)

twoway (tsline lndon lnshef lnroth lnches lnbarn)


//*Looking at the entire time horizon*//
twoway (tsline lndon lnshef)
twoway (tsline lndon)
twoway (tsline lnshef)

/*Informal test for stationarity*/
reg lndon lnshef //lnshef coefficient = 0.959... ~ 1, suggesting non-stationarity in levels form
reg lnshef lndon //lndon coefficient = 1.0289... ~ 1, suggesting non-stationarity in levels form

/*Testing for Stationarity - Doncaster*/
twoway (tsline lndon)
di 12*(355/100)^0.25 //Maximum lags ~ 17 lags
*Testing at the 1%*
dfuller lndon, regress lags(17)
dfuller lndon, regress lags(16)
dfuller lndon, regress lags(15)
dfuller lndon, regress lags(14)
dfuller lndon, regress lags(13)
dfuller lndon, regress lags(12)
dfuller lndon, regress lags(11)
dfuller lndon, regress lags(10)
dfuller lndon, regress lags(9)
dfuller lndon, regress lags(8)
dfuller lndon, regress lags(7)
dfuller lndon, regress lags(6)
dfuller lndon, regress lags(5)
dfuller lndon, regress lags(4)
dfuller lndon, regress lags(3)
dfuller lndon, regress lags(2)
dfuller lndon, regress lags(1)

*Dropping the constant term (beta) because it was insignificant*
dfuller lndon, noconstant regress lags(17)
dfuller lndon, noconstant regress lags(16)
dfuller lndon, noconstant regress lags(15)
dfuller lndon, noconstant regress lags(14)
dfuller lndon, noconstant regress lags(13)
dfuller lndon, noconstant regress lags(12)
dfuller lndon, noconstant regress lags(11)
dfuller lndon, noconstant regress lags(10)
dfuller lndon, noconstant regress lags(9)
dfuller lndon, noconstant regress lags(8)
dfuller lndon, noconstant regress lags(7)
dfuller lndon, noconstant regress lags(6)
dfuller lndon, noconstant regress lags(5)
dfuller lndon, noconstant regress lags(4)
dfuller lndon, noconstant regress lags(3)
dfuller lndon, noconstant regress lags(2)
dfuller lndon, noconstant regress lags(1)
//We see in both cases that our variable is not stationary in levels form

*in first-difference form
twoway (tsline D.lndon)
dfuller D.lndon, regress lags(17)
dfuller D.lndon, regress lags(16)
dfuller D.lndon, regress lags(15)
dfuller D.lndon, regress lags(14)
dfuller D.lndon, regress lags(13)
dfuller D.lndon, regress lags(12)
dfuller D.lndon, regress lags(11)
dfuller D.lndon, regress lags(10)
dfuller D.lndon, regress lags(9) //at sixth lag, variable is SIGNIFICANT AT THE 1% ALPHA, and constant is not significant (even at the 10% alpha)

*Dropping the constant term*
dfuller D.lndon, noconstant regress lags(16)
dfuller D.lndon, noconstant regress lags(15)
dfuller D.lndon, noconstant regress lags(14)
dfuller D.lndon, noconstant regress lags(13)
dfuller D.lndon, noconstant regress lags(12)
dfuller D.lndon, noconstant regress lags(11)
dfuller D.lndon, noconstant regress lags(10)
dfuller D.lndon, noconstant regress lags(9) //at ninth lag, variable is SIGNIFICANT AT THE 1% ALPHA

*Therefore, either way, lndon has an order of integration of 1: lndon~I(1)*


/*Testing for Stationarity - Sheffield*/
twoway (tsline lnshef)
*Testing at the 1%*
dfuller lnshef, regress lags(17)
dfuller lnshef, regress lags(16)
dfuller lnshef, regress lags(15)
dfuller lnshef, regress lags(14)
dfuller lnshef, regress lags(13)
dfuller lnshef, regress lags(12)
dfuller lnshef, regress lags(11)
dfuller lnshef, regress lags(10)
dfuller lnshef, regress lags(9)
dfuller lnshef, regress lags(8)
dfuller lnshef, regress lags(7)
dfuller lnshef, regress lags(6)
dfuller lnshef, regress lags(5)
dfuller lnshef, regress lags(4)
dfuller lnshef, regress lags(3)
dfuller lnshef, regress lags(2)
dfuller lnshef, regress lags(1)

*in first-difference form*
twoway (tsline D.lnshef)
dfuller D.lnshef, regress lags(17)
dfuller D.lnshef, regress lags(16)
dfuller D.lnshef, regress lags(15)
dfuller D.lnshef, regress lags(14)
dfuller D.lnshef, regress lags(13)
dfuller D.lnshef, regress lags(12)
dfuller D.lnshef, regress lags(11)
dfuller D.lnshef, regress lags(10)
dfuller D.lnshef, regress lags(9) //at ninth lag, variable is SIGNIFICANT AT THE 1% ALPHA, but constant only significant at the 5% alpha

dfuller D.lnshef, noconstant regress lags(17)
dfuller D.lnshef, noconstant regress lags(16)
dfuller D.lnshef, noconstant regress lags(16)
dfuller D.lnshef, noconstant regress lags(15)
dfuller D.lnshef, noconstant regress lags(14)
dfuller D.lnshef, noconstant regress lags(13)
dfuller D.lnshef, noconstant regress lags(12)
dfuller D.lnshef, noconstant regress lags(11)
dfuller D.lnshef, noconstant regress lags(10)
dfuller D.lnshef, noconstant regress lags(9) //at ninth lag, variable is SIGNIFICANT AT THE 1% ALPHA

*Therefore, either way, lnshef has an order of integration of 1: lnshef~I(1)*

/*Cointegation test - since they have the same order of integration, we are able to run the cointegration test between the variables before moving onto Granger Causality*/
/*Informal Test Inference*/
reg lndon lnshef
estat dwatson // Durbin–Watson d-statistic =  0.0504475 < R-squared, suggesting a spurious regression. We can run the Engle Granger Test to verify this.

findit egranger 
egranger lndon lnshef, lags(17) regress
egranger lndon lnshef, lags(16) regress
egranger lndon lnshef, lags(15) regress
egranger lndon lnshef, lags(14) regress
egranger lndon lnshef, lags(13) regress
egranger lndon lnshef, lags(12) regress
egranger lndon lnshef, lags(11) regress
egranger lndon lnshef, lags(10) regress
egranger lndon lnshef, lags(9) regress
egranger lndon lnshef, lags(8) regress
egranger lndon lnshef, lags(7) regress
egranger lndon lnshef, lags(6) regress
egranger lndon lnshef, lags(5) regress
egranger lndon lnshef, lags(4) regress
egranger lndon lnshef, lags(3) regress
egranger lndon lnshef, lags(2) regress
egranger lndon lnshef, lags(1) regress
//Even with 1 lag, the Engle Granger tau statistic is not significant at the 1% or 5% alpha, suggesting that our informal DW d-test was correct; that we have a spurious regression.


/*Granger-Casuality Test (1995 to 2024)*/
*[Y = lndon, X = lnshef]
*Does X (Granger) cause Y?*
reg d.lndon d.l(1/17).lndon d.l(1/17).lnshef
reg d.lndon d.l(1/16).lndon d.l(1/16).lnshef
reg d.lndon d.l(1/15).lndon d.l(1/15).lnshef
reg d.lndon d.l(1/14).lndon d.l(1/14).lnshef
reg d.lndon d.l(1/13).lndon d.l(1/13).lnshef
reg d.lndon d.l(1/12).lndon d.l(1/12).lnshef
reg d.lndon d.l(1/11).lndon d.l(1/11).lnshef
reg d.lndon d.l(1/10).lndon d.l(1/10).lnshef
reg d.lndon d.l(1/9).lndon d.l(1/9).lnshef //at the 5% alpha
reg d.lndon d.l(1/8).lndon d.l(1/8).lnshef
reg d.lndon d.l(1/7).lndon d.l(1/7).lnshef
reg d.lndon d.l(1/6).lndon d.l(1/6).lnshef
reg d.lndon d.l(1/5).lndon d.l(1/5).lnshef
reg d.lndon d.l(1/4).lndon d.l(1/4).lnshef
reg d.lndon d.l(1/3).lndon d.l(1/3).lnshef
reg d.lndon d.l(1/2).lndon d.l(1/2).lnshef
reg d.lndon d.l(1/1).lndon d.l(1/1).lnshef //at the 1% alpha

*testparm test at*
*5% alpha:
reg d.lndon d.l(1/9).lndon d.l(1/9).lnshef
testparm d.l(1/9).lnshef //p-value < 0.01, therefore we can reject H0 and results suggest that house prices in Sheffield (Granger) cause house prices in Doncaster with at the 99% confidence level

*1% alpha:
reg d.lndon d.l(1/1).lndon d.l(1/1).lnshef
testparm d.l(1/9).lnshef //p-value < 0.01, therefore we can reject H0 and results suggest that house prices in Sheffield (Granger) cause house prices in Doncaster with at the 99% confidence level

//Therefore, there is strong statistical evidence to suggest that house prices in Sheffield (Granger) cause house prices in Doncaster.


*Does Y (Granger) cause X?*
reg d.lnshef d.l(1/17).lnshef d.l(1/17).lndon
reg d.lnshef d.l(1/17).lnshef d.l(1/17).lndon
reg d.lnshef d.l(1/16).lnshef d.l(1/16).lndon
reg d.lnshef d.l(1/15).lnshef d.l(1/15).lndon
reg d.lnshef d.l(1/14).lnshef d.l(1/14).lndon
reg d.lnshef d.l(1/13).lnshef d.l(1/13).lndon
reg d.lnshef d.l(1/12).lnshef d.l(1/12).lndon //at the 5% alpha
reg d.lnshef d.l(1/11).lnshef d.l(1/11).lndon
reg d.lnshef d.l(1/10).lnshef d.l(1/10).lndon
reg d.lnshef d.l(1/9).lnshef d.l(1/9).lndon
reg d.lnshef d.l(1/8).lnshef d.l(1/8).lndon
reg d.lnshef d.l(1/7).lnshef d.l(1/7).lndon
reg d.lnshef d.l(1/6).lnshef d.l(1/6).lndon
reg d.lnshef d.l(1/5).lnshef d.l(1/5).lndon
reg d.lnshef d.l(1/4).lnshef d.l(1/4).lndon
reg d.lnshef d.l(1/4).lnshef d.l(1/3).lndon
reg d.lnshef d.l(1/3).lnshef d.l(1/3).lndon
reg d.lnshef d.l(1/2).lnshef d.l(1/2).lndon
reg d.lnshef d.l(1/1).lnshef d.l(1/1).lndon //at the 1% alpha

*testparm test at*
*5% alpha:
reg d.lnshef d.l(1/12).lnshef d.l(1/12).lndon
testparm d.l(1/12).lndon //p-value < 0.01, therefore we can reject H0 and results suggest that house prices in Doncaster (Granger) cause house prices in Sheffield with at the 99% confidence level

*1% alpha:
reg d.lnshef d.l(1/1).lnshef d.l(1/1).lndon
testparm d.l(1/1).lndon //p-value < 0.01, therefore we can reject H0 and results suggest that house prices in Doncaster (Granger) cause house prices in Sheffield with at the 99% confid ence level

//Therefore, there is strong statistical evidence to suggest that house prices in Doncaster (Granger) cause house prices in Sheffield.


/*Misc.*/
//2000 to 2009 (GFC) - large shootup in house prices
twoway (tsline lndon lnshef in 61/169)

//2013 to 2020 (Brexit & Start of COVID) - rate of growth much slower compared to above chart
twoway (tsline lndon lnshef in 217/301)
