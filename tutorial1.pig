-- Load the nyse_stocks data, filter the records by IBM and calculate the 
-- average of closing stock prices

-- pig arguments:  -useHCatalog
-- step 1 load the data
a = LOAD 'nyse_stocks' using org.apache.hcatalog.pig.HCatLoader();
-- step 2 select all records starting with IBM
b = filter a by stock_symbol == 'IBM';
c = group b all;
-- step 3 iterate and average
d = foreach c generate AVG(b.stock_volume);
dump d;