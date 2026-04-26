/* 

    in this we will learn about when to tune the SQL statement and the reasons of show queries. 
    1. SQL tuning is the continuous process.
    2. You need to tune your queries.
        1. WHILE CREATING
            Once you add your query in an application or in an report, this will work for several time. Maybe your query works 10 times slower than if could be, but mostly its execution time will under a second. So, this may not be consider as a need for tuning. 

            But if we look at the whole picture, there will be thousands of code working may be in one second.

            So, the total cost of those queries will be really high. So, if you tune your queries write creating them we will se a significant performance gain on the database in the end. So, i highly recommended you to consider the tuning technique for each query when you creating the code. It will take so much time, but its effect will gradually increase on performance.
        
        2. TUNING AFTER THE CREATION
            In time, even if you have tuned your query, you may need to tune them again. Because, if the structure of your table changes, or if an new index is created or dropped or if the data amount changes in an table, the same query might work much slower.

            Or may be you could not tune better in the past, but after a new index creation or something else, you can tune your query again and make it run much faster.

        WHEN TO DECIDE TUNING ? 
            1. Ofcourse we cannot check all the queries every day, but as we saw before, some of the queries work significantly more consumnig than the others.
            
            We call these queries as "TOP CONSUMING" queries. These queries do not exceed 5% total queries or mostly it is much less.
            But most of the times, the top consuming queries use 80% of the total resources. THIS IS REALLY HUGE RATIO.
            
            ***********************LESS THAN 5% OF THE TOTAL QUERY USES 80% OF THE TOTAL RESOURCES.***********************
                SO, the main part is to deal with so fewer queries. We can find thesee top consuming queries with a simple query.

            *********************** AS WE KNOW THAT ORACLE CARES THE STATISTICS SO MUCH AND IT CONTINUOUSLY CREATES AND SAVES SO MANY DIFFERENT KINDS OF STATISTICS. ***********************

            2. The next reason that you decide to tune a code is, mostly the complaint of the users. In time the user, or business part of your company say that MY SCREEN FREEZES or it is working fine until today, but it looks slow now. I did not change anything.

            But, we know something has defenitely changed.

        THE REASON OG PERFORMANCE LOSS : 
            1. STRUCTURAL CHANGE :
                Table structure changes or create or drop index., etc. Any structural change can affect the performance of your query so much.

            2. CHANGE IN THE DATA VOLUME :
                If your table grows or become smaller, the execution plan of your queries may change. This may change unintentional waits, CPU Times, etc. Maybe you will need to change the type of your index, or maybe you will need to use some hints on the queries., etc. So, any change affecting the size of the tables any cause a performance loss. 

            3. APPLICATION CHANGES :
                In your application you may send characters instead of numbers to a statement ot you may stop sending bind variables., etc. These might be several changes that might affect your queries. So, your query may run slower after these changes.
            
            4. AGED STATISTICS :
                The statistics may get OLD.
                Oracle creates statistics continuously and the execution plan are created based on these statistics. So, if your statistics are not up to date, your query performance may decrease. You will see the statistics deeply.
            
            5. DATA BASE UPGRADES :
                A new version of the database will provide better performance for your queries. But, this may not be true for all the times. So some of our queries may not work for after upgrade.
            
            6. DATABASE PARAMETER CHANGE :
                Some times your DBA can change some parameters like PGA SIZE, SGA SIZE,. etc. This can increase or decrease the performance of your queries.
            
            7. OPERATING SYSTEM AND HARDWARE CHANGES :
                While companies are getting bigger and bigger, the may add new hardware or change the operating system which your database tuns on it. These are generally fone for improving the performance. But sometimes, it may decrease the performance of some individual queries o maybe all of them.

*/