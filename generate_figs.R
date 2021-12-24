library(ggplot2)
library(readr)
library(readxl)
library(plyr)
library(patchwork)
library(corrplot)
library(dplyr)


vuls <- read_csv(file = 'benchmark.csv')
vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

tensorflow_vuls = subset(vuls, Library=="Tensorflow")
Pytorch_vuls = subset(vuls, Library=="PyTorch")
sickit_vuls = subset(vuls, Library=="Sickit-Learn")
numpy_vuls = subset(vuls, Library=="Numpy")
pandas_vuls = subset(vuls, Library=="Pandas")

vuls_number = as.vector(table(vuls$Library))

sym_palette <- c("#F4ACB7","#FFD3DB","#DDEEF4","#ACD9E9","#74ADD1","#4575B4") 
sym_palette <- rev(sym_palette)

my_axis_size <- 16
my_title_size <- 12
my_legend_size <- 15
my_axis_color="black"


type_data <- table(vuls$`Type vis`)
type_data <- sort(type_data, decreasing = F)
type_name <- as.data.frame(type_data)$Var1
type_name <- as.array(type_name)

num_errors <- table(vuls$`Type vis` == 'Numeric Errors')
memory_buffer_errors <- table(vuls$`Type vis` == 'Memory Buffer Errors')
memory_leak <- table(vuls$`Type vis` == 'Memory Leak')
null_pointer <- table(vuls$`Type vis` == 'Null Pointer Dereference')
use_of_uninitialized_resource <- table(vuls$`Type vis` == 'Use of Uninitialized Resource')
others <- table(vuls$`Type vis` == 'Others')
infinite_loop <- table(vuls$`Type vis` == 'Infinite Loop')
race_condition <- table(vuls$`Type vis` == 'Race Condition')
improper_input_validation <- table(vuls$`Type vis` == 'Improper Input Validation')
deadlock <- table(vuls$`Type vis` == 'Deadlock')
use_after_free <- table(vuls$`Type vis` == 'Use After Free')
file_descriptor_leak <- table(vuls$`Type vis` == 'File Descriptor Leak')
double_free <- table(vuls$`Type vis` == 'Double Free')



types <- c('Numeric Errors', 'Memory Buffer Errors' , 'Memory Leak', 'Null Pointer Dereference' , 'Use of Uninitialized Resource',
           'Others', 'Infinite Loop', 
           'Race Condition', 'Improper Input Validation', 'Deadlock', 'Use After Free', 'File Descriptor Leak',
           'Double Free')


vuls$`Type vis` = factor(vuls$`Type vis`, levels = type_name)

palette <- c("#D2E6F1","#9ECAE1","#3182BD", "#7CFC00", "#20B2AA") #blue 
vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

p <- ggplot(vuls, aes(y=`Type vis`, fill = Library))
p + geom_bar( alpha = 1) + 
  annotate(geom="text", x=200, y=13, label=num_errors[2], size=6)+
  annotate(geom="text", x=100, y=12, label=memory_buffer_errors[2], size=6)+
  annotate(geom="text", x=95, y=11, label=memory_leak[2], size=6)+
  annotate(geom="text", x=60, y=10, label=null_pointer[2], size=6)+
  annotate(geom="text", x=55, y=9, label=use_of_uninitialized_resource[2], size=6)+
  annotate(geom="text", x=49, y=8, label=others[2], size=6)+
  annotate(geom="text", x=45, y=7, label=infinite_loop[2], size=6)+
  annotate(geom="text", x=40, y=6, label=race_condition[2], size=6)+
  annotate(geom="text", x=20, y=5, label=improper_input_validation[2], size=6)+
  annotate(geom="text", x=20, y=4, label=deadlock[2], size=6)+
  annotate(geom="text", x=15, y=3, label=use_after_free[2], size=6)+
  annotate(geom="text", x=15, y=2, label=file_descriptor_leak[2], size=6)+
  annotate(geom="text", x=10, y=1, label=double_free[2], size=6)+
  
  xlab("") + 
  ylab("") + 
  scale_fill_manual(values = palette, guide = guide_legend(reverse=TRUE))+
  theme(panel.background = element_rect(fill = "#FAF0E6")
        ,axis.text = element_text( face="bold", 
                                   size = my_axis_size, 
                                   colour = my_axis_color),
        legend.position = "bottom"
        ,legend.title=element_blank()
        ,legend.text = element_text(size = my_legend_size, 
                                    face = "bold"),
  )+

  geom_text(aes(label=..count..),
            stat = 'count',
            position = position_stack(vjust = 0.5), size=6) 
  

