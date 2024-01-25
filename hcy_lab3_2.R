##########################

# ESP 106
# Lab 3 - graphing
# Due Jan 23rd

##########################

#In this lab we will start by reading merging in data on economic development and indoor and outdoor air pollution. Then we will practice making some graphs with it.



#1. First read in the csv files: gdppercapitaandgini and airpollution
ap=read.csv("E:/ucd_winter_2024/ESP_106_001/labs/lab3/ESP_Lab 3_Wednesday/airpollution.csv")
gd=read.csv("E:/ucd_winter_2024/ESP_106_001/labs/lab3/ESP_Lab 3_Wednesday/gdppercapiandgini.csv")
gd
#Both datasets are from Our World in Data: ourworldindata.org
#The GDP dataset has GDP per capita and the GINI index (a measure of income inequality: https://en.wikipedia.org/wiki/Gini_coefficient)
#The air pollution dataset has death rates from indoor and outdoor air pollution - units are in deaths per 100,000 people
#Indoor air pollution is the Household Air Pollution from Solid Fuels
#Outdoor air pollution is split into particulate matter and ozone

#Hint: The column names are long and cumbersome (because they contain information about units et) - you might want to rename some of the columns to make them easier to work with

colnames(ap)=c("Nation", "Country_Code", "Years", "Particulate", "Solid_Fuels", "Ozone", "Air_Pollution")

#2. Chose two countries that you are interested in and make a plot showing the death rates from indoor air pollution and outdoor air pollution (sum of particulate matter and ozone) over time
#Distinguish the countries using different colored lines and the types of pollution using different line types
#Make sure to add a legend and appropriate titles for the axes and plot 
sum_pollute= ap$Particulate +ap$Ozone
#plot(x=ap$Nation, y=sum_pollute)

list(unique(ap$Nation))
#plot(ap$Nation, sum_pollute)

ap$sum_pol=ap$Particulate + ap$Ozone

m_china=ap[ap$Nation == "China",]
m_usa=ap[ap$Nation == "United States",]
m_china
m_usa

plot(m_china$Years,m_china$Solid_Fuels,pch=20,col="red", bty="l", las=1, ylim=c(0,80), xlab="Years", ylab="Deaths per 100,000", main="Deaths caused by \n Different Types of Pollution")
points(m_usa$Years, m_china$sum_pol, pch=8, col="red")
points(m_usa$Years, m_usa$Solid_Fuels, pch=20, col="blue")
points(m_usa$Years, m_usa$sum_pol, pch=8, col="blue")

legend(x="topleft",lty=1, bty="n", cex=0.5,legend= c("China Indoor", "China Outdoor", "USA Indoor", "USA Outdoor"), fill=c("red","red", "blue", "blue"), title="Pollution Types", pch=c(20,8,20,8))
?legend

#Add a legend later on wed, 1/24/2024. done!

#Hint: you can see all the different country names using unique(x$Entity) where x is the data frame containing the air pollution data
#Then create two new data frames that contain only the rows corresponding to each of the two countries you want to look at
#Create a new column of total outdoor air pollution deaths by summing death rates from particulate matter and ozone
#Use these to make your plot and add the lines you need


#Hint: you might have to set the y scale manually to make sure your plot is wide enough to show both countries. You can do this using the "ylim" argument in plot


#3. Merge the air pollution data with the gdp data using merge()
# Merge is a function that combines data across two data frames by matching ID rows
#By default merge will identify ID rows as those where column names are the same between datasets, but it is safer to specify the columns you want to merge by yourself using "by"
#In our case, we want to merge both by country (either the "Entity" or "Code" columns) and year columns
#Note that by default, the merge function keeps only the entries that appear in both data frames - that is fine for this lab. If you need for other applications, you can change using the all.x or all.y arguments to the function - check out the documentation at ?merge
?merge()
colnames(gd)= c("Nation", "Country_Code", "Years", "Population" ,"Continent", "GINI_Coefficent", "GDP")
gd

merge1=merge(ap, gd, by=c("Nation", "Years"))
merge1

#4. Make a plot with two subplots - one showing a scatter plot between log of per-capita GDP (x axis) and indoor air pollution death rate (y axis) and one showing log of per-capita GDP (x axis) and outdoor air pollution (y axis)
#Make sure to add appropraite titles to the plots and axes
#Use ylim to keep the range of the y axis the same between the two plots - this makes it easier for the reader to compare across the two graphs
#STRECTH GOAL CHALLENGE - color the points based on continent. NOT REQUIRED FOR FULL POINTS - a challenge if you want to push yourself - continent info is included in the GDP dataset, but it is only listed for the year 2015
#If you are trying this and getting stuck ASK FOR HELP - there are some tips and tricks for making it easier 

plot(x=log(merge1$GDP), y=merge1$Solid_Fuels, ylim=c(0,250))
plot(log(merge1$GDP), merge1$sum_pol, ylim=c(0,250))

