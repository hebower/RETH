#RETH Plotting Solar Flare Data
#This program is designed to open a text file of data and plot the results
#Here are the definitions for the program

#SOLAR FLARE DATA
#https://www.ngdc.noaa.gov/
#stp/space-weather/solar-data/solar-features/solar-flares/index/

from pylab import *
from statistics import *
import numpy
from matplotlib import pyplot

def sfyear(var, filename): #function opens file and records data
    
    #Define Variable Lists
    day = [];
    Jan = []; Feb = []; Mar = []; Apr = []; May = []; Jun = [];
    Jul = []; Aug = []; Sep = []; Oct = []; Nov = []; Dec = [];
    
    #Import desired text file
    file = open(filename, 'r'); #read from the file
    
    for i in range(0,7): #skip unnecessary lines
        file.readline()
        
    for line in file:    #begin assigning values from columns to lists
        split_list = line.split("\t");
        day.append(split_list[0])
        Jan.append(split_list[1])
        Feb.append(split_list[2])
        Mar.append(split_list[3])
        Apr.append(split_list[4])
        May.append(split_list[5])
        Jun.append(split_list[6])
        Jul.append(split_list[7])
        Aug.append(split_list[8])
        Sep.append(split_list[9])
        Oct.append(split_list[10])
        Nov.append(split_list[11])
        Dec.append(split_list[12])
        Dec[-1] = Dec[-1].strip() #removing \n from the last element
        
    var = Jan+Feb+Mar+Apr+May+Jun+Jul+Aug+Sep+Oct+Nov+Dec #concatenate
    var = [x for x in var if x != "xxxx"] #remove bogus items
    
    file.close();
    return var;
    
def SPEyear(var, filename): #function opens file and records data
    
    #Define Variable Lists
    Julian_Date = []; Year = []; DOY = []; Year_Fraction = []; 
    H2O = []; Alt = []; GE = []; 
    D1_2 = []; D3_4 = []; D5_6 = []; 
    D1 = []; D2 = []; D3 = []; D4 = []; D5 = []; D6 = [];
    
    #data = numpy.loadtxt(filename, delimter='\t')
    #D1 = data['Year']
    
    #Import desired text file
    file = open(filename, 'r'); #read from the file

    for i in range(0,17): #skip unnecessary lines
        file.readline()
    
    
    #extract the needed data
    for file_line in file:
        split_list = file_line.split("\t");
        Julian_Date.append(split_list[0])
        Year.append(float(split_list[1]))
        DOY.append(float(split_list[2]))
        Year_Fraction.append(float(split_list[3]))
        H2O.append(float(split_list[4]))
        Alt.append(float(split_list[5]))
        GE.append(float(split_list[6]))
        D1_2.append(float(split_list[7]))
        D3_4.append(float(split_list[8]))
        D5_6.append(float(split_list[9]))
        D1.append(float(split_list[10]))
        D2.append(float(split_list[11]))
        D3.append(float(split_list[12]))
        D4.append(float(split_list[13]))
        D5.append(float(split_list[14]))
        D6.append(split_list[15])
        D6[-1] = D6[-1].strip() #removing \n from the last element
        #D6 is not a float! This will need to be done later.      
    
    last = 0
    temp = []
    new_temp = []
    
    for j in range(0,len(DOY)):
        if DOY[j] == last:
            temp.append(D1_2[j])
        else:
            new_temp.append(numpy.average(temp))
            temp.clear()
            last = DOY[j]
            temp.append(D1_2[j])
    
    new_temp.append(numpy.average(temp))
        
    DOY = sorted(list(set(DOY)))
        
    var = new_temp #concatenate
    var.pop(0)
    #var = [x for x in var if x != "xxxx"] #remove bogus items
    
    file.close();
    return var,DOY;
    
def plotting(x,y,plot_title,x_label,y_label,upper_x,upper_y,n,c,lll): #function plots data
    figure(n)
    title(plot_title)
    xlabel(x_label)
    ylabel(y_label)
    xlim(0,upper_x)
    ylim(1,upper_y)
    scatter(x,y,color=c,label=lll)
    legend(loc="best")
    #pyplot.xscale('log')
    #pyplot.yscale('log')
    show()   

def adding_days(DOY,number):
    
    if number == 2010:
        days = 365
    elif number == 2011:
        days = 365*2
    elif number == 2012:
        days = 1+(365*3)
    elif number == 2013:
        days = 1+(365*4)
    elif number == 2014:
        days = 1+(365*5)
    else:
        days = 0
    
    for i in range(0,len(DOY)):
        DOY[i]=DOY[i]+days
        
    return DOY;

def correlate(a,b):
    
    temp = []
    
    for i in range(0,len(b)):
        j = b[i]
        temp.append(a[j])
   
    return temp;
    
