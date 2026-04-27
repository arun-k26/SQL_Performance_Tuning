/* 

    The first step of performance tuning for the developer is , designing the schema effectively. If you design tables, index, etc in a bad way, you will face the heavy performance issue.

    MOST IMPORTANT THINGS FOR THE PERFORMANCE WHILE CREATING THE GOOD SCHEMA :
    1. SELECT THE DATA TYPES CAREFULLY :
        If your table column need length 4 value should be length 4. If you declate your column for length 1000 but you put the value only length 4 means then you will see the DATA CONSISTENCY PROBLEM.

        Try to select exactly the same datatype between the parent and child keys.
        FOR EXAMPLE :
            table   : department                      table   : employees
            column  : id number                       column  : id number
            
            else -> The main rason is if you join these two tables, Oracle will try to convert one datatype to another for all the rows. So, this will need so much CPU usage and decrease the performance.
            So, uses the related datatype for each column

            FOR EXAMPLE :
                CORRECT                                                                     INCORRECT
            name         varchar2                                                       name         varchar2
            created_date date                                                           created_date varchar2
            id           number                                                         id           varchar2

    2. ENFORCE DATA INTEGRITY :
        When you run your code, Oracle creates an execution plan to execute your query. This execution plan is created considering the connections of each table, datatypes, etc.
        So, if you don't allocate the primary key and foreign key correctly, the queries on these tables face performance issue.
    
    3. USE NORMALIZATION WELL :
        If you create your table based on the normalization rules, you will most probably handle the data reduncy problem and will have a better performance.
        NORMALIZATION is the process of structuring the database tables to remove reduncy and ensure data integrity using rules called normal forms (1NF, 2NF, 3NF, etc).

        BEFORE and AFTER NOMALIZATION : REFER : Ch_4_3_2_Effective_Schema_Design_NORMALIZATION.jpeg

    4. SELECT RIGHT TABLE TYPE : 
        These are different types of tables in Oracle Database. We know, the most used one is 
            1. HEAP ORGANIZED TABLE
            But there are some more also, they are :
                2. Index Clustered Table
                3. Hash Clustered Table
                4. Index Organize Table
                5. External Table
            So, if you use the right table type, you will have better performance on your queries.

    5. CREATING CLUSTERS :
        If you are joining the same tables again and again, you can cluster then. 
        WE WILL SEE CLUSTER IN FURTHER LECTURE
        But, clustering joined tables will increase the performance most of the times.
    
    6. USE INDEX OFTEN AND SELECT INDEX TYPE CAREFULLY :
        The most useful way of performance increase is using indexes. There are different methods and types of creating index. We will see when to create an index in the further lectures.

    7. CREATE INDEX ORGANIZED TABLE :
        Index organized table is a table stored in an index. If a table is not so big and queried so many times, you can create as index orgainzed table for it.

*/