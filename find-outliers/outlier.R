> #sales values in thousands
> sales=c(1,2,50,45,67,200,230,55,56,49)
> 
> #find mean of sales
> mean(sales)
[1] 75.5
> 
> #boxplot
> boxplot(sales)
> 
> #find outliers values
> OutVals = boxplot(sales)$out
> 
> #print outlier
> OutVals
[1]   1   2 200 230
> 
> #find outlier index position in vector
> which(sales %in% OutVals)
[1] 1 2 6 7
> 
> #remove outlier
> clearData=sales[ !(sales %in%OutVals) ]
> 
> #find mean
> mean(clearData)
[1] 53.66667