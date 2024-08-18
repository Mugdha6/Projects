#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
warnings.filterwarnings('ignore')


# ---
# # Car project Group 5
# Group 5 Members:
# -  Gabriel Rodriguez
# -  Qi Zhang
# -  Caitlin Klukas
# -  Mugdha Dixit
# ---
# # Overall data set summary

# In[3]:


df_cars = pd.read_csv("CAR DETAILS FROM CAR DEKHO.csv")
df_cars["make"] = df_cars.name.apply(lambda x : ' '.join(x.split(' ')[:1]))
df_cars.columns
df_cars.info()


# In[73]:


df_cars.head()


# ---
# # Selling price
# ---

# In[4]:


#get selling price information
pd.set_option('display.float_format', lambda x: '%.2f' % x)
df_cars.selling_price.describe()


# In[5]:


#ensure selling price column type to be int
df_cars['selling_price'] = pd.to_numeric(df_cars['selling_price'])

#box plot
sns.boxplot(df_cars.selling_price)


# In[6]:


#plot out data
df_cars['selling_price'].hist()


# In[7]:


#clean data and obtain outliers
q3 = np.quantile(df_cars.selling_price, 0.75)
q1 = np.quantile(df_cars.selling_price, 0.25)
iqr = q3 - q1

#find lower / upper limits
lower = q1 - 1.5 * iqr
upper = q3 + 1.5 * iqr

#filter out and only keep values within range 
not_outliers = [x for x in df_cars.selling_price if (
    (x > lower) & (x < upper))]
filtered_cars = df_cars.loc[df_cars.selling_price.isin(not_outliers)]

display(filtered_cars)

#obtain outlier values
outliers = df_cars.loc[~df_cars.selling_price.isin(not_outliers)]
display(outliers)


# In[8]:


filtered_cars.selling_price.describe()


# ### Box plot
# - mean = $392,378.60
# 
# - min = $20,000.00
# 
# - max = $1,165,000.00
# 
# - Q1 = $208,749.75
# 
# - Q3 = $600,000.00
# 
# - IQR = $391,250.25
# 
# - Lower = $20,000.00
# 
# - Upper = $1,165,000.00

# In[9]:


#ensure selling price column type to be int
filtered_cars['selling_price'] = pd.to_numeric(filtered_cars['selling_price'])

#box plot
sns.boxplot(filtered_cars.selling_price)


# In[10]:


#plot out data
filtered_cars['selling_price'].hist()


# ### Center of data (mean/average)
# 
# - The center or mean of the data is $392,378.60

# In[11]:


#describe the center of data (mean / average)
av = float(filtered_cars.selling_price.describe().loc[['mean']])
av = round(av,2)

print('The center or mean of the data is ${}'.format(av))


# ### Spread of data
# 
# - Q1 is $208,749.75
# 
# - Q3 is $600,000.00
# 
# - IQR is $391,250.25
# 
# - Min is $20,000.00
# 
# - Max is $1,165,000.00
# 
# - Range is $1,145,000.00

# In[12]:


#describe the spread of data 
min_ = float(filtered_cars.selling_price.describe().loc[['min']])
min_ = round(min_,2)

max_ = float(filtered_cars.selling_price.describe().loc[['max']])
max_ = round(max_,2)

print("Q1 is ${}, Q3 is ${}, IQR is ${}, Min is ${}, Max is ${}, Range is ${}".format(q1, q3, iqr, min_, max_, (max_-min_)))


# ### Skew of data
# - The skew of the filtered ata is right skewed distribution

# In[13]:


#describe the skew of data
print('The skew of the filtered car data is right skewed distribution')


# ### Cluster / Modality of data
# - Since there is only one peak or mode, the modality of can be described as Unimodal

# In[14]:


#describe clusters/modality 
samples = filtered_cars.selling_price.sample(4)

samples


# In[15]:


#describe modality 
print('Since there is only one peak or mode, the modality can be described as Unimodal')


# ### Extreme values in data
# #### In the outliers list:
# - min values is $1189000.00
# 
# - max value is $8900000.00
# 
# - range of $7711000.00

# In[16]:


#describe extreme values
df_outliers = outliers

df_outliers.selling_price.describe()

mi_ = float(df_outliers.selling_price.describe().loc[['min']])
mi_ = round(mi_,2)

ma_ = float(df_outliers.selling_price.describe().loc[['max']])
ma_ = round(ma_,2)


print('In the outliers list, the min values is ${}, while the max value is ${}, with a range of ${}'.format(mi_, ma_,(ma_-mi_)))