ggsave("typeDist.pdf", width=10)

###################################RootCause Distribution by Libraries############################################

my_axis_size <- 16
my_title_size <- 12
my_legend_size <- 13
my_axis_color="black"

root_data <- table(vuls$`Root cause High level`)
root_data <- sort(root_data, decreasing = F)
root_name <- as.data.frame(root_data)$Var1
root_name <- as.array(root_name)

ima <- table(vuls$`Root cause High level` == 'Invalid Memory Access')
dtri <- table(vuls$`Root cause High level` == 'Data Type Range Issue')
toapi <- table(vuls$`Root cause High level` == 'Tensor or Array Property Issue')
mrmi <- table(vuls$`Root cause High level` == 'Memory Release Management Issue')
ibl <- table(vuls$`Root cause High level` == 'Inconsistent Business Logic')
ci <- table(vuls$`Root cause High level` == 'Concurrency Issue')
frvi <- table(vuls$`Root cause High level` == 'Function Return Value Issue')
others_root <- table(vuls$`Root cause High level` == 'Others')
ai <- table(vuls$`Root cause High level` == 'API Inconsistency')
di <- table(vuls$`Root cause High level` == 'Data Type Inconsistency')
ier <- table(vuls$`Root cause High level` == 'Improper Error Reporting')
imo <- table(vuls$`Root cause High level` == 'Invalid Math Operation')
lsob <- table(vuls$`Root cause High level` == 'Limited Stack or Buffer Size')
oor <- table(vuls$`Root cause High level` == 'Out of Bound Read')

vuls$`Root cause High level` = factor(vuls$`Root cause High level`, levels = root_name)


vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

p <- ggplot(vuls, aes(y=`Root cause High level`, fill = Library))
p + geom_bar( alpha = 0.9) +
  annotate(geom="text", x=85, y=14, label=ima[2], size=6)+
  annotate(geom="text", x=85, y=13, label=dtri[2], size=6)+
  annotate(geom="text", x=75, y=12, label=toapi[2], size=6)+
  annotate(geom="text", x=70, y=11, label=mrmi[2], size=6)+
  annotate(geom="text", x=68, y=10, label=ibl[2], size=6)+
  annotate(geom="text", x=50, y=9, label=ci[2], size=6)+
  annotate(geom="text", x=45, y=8, label=frvi[2], size=6)+
  annotate(geom="text", x=43, y=7, label=others_root[2], size=6)+
  annotate(geom="text", x=40, y=6, label=ai[2], size=6)+
  annotate(geom="text", x=37, y=5, label=di[2], size=6)+
  annotate(geom="text", x=18, y=4, label=ier[2], size=6)+
  annotate(geom="text", x=14, y=3, label=imo[2], size=6)+
  annotate(geom="text", x=12, y=2, label=lsob[2], size=6)+
  annotate(geom="text", x=10, y=1, label=oor[2], size=6)+
   
  xlab("") + 
  ylab("") + 
  scale_fill_manual(values = palette, guide = guide_legend(reverse=TRUE))+
  theme(panel.background = element_rect(fill = "#FAF0E6")
        ,axis.text = element_text( face="bold", 
                                   size = my_axis_size, 
                                   colour = my_axis_color),
        legend.position = "bottom"
        ,legend.title=element_blank()
        ,legend.text = element_text(size = my_legend_size, 
                                    face = "bold"),
  )+
  
  geom_text(aes(label=..count..),
            stat = 'count',
            position = position_stack(vjust = 0.5), size=6) 


ggsave("rootDist.pdf", width=10)



###################################Symptoms by Libraries############################################

my_axis_size <- 16
my_title_size <- 12
my_legend_size <- 13
my_axis_color="black"


symptom_data <- table(vuls$`Symptom Vis`)
symptom_data <- sort(symptom_data, decreasing = F)
symptom_name <- as.data.frame(symptom_data)$Var1
symptom_name <- as.array(symptom_name)

