/* 

    If the optimizer creates a bad execution plan, we will have a poorly performing query. To handle that, we need to guide a optimizer to be able to generate a better execution plan.

    So, WHY DO WE NEED AN OPTIMIZER? WHY DON'T ORACLE DIRECTLY RUN YOUR QUERY?

    We need to optimize our query execution ORACLE does that Automatically by using the OPTIMIZER.

    So, optimizer is a software that is dedicated to finding the best execution plan as quickly as possible... So, with better execution plan, our queries may run may be 100x faster or maybe ad this will decrease the hardwarer cost so much.

        QUERY A 1 second

        QUERY B 1 minute

        QUERY C 1 hour

        The optimizer must find the one which returns in 1 second, the fastest one. 

        select * from products where prod_category = 'Electronics';

        The first thing that the optimizer does is, checking the schema information. If there is any index. Based on the schema information, it generates possible access path. Now here, it found that, since this table has an index on the prod_category column, it can read the table by using the index.

    2. Reading the Whole Table 
        There might be many different access path. Especially when we join the table, it will have so mant different access path. Once it found all the access path to choose it precisely, it needs to check the STATISTICS.

        As we know, ORACLE creates many statistics for our table, index, etc. Now here, it checks the statistics of the product table for the prod_category column.

        If our column is selective or not ?

            If the result of our query forms only 1% of the table, that means , our query is pretty selective.

            So, we can use our index. But, what if the result is more than 25% of the total rows of our table?

*/