/* 
                        SHARED POOL
     -------------------------------------------------
    |                                                | 
    | -------------     -------------------------    |
    | | SHARED SQL |    | DATA DICTIONARY CACHE |    |
    | |    AREA    |    |________________________    |
    | |_____________                                 |
    |                   ---------- ---------------   |
    |   LIBRARY CACHE   | OTHERS | | RESULT CACHE |  |
    |                    ---------- ---------------- |
    |________________________________________________

    The shared pool is one of the SGA COMPONENT. SGA has some components that shared by all the sessions or PGA.
    Shared POOL is the container of these sub-caches.
    
    1. DATA DICTIONARY CACHE :
        Millions of user uses the same table. So, each we go to disc and fetch it will take more timie. to eliminate this, first this check the table is available or not, columns available or not, Thse database defenition objects stored inthis cache. inside of shared pool. THis shares these to the millions of uses.

        Stores the definition of the database objects anad their permissions.
    
    **********************************************************************************************************

    2. RESULT CACHE :
        If the query is being used repeated in time, the result of the query is stored in the result cache and used for the next call. Result Cache does not stores only the query result, but also stores the function results.

        If a function is repeated used with returning the same result, it will also be stored in here and handled to the next call from the result cache.

        It reaches the maximum memory then it free up the spache which was used least time by the sesion then allocate the memory for the new one.

        ***********************WE can command need to store in result cache or not****************************

    **********************************************************************************************************

    3. LIBRARY CACHE :
        When you run the SQL Query, the databases does not directly go to the disc. Because your DB has terabyte size, YOU table has gigbyte size. This is inefficient to do each time. So, inorder to do this, Oracle creates some explain plan how to read the data from the disc or from the buffer cache

        It may use some indexes, or may be reading the whole table will be better, or joining the tables by which type of join method will be more effiecient etc.

        There are hundred of ways to execurte  our query and the server need to find the best plan. So, generating this plan is an costly operations. The server need to lookup many places, view, statistics, etc. to generate it.

        So, it take some time and many I/O operations. But most of the times, we see that , many of queries are very similar or sometimes exactly the same.

        ************* SO, USING THE SAME EXECUTION PLAN FOR SIMILAR QUERIES WILL BE MUCH EFFICIENT. *************

        Inorder to do that Oracle stores these execution in the LIBRARY CACHE. and when other session uses the same query now it knows how to read the data directly. This will increase the performance easily.

        The Library cache stores the procedures and packages, and the control structure like locks etc.

*/