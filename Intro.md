### Introduction

The purpose of this Shiny webApp is to help analyze and visualize the real estate pricing in Kuala Lumpur, Malaysia.

### Data

The dataset used for this Shiny webApp is available on Kaggle.
Dataset: Property listing in Malaysia, Kuala Lumpur
Date created: 2021-10-09
Source: https://www.kaggle.com/thajegan76/real-estate-kuala-lumpur-malaysia

The dataset contains 7791 observations with 7 attributes. Our team choosed 3 exploratory variables to analyse the real estate property market in Kuala Lumpur, Malaysia. 


### Variables

The App focuses on the explanatory variables: House Area, Price(RM), and Size (Square Feet). It allows users to selected the explanatory variable and data points to find a more affordable property in Kuala Lumpur Area. <br>

<b>Area: </b> The area of property located <br>
<b>Price_RM: </b> Price of the property, indicated in Ringgit Malaysia (RM) <br>
<b>Size_sqft: </b> Size of the property, indicated in square feet <br>


### How to use this Shiny webApp

Start by clicking on the `Visualizations` tab on the top menu to go to the visualization page. Beware that it takes a little time to load. Patience and voila!

First, you can have a glimpse of the distribution of real estate in Kuala Lumpur area through the map visualization. <br>

You may filter the `Area` that you are interested at the left side of the page. The green dot on the map represents that the property is more affordable, the red dot means it's more expensive and the grey dot shows that the property is out of the colour range. <br>

![GP - SS2](https://user-images.githubusercontent.com/85699010/150471062-6a518ca0-d8cf-48a3-933f-43ac795f3539.jpg)

Next, choose 1 factor from the <b> `Config for Univariate Analysis` </b>at the left of the page. <br>

Then, you will see the distribution of the variable (Area, Price_RM, or Size_sqft) shown at the histogram in the middle of the page. You may understand the distribution of real estate property in Kuala Lumpur area from 3 verticals through the `Univariate Analysis` Histogram at the bottom left of the page. <br>

![GP - SS3](https://user-images.githubusercontent.com/85699010/150471065-ac7a0c44-1fca-421b-a47e-a34a132a7039.jpg)

Moreover, you may use the `Bivariate Analysis` to discover the price distribution among different areas and different sizes of the property. Variables for X-axis and Y-axis can be selected from the <b> `Config for Bivariate Analysis` </b>. <br>

This allows you to understand the correlation among three exploratory variables of the real estate market in Kuala Lumpur. </br>

![GP - SS4](https://user-images.githubusercontent.com/85699010/150471066-248b349e-faa4-4569-bb32-c26069044697.jpg)

You will notice there are 2 sliders below the area selectors, it is used to set the price range and size, so that the `Univariate Analysis` and `Bivariate Analysis` will show the distribution of the property within the price and size range based on your selection. <br>