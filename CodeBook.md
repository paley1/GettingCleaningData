CodeBook
---

###Variables
- `x.train`, `y.train`, `x.test`, `y.test`, `subject.train`, and `subject.test` contain the data from the downloaded files from the provided dataset.
- `x.data`, `y.data`, and `subject.data` merge the previous corresponding datasets from "train" and "test" 
- `features` contains the correct names for the x.data dataset, which are applied to the column names stored in `mean.std.features`, a numeric vector used to extract the desired data
- `all.data` merges `x.data`, `y.data`, and `subject.data` in a combined dataset
- `average.data` contains the relevant averages in part 5, which are then written into a .txt file that is called `averagedata.txt`