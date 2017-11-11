#RETH Plotting Solar Flare Data
#This program is designed to open a text file of data and plot the results

#SOLAR FLARE DATA
#https://www.ngdc.noaa.gov/
#stp/space-weather/solar-data/solar-features/solar-flares/index/

from SolarFlare_SPE_Defs import *
from matplotlib import pyplot

###############################################################################
#Define Variable Lists for Solar Flare Data
sf2009 = []; sf2010 = []; sf2011 = []; #Solar flare list for 2009-2011
sf2012 = []; sf2013 = []; sf2014 = []; #Solar flare list for 2012-2014

#Putting the solar flare data into years
sf2009 = sfyear(sf2009,'SolarActivity2009.txt')
sf2010 = sfyear(sf2010,'SolarActivity2010.txt')
sf2011 = sfyear(sf2011,'SolarActivity2011.txt')
sf2012 = sfyear(sf2012,'SolarActivity2012.txt')
sf2013 = sfyear(sf2013,'SolarActivity2013.txt')
sf2014 = sfyear(sf2014,'SolarActivity2014.txt')

#Calculating the total solar flare data over 6 years
sftotal = sf2009+sf2010+sf2011+sf2012+sf2013+sf2014
time = linspace(0,len(sftotal),len(sftotal))
###############################################################################
#Define Variable Lists for SPE Data
SPE2009 = []; SPE2010 = []; SPE2011 = []; #SPE list for 2009-2011
SPE2012 = []; SPE2013 = []; SPE2014 = []; #SPE list for 2012-2014

#Putting the radiation data into years
SPE2009,DOY1 = SPEyear(SPE2009,'UNH2009SPE.txt')
SPE2010,DOY2 = SPEyear(SPE2010,'UNH2010SPE.txt')
SPE2011,DOY3 = SPEyear(SPE2011,'UNH2011SPE.txt')
SPE2012,DOY4 = SPEyear(SPE2012,'UNH2012SPE.txt')
SPE2013,DOY5 = SPEyear(SPE2013,'UNH2013SPE.txt')
SPE2014,DOY6 = SPEyear(SPE2014,'UNH2014SPE.txt')

DOY2 = adding_days(DOY2,2010)
DOY3 = adding_days(DOY3,2011)
DOY4 = adding_days(DOY4,2012)
DOY5 = adding_days(DOY5,2013)
DOY6 = adding_days(DOY6,2014)

SPEtotal = SPE2009+SPE2010+SPE2011+SPE2012+SPE2013+SPE2014
SPEscaled = [ x*10 for x in SPEtotal ]
DOY = DOY1+DOY2+DOY3+DOY4+DOY5+DOY6
DOY = [ int(x) for x in DOY ]
###############################################################################
#Plot the data
plotting(time,sftotal,"Solar Flares and SPE","Days","Solar Activity",2191,105,0,"m","Solar Activity")
plotting(DOY,SPEscaled,"Solar Flares and SPE","Days","Solar Activity",2007,105,0,"c","Radiation")
"""
a = [0,1,2,3,8,5,10] #solar flare
b = [0,4,6] #day
sfcorr = correlate(a,b)
"""
sfcorr = correlate(sftotal,DOY)
plotting(sfcorr,SPEscaled,"Correlation?","Solar Flares","SPE",457,457,1,"c","Nope")

#8-day moing average, moving over 2 days at a time