seg_fault <- table(vuls$`Symptom Vis` == 'Segmentation Fault')
crash <- table(vuls$`Symptom Vis` == 'Crash')
unexpected_behavior <- table(vuls$`Symptom Vis` == 'Unexpected Behavior')
resource_consumption <- table(vuls$`Symptom Vis` == 'Resource Consumption')
hang <- table(vuls$`Symptom Vis` == 'Hang')
other <- table(vuls$`Symptom Vis` == 'Others')

vuls$`Symptom Vis` = factor(vuls$`Symptom Vis`, levels = symptom_name)


vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

p <- ggplot(vuls, aes(y=`Symptom Vis`, fill = Library))
p + geom_bar( alpha = 0.9) +
  annotate(geom="text", x=174, y=6, label=seg_fault[2], size=6)+
  annotate(geom="text", x=138, y=5, label=crash[2], size=6)+
  annotate(geom="text", x=136, y=4, label=unexpected_behavior[2], size=6)+
  annotate(geom="text", x=122, y=3, label=resource_consumption[2], size=6)+
  annotate(geom="text", x=50, y=2, label=hang[2], size=6)+
  annotate(geom="text", x=23, y=1, label=other[2], size=6)+
  xlab("") + 
  ylab("") + 
  scale_fill_manual(values = palette, guide = guide_legend(reverse=TRUE))+
  theme(panel.background = element_rect(fill = "#FAF0E6")
        ,axis.text = element_text( face="bold", 
                                   size = my_axis_size, 
                                   colour = my_axis_color),
        legend.position = "bottom"
        ,legend.title=element_blank()
        ,legend.text = element_text(size = my_legend_size, 
                                    face = "bold"),
  )+
  
  geom_text(aes(label=..count..),
            stat = 'count',
            position = position_stack(vjust = 0.5), size=6) 


ggsave("symptomDist.pdf", width=10)


###################################Fixing Patterns by Libraries############################################

my_axis_size <- 16
my_title_size <- 12
my_legend_size <- 13
my_axis_color="black"


fix_data <- table(vuls$`Fixing pattern high level`)
fix_data <- sort(fix_data, decreasing = F)
fix_name <- as.data.frame(fix_data)$Var1
fix_name <- as.array(fix_name)

mbl <- table(vuls$`Fixing pattern high level` == 'Modify Business Logic')
acatp <- table(vuls$`Fixing pattern high level` == 'Adding Checker for Arrays or Tensors Property')
hdti <- table(vuls$`Fixing pattern high level` == 'Handle Data Type Inconsistency')
hmri <- table(vuls$`Fixing pattern high level` == 'Handle Memory Release Issue')
cmfrv <- table(vuls$`Fixing pattern high level` == 'Checking or Modifying Functions Return Value')
ier <- table(vuls$`Fixing pattern high level` == 'Improved Error Reporting')
hai <- table(vuls$`Fixing pattern high level` == 'Handle API Issues')
acnpd <- table(vuls$`Fixing pattern high level` == 'Adding Checker for Null Pointer Dereference')
aoc <- table(vuls$`Fixing pattern high level` == 'Adding Overflow Checker')
other <- table(vuls$`Fixing pattern high level` == 'Others')
marl <- table(vuls$`Fixing pattern high level` == 'Modifying or Adding Resource Locking')
ri <- table(vuls$`Fixing pattern high level` == 'Resource Initialization')
mmo <- table(vuls$`Fixing pattern high level` == 'Modify Mathematical Operation')
acr <- table(vuls$`Fixing pattern high level` == 'Adding Checker for Recurrsion')
isbs <- table(vuls$`Fixing pattern high level` == 'Increase Stack or Buffer Size')


vuls$`Fixing pattern high level` = factor(vuls$`Fixing pattern high level`, levels = fix_name)

vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

