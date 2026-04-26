/* 

    ORACLE GUARANTEE that it handles the data loss. So, it take some actions on it, One of these actions is, creating redo log files. When we make a change on the table data by an insert, update, delete, alter, drop, create operation, the Oracle server creates a redo log entries about that changes. Redo Log Entries contains the information about the changes to the database. 

    Actually this is an complicated issue, so no need to confuse you about the redolog entries details. But, it has the changes made to the database with may details.

    SO, WHERE IT IS USED ?
        if somehow you need to recover the database or a table to a previous state, you can use the redolog data for the recovery. 
        
    TWO WAYS TO RECOVER TABLE OR DATABSE :
        1. RECYCLEBIN
        2. RWAN
    
    1. RECYCLEBIN : 
        SYNTAX :
            show recyclebin;
            FLASHBACK TABLE "BIN_NAME" TO BEFORE DROP;

                            or

            FLASHBACK TABLE "TABLE_NAME" TO BEFORE DROP;

            select * from employees;

        This is applicable only if the table is available in the RECYCLEBIN. If it is not in Recyclebin means DBA will take care of it by using the second by RWAN.

        It is working on by once drop the table after 1. They check recyclebin  -> Not there  -> check SYSDATE in the server    ->  Use the bash Command till that SYSDATE they works to recover t he data.

        Redo Log Buffer is a circular Buffer, 
        Rollback is not done with REDO LOG DATA.

*/