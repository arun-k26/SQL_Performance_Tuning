/* 

    Oracle database is a relational database management system and enables the programmers or DBA to control it in many aspects.

    Users run the query and ends with the database disc. The architeture is mainly about the memory.

    Oracle is a multi user database. Millions of User can connect to the same datbase without any problem.

    User process some data to the server and server process and send back to the client. Once they send command to the database server, the server takes control and pushes the statement to the PROGRAM GLOBAL AREA (PGA).

    PGA is a memory are that is dedicated to a single user and every user has its own PGA memory. While my code is interpreting, the session specific data is stored in here and this area can only be read by its own PGA or owner.

    **************EVERY SQL STATEMENT IS EXECUTED WITH AN EXECUTION PLAN.*********************

    So, before running the query the execution plan of our SQL code needs to be created. At that time tuning issue starts.**

    Because the same SQL statement can be executed or may have executed by the same or different user for many times. So, generating the explain plan is a costly operation sometimes.

    So, the SQL DEVELOPS THOUGHT TO TUNE THIS ISSUE.

    So, inorder to do that they created the SHARED POOL AREA (SGA) and store the execution plan in here for further use.

    So, if someone wants to run the same SQL statement, instead of trying to create the same explain plan again, the Oracle server uses the existing execution plan which resides in the shared pool area. 

    It takes the plan from the standard aredand handles in to the users PGA. and this increases the performance.

    ORACLE MEMORY AREA : 1. PGA     2. SGA
        We call this PGA and SGA as MEMORY CACHES.
    
    These SGA and PGA divided in to smaller pices used for different purposes. Basically, the caches are used to improve the performance.

    So, the session specific or private datas stored in the PGA and the common or shared datas are stored in the SGA.

    In these memory area there are some sub-memory areas. They are called as CACHES.

    SGA is 80% > PGA of the total memory. We can store large amount of data in SGA, But at the end, they are simple memory are dedicated for different purposes.

    So, to improve the performance, Oracle has many caches like BUFFER CACHE, REDO LOG CACHE, SHARED POOL, etc.

    SHARED POOL is very larger cache including some sub-caches like Library caches, result caches, etc.

    👤 USER
           │
           ▼
     📝 SQL Query
           │
           ▼
   🧠 SGA (Shared Pool)
   ─────────────────────
   ✔ Library Cache (SQL + Plan)
   ✔ Data Dictionary Cache
           │
           ▼
     🔍 Parse & Check
           │
           ▼
     ⚙ Execution Plan
           │
           ▼
   📦 Buffer Cache (SGA)
   ─────────────────────
   ✔ Data already here? → YES → Fast 🚀
           │
           └── NO ❌
                 ▼
              💾 Disk
                 │
                 ▼
        Store in Cache ✅
           │
           ▼
   🧮 PGA (Processing Area)
   ─────────────────────
   ✔ Sorting
   ✔ Joins
   ✔ Session work
           │
           ▼
        📤 RESULT
           │
           ▼
        👤 USER
        
    SQL → Parse (SGA) → Plan → Execute → Buffer Cache → Disk (if needed) → PGA (processing) → Result
 
    
*/