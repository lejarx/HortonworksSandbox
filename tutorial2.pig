batting = LOAD 'Batting.csv' using PigStorage(',');
runs_raw = FOREACH batting GENERATE $0 as playerID, $1 as year, $8 as runs;
runs = FILTER runs_raw BY runs > 0; 
grp_data = group runs by (year);
max_runs = FOREACH grp_data GENERATE group as grp, MAX(runs.runs) as max_runs;
join_max_run = JOIN max_runs by ($0, max_runs), runs by (year, runs);
join_data = FOREACH join_max_run GENERATE $0 as year, $2 as playerID, $1 as runs;
dump join_data;
-- (1871,barnero01,66.0)
-- (1872,eggleda01,94.0)
-- (1873,barnero01,125.0)
-- (1874,mcveyca01,91.0)
-- (1875,barnero01,115.0)
-- (1876,barnero01,126.0)
-- (1877,orourji01,68.0)
-- (1878,highadi01,60.0)
-- (1879,jonesch01,85.0)
-- (1880,dalryab01,91.0)
-- (1881,gorege01,86.0)
-- (1882,gorege01,99.0)
-- (1883,stoveha01,110.0)
-- (1884,dunlafr01,160.0)
-- (1885,stoveha01,130.0)
-- (1886,kellyki01,155.0)
-- (1887,oneilti01,167.0)
-- (1888,pinknge01,134.0)
-- (1889,griffmi01,152.0)
-- (1889,stoveha01,152.0)
-- (1890,duffyhu01,161.0)
-- (1891,brownto01,177.0)
-- (1892,childcu01,136.0)
-- (1893,longhe01,149.0)
-- (1894,hamilbi01,192.0)
-- (1895,hamilbi01,166.0)
-- (1896,burkeje01,160.0)
-- (1897,hamilbi01,152.0)
-- (1898,mcgrajo01,143.0)
-- (1899,keelewi01,140.0)