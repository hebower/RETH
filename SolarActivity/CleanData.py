#RETH Cleaning Data
#This program is designed to open a text file of data, reduce the number of
#outliers, and generate a new text file which can be used for analysis

#SOLAR FLARE DATA
#https://www.ngdc.noaa.gov/stp/space-weather/solar-data/solar-features/solar-flares/index/

from pylab import *

#Define Variable Arrays
Julian_Date = []; Year = []; DOY = []; Year_Fraction = []; 
H2O = []; Alt = []; GE = []; 
D1_2 = []; D3_4 = []; D5_6 = []; 
D1 = []; D2 = []; D3 = []; D4 = []; D5 = []; D6 = [];


#Import desired text file
file = open('UNH2009Comb.txt', 'r'); #read from the file

for i in range(0,16): #skip unnecessary lines
    file.readline()
    
#extract the needed data
for line in file:
    file_line = file.readline()
    split_list = file_line.split("\t");
    Julian_Date.append(split_list[0])
    Year.append(split_list[1])
    DOY.append(split_list[2])
    Year_Fraction.append(split_list[3])
    H2O.append(split_list[4])
    Alt.append(split_list[5])
    GE.append(split_list[6])
    D1_2.append(split_list[7])
    D3_4.append(split_list[8])
    D5_6.append(split_list[9])
    D1.append(split_list[10])
    D2.append(split_list[11])
    D3.append(split_list[12])
    D4.append(split_list[13])
    D5.append(split_list[14])
    D6.append(split_list[15]) #has \n on the end of each element

file.close(); #closing the file so that I can open a new one

#clean up the data
    
#write the new data to a new text file
file = open('UNH2009Comb_clean.txt','w') 
 
file.write(Julian_Date) 
 
file.close() 
    
    
    
    
    
    
    
    
    