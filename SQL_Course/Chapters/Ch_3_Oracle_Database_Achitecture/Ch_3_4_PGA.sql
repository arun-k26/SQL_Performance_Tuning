/* 

    PGA - PRIVATE OR PROGRAM GLOBAL AREA.

    PGA has couple of sub-areas.
                    PGA
                     |
                SESSION AREA
                     |
              PRIVATE SQL AREA
                1. Persisten Area
                2. RunTime Area
                     |
                CURSOR AREA
                     |
               SQL WORK AREA
                1. SORT AREA
                2. HASH JOIN AREA
                3. BITMAP MERGER AREA
                4. BITMAP CREATE AREA
    
    1. SESSION MEMORY AREA :
        When user connects to the database, the database creates a session for thta user. This session information is stored in this area. THis session area stores the session variable, logic information, session status etc.

        So, if you open unnecessary connnections, you should know that they all have some memory in the database.
    
    ***********************************************************************************

    2. PRIVATE SQL AREA :
        1. PERSISTANT AREA
            The Persistant area contains the bind variable values of the cursor. We know that each query is turned into a cursor in the database. Either you create explicit or implicit cursor.

        2. RUNTIME AREA :
            Runtime Area stores the execution state information.
    
    ***********************************************************************************

    3. CURSOR AREA :
        This area stores the information of the cursor.

    ***********************************************************************************

    4. SQL WORK AREA :
        This SQL Work Area is used to operate the data returned from the disc. As I mentioned before, the data is read from the disc with its memor order. How it is stored ?
        
        1. SORT AREA :
            The data read from the disc is sorted because of the order by, group by, roll-up or window command of our queries.
            
            Now we get the conclusion all the session operation are stored in the PGA.

            If you assign less memory for the PGA it will decrease the performace. SO, if you assign large memory for the PGA it will increase the performance.
                THIS HAPPEND AND HANDLED BY ORACLE BY INBUILD OR AUTOMATICALLY.

*/