p <- ggplot(vuls, aes(y=`Fixing pattern high level`, fill = Library))
p + geom_bar( alpha = 0.9) +
  annotate(geom="text", x=130, y=15, label=mbl[2], size=6)+
  annotate(geom="text", x=100, y=14, label=acatp[2], size=6)+
  annotate(geom="text", x=80, y=13, label=hdti[2], size=6)+
  annotate(geom="text", x=70, y=12, label=hmri[2], size=6)+
  annotate(geom="text", x=57, y=11, label=cmfrv[2], size=6)+
  annotate(geom="text", x=40, y=10, label=ier[2], size=6)+
  annotate(geom="text", x=37, y=9, label=hai[2], size=6)+
  annotate(geom="text", x=35, y=8, label=acnpd[2], size=6)+
  annotate(geom="text", x=32, y=7, label=aoc[2], size=6)+
  annotate(geom="text", x=31, y=6, label=other[2], size=6)+
  annotate(geom="text", x=26, y=5, label=marl[2], size=6)+
  annotate(geom="text", x=17, y=4, label=ri[2], size=6)+
  annotate(geom="text", x=15, y=3, label=mmo[2], size=6)+
  annotate(geom="text", x=8, y=2, label=acr[2], size=6)+
  annotate(geom="text", x=7, y=1, label=isbs[2], size=6)+

  xlab("") + 
  ylab("") + 
  scale_fill_manual(values = palette, guide = guide_legend(reverse=TRUE))+
  theme(panel.background = element_rect(fill = "#FAF0E6")
        ,axis.text = element_text( face="bold", 
                                   size = my_axis_size, 
                                   colour = my_axis_color),
        legend.position = "bottom"
        ,legend.title=element_blank()
        ,legend.text = element_text(size = my_legend_size, 
                                    face = "bold"),
  )+
  
  geom_text(aes(label=..count..),
            stat = 'count',
            position = position_stack(vjust = 0.5), size=6) 


ggsave("fixingDist.pdf", width=10)


###################################Affected components############################################

my_axis_size <- 16
my_title_size <- 12
my_legend_size <- 13
my_axis_color="black"


com_data <- table(vuls$`Components high level`)
com_data <- sort(com_data, decreasing = F)
com_name <- as.data.frame(com_data)$Var1
com_name <- as.array(com_name)

kernel <- table(vuls$`Components high level` == 'Kernel')
num_op <- table(vuls$`Components high level` == 'Numeric Operation')
library <- table(vuls$`Components high level` == 'Library')
others <- table(vuls$`Components high level` == 'Others')
platform <- table(vuls$`Components high level` == 'Platform')
integration <- table(vuls$`Components high level` == 'Integration')
runtime <- table(vuls$`Components high level` == 'Runtime')
optimization <- table(vuls$`Components high level` == 'Optimization')
contribution <- table(vuls$`Components high level` == 'Contribution')
framework <- table(vuls$`Components high level` == 'Framework')
computation_graph <- table(vuls$`Components high level` == 'Computation Graph')



vuls$`Components high level` = factor(vuls$`Components high level`, levels = com_name)

vuls$Library=factor(vuls$Library, levels = c("Tensorflow","PyTorch","Sickit-Learn", "Numpy", "Pandas"))

p <- ggplot(vuls, aes(y=`Components high level`, fill = Library))
p + geom_bar( alpha = 0.9) +
  annotate(geom="text", x=162, y=11, label=kernel[2], size=6)+
  annotate(geom="text", x=125, y=10, label=num_op[2], size=6)+
  annotate(geom="text", x=95, y=9, label=library[2], size=6)+
  annotate(geom="text", x=82, y=8, label=others[2], size=6)+
  annotate(geom="text", x=72, y=7, label=platform[2], size=6)+
  annotate(geom="text", x=23, y=6, label=integration[2], size=6)+
  annotate(geom="text", x=23, y=5, label=runtime[2], size=6)+
  annotate(geom="text", x=19, y=4, label=optimization[2], size=6)+
  annotate(geom="text", x=17, y=3, label=contribution[2], size=6)+
  annotate(geom="text", x=16, y=2, label=framework[2], size=6)+
  annotate(geom="text", x=15, y=1, label=computation_graph[2], size=6)+

  
  xlab("") + 
  ylab("") + 
  scale_fill_manual(values = palette, guide = guide_legend(reverse=TRUE))+
  theme(panel.background = element_rect(fill = "#FAF0E6")
        ,axis.text = element_text( face="bold", 
                                   size = my_axis_size, 
                                   colour = my_axis_color),
        legend.position = "bottom"
        ,legend.title=element_blank()
        ,legend.text = element_text(size = my_legend_size, 
                                    face = "bold"),
  )+
  
  geom_text(aes(label=..count..),
            stat = 'count',
            position = position_stack(vjust = 0.5), size=6) 


ggsave("compDist.pdf", width=10)

