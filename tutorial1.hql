-- dataset : NYSE-2000-2001.tsv
--           uploaded as nyse_stocks

-- get records
select * from nyse_stocks;

-- get columns in the table
describe nyse_stocks;

-- count the records
select count(*) from nyse_stocks;

-- count and get specific records 
select count(*) from nyse_stocks where stock_symbol="IBM";
select * from nyse_stocks where stock_symbol="IBM";