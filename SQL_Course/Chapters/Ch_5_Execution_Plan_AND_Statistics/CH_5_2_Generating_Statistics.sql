/* 

    For a better execution plan creation, the optimizer needs to have uptodate statistics. The database generates statistics continuously. However, it is the costly operation, so it does not generate completely all the time. It makes the statistics generation idle time. 

    But if it cannot find a time to generate because of CPU load, or may be you have just change the structure of the volume of the table, etc.

    In this situation, statistics can be unrealistic. We called unreadlistic statistics are called as OLD or AGED statistics. TO generate the better execution plan need to update the statistics.

        Statistics types : 1. SYSTEM STATISTICS         2. OPTIMIZER STATISTICS

        1. SYSTEM STATISTICS : 
            used by the query optimizer to estimate I/O and CPU Cost. If you add another CPU, disk or any hardware to your server on that time you need to update the system statistics.

            exec dbms_stats.gather_system_stats('start');

            ONLY DBA CAN DO THIS. IT MAY TAKE MORE TIME TO COMPLETE.

            select * from sys.aux_stats$;       -> This having the complete details of the statistics.

            Without updating the system statistics, if we update the optimizer statistics meand that is not the efficient way.

        2. OPTIMIZER STATISTICS :
            Optimizer statistics are the collection of the statistics for the database objects like table, columns, index, etc.
            We can update statistis automatically or normally.

            2 WAYS TO GENERATE OPTIMIZER STATISTICS :
                1. ANALYZE TABLE <TABLE_NAME> COMPUTE STATISTICS;  -> This is not used by anyone.
                2. DBMS_STATS PACKAGE : 
                    exec dbms_stats.gather_database_stats;

*/