# ---
# # Year Analysis
#  

# In[17]:


year_summary = df_cars.year.describe()
year_summary


# ### Center 
# - From the describe() function we can get the info of the year's mean, min, max, std.
# mean = 2013, min = 1992, max = 2020
# this is telling us, the dataset year range is from 1992 to 2020, the average of the data year is 2013
# 

# In[18]:


#box plot
sns.boxplot(df_cars.year)


# In[19]:


q3 = np.quantile(df_cars.year, 0.75)
q1 = np.quantile(df_cars.year, 0.25)
iqr = q3 - q1

lower = q1 - 1.5 * iqr
upper = q3 + 1.5 * iqr
print(lower, upper, iqr,q1,q3)


# ### Spread
# 
# - mean = 2013, min = 1992, max = 2020, the dataset year range is from 1992 to 2020, the avgerage of the data year is 2013
# - Q1 = 2011
# - Q3 = 2016
# - IQR = 2016 - 2011 = 5 (Interqurtile range)
# - Lower = Q1 -1.5 * IQR = 2003.5
# - Upper = Q3 +1.5* IQR =2023.5 
# - However, the upper 2023.5 is over the MAX year = 2020 so the box plot shows upper = 2020

# In[43]:


# Histgram
sns.countplot(data=df_cars,x="year",palette="coolwarm")
plt.xticks(rotation=90)
plt.xlabel("YEAR",fontsize=10)
plt.ylabel("COUNT",fontsize=10)
plt.title("YEAR COUNT")
plt.show()


# In[25]:


year_mean = df_cars['year'].mean()
year_median = df_cars['year'].median()
year_mode = df_cars['year'].mode()
print('the mean of the year is {0:.2f}, the median of the year is {1}, the mode of the year is {2}'
      .format(year_mean,year_median,int(year_mode[0])))


# In[26]:


import numpy as np
from scipy.stats import skew
skewness = skew(df_cars.year)

if skewness > 0:
    skew_description = "Positively skewed"
elif skewness < 0:
    skew_description = "Negatively skewed"
else:
    skew_description = "Symmetric"

print(f"Skewness: {skewness:.2f} ({skew_description})")


# ###  Skew & Clusters/Modality
# - Since the mean < median < mode, this is a left skewed distribution (negative skewed)
# - Unimodal: One clear peak in the histogram.

# ###  Extreme value

# In[28]:


extreme_values = [x for x in df_cars.year if x < lower or x > upper]
print("Extreme Values:", set(extreme_values)) #Drop dup


# In[97]:


filtered_cars = df_cars.loc[~df_cars.year.isin(extreme_values)]# Remove extreme value
filtered_cars.year.value_counts()


# ### Additional Analysis
# - From the Pie chart we can easily see year 2017 is best selling year 
# - From this sunburn chart, we can see Maruti is the most popular car in every year. and most cars are manual.

# In[96]:


year_counts = filtered_cars.groupby(['year'])['year'].count()

# Calculate the percentage
total_count = year_counts.sum()
year_percentage = (year_counts / total_count) * 100

# Creating a DataFrame to display results
result = pd.DataFrame({'year': year_counts.index, 'Count': year_counts, 'Percentage': year_percentage}).reset_index(drop=True)
result_sorted = result.sort_values(by='Count', ascending=False)
result_sorted


# In[52]:


labels = filtered_cars["year"].value_counts().index # get the selling year count most popular 50 
sizes = filtered_cars["year"].value_counts()
colors = ["#A2CD5A", "#FFEFDB", "#FF7256", "#FFCC00", "#8B8878", "#FFAA00"]
#     ['#a1c9f4', '#8de5a1', '#ff9f9b', '#d0bbff', '#fffea3', '#b9f2f0']
plt.figure(figsize = (6,6))
plt.pie(sizes, labels=labels, rotatelabels=False, autopct='%1.1f%%',colors=colors,shadow=True, startangle=45)
plt.title('Year',color = 'black',fontsize = 15)
plt.show()


# In[76]:


joint_data=df_cars.sort_values(by='year', ascending=False)

top_cars=joint_data[:3000]
fig =px.sunburst(
    top_cars,
    path=['year',"make","transmission"],
    values='year',
    color='year')
fig.show()


# # Kilometers Driven

# In[53]:


# There are no null values for km_driven in this dataset
df_cars.loc[df_cars.km_driven.isnull() == True].count()


# In[54]:


df_cars.km_driven.describe()


# In[55]:


mean_km = df_cars.km_driven.mean()
median_km = df_cars.km_driven.median()
mode_km = df_cars.km_driven.mode()
print("mean = ", mean_km)
print("median = ", median_km)
print("mode = ", mode_km)


# ### Spread
#  - Min = 1km, Max = 806599 with a range of 806598km
#  - The data is grouped more tightly in the lower range with greater spread in the upper range, as indicated by a larger gap between Q3 and the upper whisker bound compared with Q1 and the lower whisker bound
#  - 110 (or ~2.5%) of all cars could be considered outliers with km driven above the upper whisker bound of 172500km
#  - Mahindra's represent nearly 1/3 (27%) of all cars above the upper whisker bound compared to 8% of all cars in the dataset

# In[56]:


min_km = df_cars.km_driven.min()
max_km = df_cars.km_driven.max()
range_km = max_km - min_km

print("min = ", min_km)
print("max = ", max_km)
print("range = ", range_km)


# In[57]:


sns.boxplot(x=df_cars["km_driven"])


# In[58]:


df_cars.km_driven.hist(figsize=(12, 6), bins=50)


# In[61]:


q3_km = np.quantile(df_cars.km_driven, 0.75)
q1_km = np.quantile(df_cars.km_driven, 0.25)
iqr_km = q3_km - q1_km

lowerWB = q1_km - 1.5 * iqr_km
upperWB = q3_km + 1.5 * iqr_km
print("IQR = ", iqr_km)
print("3rd Quartile = ", q3_km)
print("1st Quartile = ", q1_km)
print("lower km bound = ", lowerWB)
print("upper km bound = ", upperWB)


# In[60]:


outliers = df_cars.km_driven.loc[df_cars.km_driven > upperWB]
print("# cars above uwb = ", outliers.count())
print("percentage of outliers = ", 110/4340)
print()

outliers = df_cars.loc[df_cars.km_driven > upperWB]
mahindra = df_cars.loc[df_cars.make == "Mahindra"]
print("Total # Mahindra = ", mahindra.shape[0])
print(mahindra.shape[0]/4340)
print()

mahindra_in_outliers = outliers.loc[df_cars.make == "Mahindra"]
print("# Mahindra in outlisers = ", mahindra_in_outliers.shape[0])
print(mahindra_in_outliers.shape[0]/110)


# ### Boxplot - with outliers removed

# In[62]:


km_no_outliers = df_cars.km_driven.loc[df_cars.km_driven < 200000]
sns.boxplot(km_no_outliers)


# ### Modality & Clusters
#  - As discussed above, 50% of the data is grouped between 35000-90000km as indicated by the 1st and 3rd quartiles.
#  - When extreme values are filtered from the dataset, it demonstrates a fairly unimodal distribution.

# In[63]:


km_no_outliers.hist(figsize=(12, 6), bins=20)


# ### Additional Analysis
#  - With km driven separated by car make, we see that some car types (Ex. Datsun and Jeep) have a lower average km driven with much less spread. Mitsubishis, on the other hand, have a much higher km_driven on average than the rest of the data set. 

# In[64]:


df_km = df_cars.loc[df_cars.km_driven < 200000]
df_km.columns


# In[65]:


plot = sns.catplot(data=df_km, x='make', y='km_driven', kind="box", height=4, aspect=4.0)
plot.set_xticklabels(rotation=45)
plot

#with sns.axes_style("whitegrid"):
    #sns.catplot(data=df_km, x='make', y='km_driven', kind="box", height=4, aspect=4.0)


# In[5]:


import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
warnings.filterwarnings('ignore')
import plotly.express as px


# In[17]:


df_cars.make.value_counts()


# In[16]:


# Highest count of car's brand
sns.countplot(data=df_cars,x="make")
plt.xticks(rotation = 90)
plt.xlabel("Car brands")
print("From the graph, we can see that the most common car brand is Maruti, and the least commons are: Daewoo, Force, Isuzu, and Kia. These cars are mostly foreigns car, so it might not be common in the US.")


# In[14]:


label = df_cars["owner"].value_counts().index
size = df_cars["owner"].value_counts()
color = ['silver', 'pink', 'steelblue','#CCCCFF','#DE3163']

plt.figure(figsize = (8,8))
plt.pie(size, labels=label, rotatelabels=False, autopct='%1.01f%%',explode=explode,colors=color,shadow=False, startangle=905)
plt.title('owner',fontdict={'size':15, 'weight':'bold', 'color':'#6495ED'})
plt.show()

print()
print("The pie chart showed us that First owner cars make up the largest share, accounting for 65.3% of the market. second owner occupied 25.5%, the Third Owner and rest are less than 10%")

