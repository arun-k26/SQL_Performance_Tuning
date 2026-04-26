/* 

    In this we will learn about what is BAD SQL and what kind of actions we need to take wen you find the BAD SQL. Thee good part of the SQL is, you can get the same result with many different SQL statements.

    All of them have the same result but almost all of them with different performance rates. So, some of them user much more resources than it could be, maybe 10times or hundred of times it could be.

    So, these kind of queries are called as BAD SQL or some people called as POOR PERFORMING SQL.

    There are 4 major reasons that affect the performance of our queries. 
        1. Unnecessory PARSE TIME : 
            When we run our query, the first thing that the database server does is , "PARSING" it. Parsing simply means that your query is valid, then allocating a PRIVATE SQL AREA for this statement, and then generating the execution plan. So, there is a hardwork here.
                WE SEE -> PARSING -> IN FUTURE LECTURE
            
            So, if you SQL needs much more parsing operations then it could, it is a BAD SQL and it will decrease the performance. In this situation, we need to take a tuning action for this.

        2. Unnecessory I/O Operations :
            We can think I/O operations as reading data from the disc. The problem is, while sometimes you read 1000 blocks to get 1row, sometimes you read 1block to get it.

            It depends on how you created your query, or if there is an index etc. So, if your query reads too much data blocks to get tje data, that means your query here excessive I/O operations. This makes our query as BAD SQL.

        3. Unnecessory CPU Time : 
            If your make some joins, sorts, calculations., etc. these operations are done by CPU and MEMORY. So, if you make an unnecessory join or sort operations., etc or if you do them with wrong methods, your query will consume too much CPU cycles than it could be.

        4. Unnecessory WAITS : 
            When you run your query, there might be a lot of wait times until you recieve the result. It can wait for its turn in the CPU, or it wait on the network,. etc.

            Because, a database is used by multiple users and a single CPU handles hundred or may be thousands of users at a time. When your query reaches the database server, there are 2 major things that form the overall time. The time passing waits and the execution.

            *************** TIME ON WAIT (CPU) + TIME ON EXECUTION = DB TIME ***************

            If your query has lot of waits you can tune your query by either changing it or decreasing the network or CPU loads.

            If your query will need to wait its turn for a while. So, you may need to tune your system or network too. A BAD SQL is a query that performs excessive parse time, I/O operations, CPU times and waits.

            FOR EXAMPLE ,
                If you wait seconds or minutes to retrive a result, I recommend you to check your query. Because, most of the times, a query returns faster than 1SECOND.
            
        THE REASON OF A BAD SQL :
            Bad design, Poor Coding, Inefficient Execution Plan. If your query is BAD SQL, you will either need to change your code or guide the optimizer to create a better execution plan.

*/