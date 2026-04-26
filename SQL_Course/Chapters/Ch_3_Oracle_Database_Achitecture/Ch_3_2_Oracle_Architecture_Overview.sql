/* 

    SHARED POOL:
        1. DATA DICTIONARY CACHE:
            Ex : select * from employees;
            It is a small memory that remembers important details about the database like :
                1. TABLE NAMES
                2. COLUMN NAMES
                3. WHO CAN USE IT
            It check if there is a table in the database or which columns should i return when i use the * keyword.

            So, definition of the table stored in this cache and the server decides if our query is right or wrong by making a check form this CACHE.

            The data in this memory is read by the database tablespace. But inorder to increase the performance, they are copied here for faster access.

        **********************************************************************************************

        2. RESULT CACHE :
            First time in your session, you runs a query, you see that is take some time to return a value. But, when you run the same query again it returns to you immediately.
                LAST TIME   = 5 Seconds.
                NOW         = Immediately.
            If you run the same query bu one or multiple user it stores that memory in the result cache and then return it to the next user when they need.

            Executing the query is not the easy task. Reading from the disc is very costly operation. This increases the performance so much.

            WHAT HAPPENS IF THE DATA IN THE ORIGINAL TABL CHANGE ?
                This time the data will not be same with result cache.
                Because the same query now returns a different result. But we have an different result of the same query.
                At the time the stored result is deleted and new result is stored for the same query in the result cache.
                Not every memory is stored in this cache.

                RESULT CACHE    -> Stores final qeury result
                LIBRARY CACHE   -> Stores SQL STATEMENT AREA + EXECUTION PLAN

        **********************************************************************************************

        3. LIBRARY CACHE:
            The stored SQL Area is availble in the library cache.
            LIBRARY CACHE is manages the size of tese shared SQL area.

            If somehow the memory is not enough for the shared SQL Area, because of saml SGA size or small Shared POOL size. The library cache will free up the size by deleting the unused one and creating the new one or may be increasing the size of one of them etc.

            SO this area is the container or organizer for the shared SQL Area. In shared pool, there are other memories but they are not recommended for our course.

        **********************************************************************************************

        4. DATABASE BUFFER CACHE : 
            Buffer cache is the memory are that stores the data blocks in it for the short period of time.
            The reason to store the same data in the buffer caches is increasing the database performance.
            Because memory is much faster thand the DISC.

            When you run a query, FOR EXAMPLE : Perforam an update, the related data block or acutal data is checked if it is in the buffer cache or not. If it is not in it, it reads from the disc then written here.
            So, related operation is done on that block, that block is written into the disc again. So, Oracle uses the buffer cache for performance data concurrency and consistency.

        **********************************************************************************************

        5. REDO LOG BUFFER CACHE : 
            Redo Log Buffer stores all database changes in memory before they are written to redo log files for recovery purposes.

            EXAMPLE : 
                👉 Like writing in a notebook before updating system 📒

                Notebook = Redo Log Buffer
                Final system = Datafile                

        **********************************************************************************************

        6. JAVA POOL AND STREAMS POOL :
            THis is not important for our course. But, JAVA POOL has the java classes that database need to use and the stream pool handles the stream.

        **********************************************************************************************

            THE OTHER IMPORANT MEMORY AREA IS PGA:
        7. DATA FILES :
                    All the procedure, functions, etc. All the database object are stored in this files. The connection between these disc and memory are are simply established by the database buffer cache and PGA.

                    When you read the data from the disc, this data is stored in the buffer cache for any kind of operations.

                    If you make any changes in the value, first it written to the database buffer cache and then stored into the database disks when you commit them.

                    As you see, PGA do not write anything to the disk directly.

                    The next database disk area is the one that stores in the redolog buffer is constant stored in the redo log disc and deleted from the REDOLOG BUFFER.

*/