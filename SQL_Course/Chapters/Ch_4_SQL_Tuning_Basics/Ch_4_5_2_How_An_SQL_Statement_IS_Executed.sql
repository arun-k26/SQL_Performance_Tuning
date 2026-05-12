/* 

    1. First is your SQL is syntaxically correct or not. If not it will throw error.

    2. Semantic check means if your table is there in the database, which column will be there if you used select *, etc. This is stored in the data dictionary cache.

    3. Previlege check means if the user who runs the query has the appropriate privilege to run it or not. This is also stored in the previlege, it returns an error and finish the execution.

    4. Since we process a query and store it in the memory for handling with cursor, it creates a private SQL area in the user's PGA. The result of the query will be stored in here for a while.

    5. The next step of my query execution will be finding the execution plan. We know that if the similar query is executed before, its execution plan is stored in the shared SQL area in the shared pool. So, the server checks for any existing execution plan. If yes means we will execute our query directly (SOFT PARSE).

        If your query found in shared pool then the above I mentioned is called SOFT PARSE>.

                        SOFT PARSE === LIBRARY CACHE HIT
        
        There are 2 type of parsing : They are : 1. SOFT PARSE          2. HARD PARSE

        I you do not create an execution plan and get it from the shared pool, this is called as SOFT PARSE. We will always try to parse our queries with a soft parse in tuning approaches. Because, this increase the performance significantly.

        Since the memory of the shared SQL Area is finite, Oracle does not store the statement directly.

        Instead, it creates a hash value for that code and stores that hash value in the library cache. Because, there might be thousands or millions of different queries and storing them all is not considered as a practical way. Instead it stores the hash value of them. SO, once you run your query, a hash value is created for it and this hash is searched as a key for the execution plan in the shared SQL Area. But the important thing is, the text of your query is important. Because, since the hash value is created for the query text, each line is important.

    6. If the related execution plan is not found in the shared pool, then the server will continue for HARD PARSE.


                                                OR


        The first part of a hard parse is allocating some memory in the shared SQL area for this. Because, the new execution plan will be written in here. This allocating can be a little time taking because if the shared SQL area is full, it will delete an aged one to open up a room for new one.
    
    7. OPTIMIZATION is the most important thing in the performance tuning process. The Optimizer is nothing but a software that gets our query as an input and returns the best execution plan. We know that, a query can be executed with so many different ways. The OPTIMIZER needs to calculate several execution plan and select one of them in one second.

*/