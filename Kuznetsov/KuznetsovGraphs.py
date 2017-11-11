#Hayley E. Bower
#June 13, 2017
#Resilient ExtraTerrestrial Habitats (RETH) Project
#Purdue University

from pylab import *
from matplotlib.backends.backend_pdf import PdfPages

pp = PdfPages('KuznetsovGraphs.pdf') #Creates and saves plots to a pdf
shielding = [0.1,1,10,31.6] #shield thickness, Aluminum, g/cm^2

#SOLAR MINIMUM
#Galactic Cosmic Rays
GCR_chP_Smin = [41.6,39.6,22.7,8.4] #Charged Particles
GCR_N_sh_Smin = [0.08,0.2,1.76,4.37] #Neutrons from Shielding
GCR_N_s_Smin = [1.12,1.15,1.23,1.12] #Neutrons from Soil

Comb_GCR_Smin = [GCR_chP_Smin[0] + GCR_N_sh_Smin[0] + GCR_N_s_Smin[0],
                 GCR_chP_Smin[1] + GCR_N_sh_Smin[1] + GCR_N_s_Smin[1],
                 GCR_chP_Smin[2] + GCR_N_sh_Smin[2] + GCR_N_s_Smin[2],
                 GCR_chP_Smin[3] + GCR_N_sh_Smin[3] + GCR_N_s_Smin[3]]

#Solar Particle Events
SPE_chP_Smin = [67300.0,1400.0,22.0,2.2] #Charged Particles
SPE_N_sh_Smin = [2.00,0.78,0.70,0.51] #Neutrons from Shielding
SPE_N_s_Smin = [0.39,0.079,0.0052,0.00093] #Neutrons from Soil

Comb_SPE_Smin = [SPE_chP_Smin[0] + SPE_N_sh_Smin[0] + SPE_N_s_Smin[0],
                 SPE_chP_Smin[1] + SPE_N_sh_Smin[1] + SPE_N_s_Smin[1],
                 SPE_chP_Smin[2] + SPE_N_sh_Smin[2] + SPE_N_s_Smin[2],
                 SPE_chP_Smin[3] + SPE_N_sh_Smin[3] + SPE_N_s_Smin[3]]
      
   
#Total Combined Radiation           
Comb_Min_Rad = [Comb_SPE_Smin[0] + Comb_GCR_Smin[0],
                Comb_SPE_Smin[1] + Comb_GCR_Smin[1],
                Comb_SPE_Smin[2] + Comb_GCR_Smin[2],
                Comb_SPE_Smin[3] + Comb_GCR_Smin[3]]
print(Comb_Min_Rad)
###############################################################################
#SOLAR MAXIMUM
#Galactic Cosmic Rays
GCR_chP_Smax = [21.6,20.5,12.9,5.0] #Charged Particles
GCR_N_sh_Smax = [0.047,0.12,1.06,2.72] #Neutrons from Shielding
GCR_N_s_Smax = [0.66,0.68,0.76,0.73] #Neutrons from Soil

Comb_GCR_Smax = [GCR_chP_Smax[0] + GCR_N_sh_Smax[0] + GCR_N_s_Smax[0],
                 GCR_chP_Smax[1] + GCR_N_sh_Smax[1] + GCR_N_s_Smax[1],
                 GCR_chP_Smax[2] + GCR_N_sh_Smax[2] + GCR_N_s_Smax[2],
                 GCR_chP_Smax[3] + GCR_N_sh_Smax[3] + GCR_N_s_Smax[3]]

#Solar Particle Events
SPE_chP_Smax = [398000,9300,182,20.6] #Charged Particles
SPE_N_sh_Smax = [12.5,5.64,6.23,5.08] #Neutrons from Shielding
SPE_N_s_Smax = [1.43,0.19,0.030,0.0053] #Neutrons from Soil

