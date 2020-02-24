install.packages("readtext",dependencies=TRUE)
#install.packages("dplyr",dependencies = TRUE)
library(readtext)
#library(dplyr)

# Cleaning environment data
rm(list = ls())


setwd('E:\\GITHUB\\INST 737-Project\\INST-737-Project')

news='E:\\GITHUB\\INST 737-Project\\INST-737-Project\\bbc-fulltext\\bbc'

categories = list.files(path=news)

#summary_categories = data.frame(matrix(ncol=2,nrow=0))

#colnames(summary_categories) = c('Category','Number of Titles')

#for (category in categories){
 # category_path <- paste(news, category, sep='/')
#  n_files <- length(list.files(path=category_path))
  
 # summary_categories = rbind(summary_categories, data.frame('Category'=category, 'Number_of_Files'=n_files))
#}


#Read every folder and create final data frame


df = data.frame(matrix(nrow=0,ncol=3))
#colnames(df) <- c('filename','text','category')
#colnames(df) <- c('filename','text','category')
###
for(category in categories){
 category_path <- paste(news, category, sep='\\')
 df1 = readtext(category_path)
  df1["category"]=category

 df=rbind(df,df1)
}

colnames(df) <- c('filename','text','category')
# 
# newlist <- split(df,df$category)
# 
# 
# list2env(setNames(newlist, paste0('cat-', seq_along(newlist))),envir=.GlobalEnv)


#Save Dataset
save(df,file='Dataset.rda')

#load Dataset
load(file='Dataset.rda')

#iimport to python 
# write.csv2(df,fileEncoding = 'utf8','BBC_Dataset.csv')
write.csv(df,fileEncoding='utf8',file="newDataset.csv")