#Hayley E. Bower
#June 20, 2017
#Resilient ExtraTerrestrial Habitats (RETH) Project
#Purdue University

from pylab import *
#Solar Max
poly1 = [278625.2,6528.9,142.1,23.87]
alum1 = [398036,9327,203,34.1]
x = [0.1,1,10,31.6]

pp = PdfPages('Kuznetsov_Alum_Poly.pdf') #Creates and saves plots to a pdf

figure(0)
title("Combined Radiation at Solar Maximum")
ylim(0,50)
xlabel("Shielding Thickness (g/cm^2)")
ylabel("cSv/yr")
plot(x,poly1,color='blue', label='Polyethylene')
plot(x,alum1,color='red', label='Aluminum')
axhline(y=5, xmin=0, xmax=31.6, color='black',hold=None,label="NASA Limit") 
legend(loc="best")
pp.savefig(figure(0))


#Solar Min
poly2 = [47141.63,1009.26,33.87,11.62]
alum2 = [67345.19,1441.8,48.39,16.6]

figure(1)
title("Combined Radiation at Solar Minimum")
ylim(0,50)
xlabel("Shielding Thickness (g/cm^2)")
ylabel("cSv/yr")
plot(x,poly2,color='blue', label='Polyethylene')
plot(x,alum2,color='red', label='Aluminum')
axhline(y=5, xmin=0, xmax=31.6, color='black',hold=None,label="NASA Limit") 
legend(loc="best")
pp.savefig(figure(1))

pp.close()