Comb_SPE_Smax = [SPE_chP_Smax[0] + SPE_N_sh_Smax[0] + SPE_N_s_Smax[0],
                 SPE_chP_Smax[1] + SPE_N_sh_Smax[1] + SPE_N_s_Smax[1],
                 SPE_chP_Smax[2] + SPE_N_sh_Smax[2] + SPE_N_s_Smax[2],
                 SPE_chP_Smax[3] + SPE_N_sh_Smax[3] + SPE_N_s_Smax[3]]
   
#Total Combined Radiation              
Comb_Max_Rad = [Comb_SPE_Smax[0] + Comb_GCR_Smax[0],
                Comb_SPE_Smax[1] + Comb_GCR_Smax[1],
                Comb_SPE_Smax[2] + Comb_GCR_Smax[2],
                Comb_SPE_Smax[3] + Comb_GCR_Smax[3]]
#print(Comb_Max_Rad)

###############################################################################
def graph(n,t,x,y,s,chP,Nsh,Ns,l1,l2,l3):
    for i in range(1):
        figure(n)
        ylim(0,50)
        title(t)
        xlabel(x)
        ylabel(y)
        axhline(y=5, xmin=0, xmax=35, color='r',hold=None,label="NASA Limit") 
        plot(s,chP,label=l1)
        plot(s,Nsh,label=l2)
        plot(s,Ns,color='y',label=l3)
        legend(loc="best")
        pp.savefig(figure(n))
        
def graph_2(n,t,x,y,s,Smin,Smax,l1,l2):
    for i in range(1):
        figure(n)
        ylim(0,50)
        title(t)
        xlabel(x)
        ylabel(y)
        axhline(y=5, xmin=0, xmax=35, color='r',hold=None,label="NASA Limit") 
        plot(s,Smin,label=l1)
        plot(s,Smax,label=l2)
        legend(loc="best")
        pp.savefig(figure(n))

###############################################################################
#Plot GCR Data
fig0 = graph(0,"GCR Radiation at Solar Minimum","Shielding Thickness (g/cm^2)",
             "cSv/yr",shielding,GCR_chP_Smin,GCR_N_sh_Smin,GCR_N_s_Smin,
             "GCR Charged Particles","GCR Neutrons from Shielding",
             "GCR Neutrons from Soil")

fig1 = graph(1,"GCR Radiation at Solar Maximum","Shielding Thickness (g/cm^2)",
             "cSv/yr",shielding,GCR_chP_Smax,GCR_N_sh_Smax,GCR_N_s_Smax,
             "GCR Charged Particles","GCR Neutrons from Shielding",
             "GCR Neutrons from Soil")

fig2 = graph_2(2,"GCR Combined Radiation","Shielding Thickness (g/cm^2)",
               "cSv/yr",shielding,Comb_GCR_Smin,Comb_GCR_Smax,
               "Solar Minimum","Solar Maximum")

#Plot SPE Data
fig3 = graph(3,"SPE Radiation at Solar Minimum","Shielding Thickness (g/cm^2)",
             "cSv/yr",shielding,SPE_chP_Smin,SPE_N_sh_Smin,SPE_N_s_Smin,
             "SPE Charged Particles","SPE Neutrons from Shielding",
             "SPE Neutrons from Soil")

fig4 = graph(4,"SPE Radiation at Solar Maximum","Shielding Thickness (g/cm^2)",
             "cSv/yr",shielding,SPE_chP_Smax,SPE_N_sh_Smax,SPE_N_s_Smax,
             "SPE Charged Particles","SPE Neutrons from Shielding",
             "SPE Neutrons from Soil")

fig5 = graph_2(5,"SPE Combined Radiation","Shielding Thickness (g/cm^2)",
               "cSv/yr",shielding,Comb_SPE_Smin,Comb_SPE_Smax,
               "Solar Minimum","Solar Maximum")

#Plot GCR & SPE Data
fig6 = graph_2(6,"Total GCR and SPE Radiation","Shielding Thickness (g/cm^2)",
               "cSv/yr",shielding,Comb_Min_Rad,Comb_Max_Rad,
               "Solar Minimum","Solar Maximum")

pp.close()

close("all") #Closes plots immediately
