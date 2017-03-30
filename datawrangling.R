##Wrangle the data so that there are no text issues.
housing_prices <- read.table("data/fasteignir.csv", header = TRUE, sep = ";", dec = ".") #As we can see there are no special characters.

library(plyr)

housing_prices$teg_eign <- #Changing the names of the items in the teg_eign thingiemabob
  revalue(housing_prices$teg_eign, c("Einbýli" = "single-family property", 
                                       "Einbýlishús" = "single-family property", 
                                       "Fjölbýlishús" = "apartment building", 
                                       "Gistiheimili" = "hostel", 
                                       "Gistihús" = "guest house", 
                                       "Íbúðareign" = "apartment", 
                                       "Íbúðarhús" = "apartment building", 
                                       "Ósamþykkt íbúð" = "unapproved apartment", 
                                       "Parhús" = "two-family building", 
                                       "Raðhús" = "town-house", 
                                       "Séreign" = "private property"))

#Removing obviously pointless columns from the dataframe.
drops <- #All but 'faerslunumer' are supposed to be removed according to project description. 
         #'faerslunumer' is just the number of the entry, so it clearly has no effect.
         #'drops is simply a list of the columns to be dropped.
  c("faerslunumer","rfastnum", "grfast", "grlaus", "byggd", "lodpflm", "abnflm", 
    "nythl", "adferd", "efnu", "mbstig", "ist120", "haednr", "fjibmhl", "haedflm", 
    "birtm2", "studull", "ib1m2", "ib2m2", "ib3m2", "bilgm2", "rism2", "fjibhaed", 
    "sernotad", "fjolnotad") 
housing_prices <- housing_prices[ , !(names(housing_prices) %in% drops)] #cutting out the columns in the drops list.










