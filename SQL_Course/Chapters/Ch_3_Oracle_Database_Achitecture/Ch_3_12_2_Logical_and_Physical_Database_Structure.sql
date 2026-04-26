/* 

    The disc stores the data in individual bits. If you want to stire a data if 4bits, it is stored in the sequential 4bits.
    The disc management is organized by the operating system. So, they do it in a different way. They have an allocation unit size like 2 kilobytes etc.

    So, even if you write 1byte of data, it will write that into one unit. Datablock is the smallest unit of memory and size 2KB - 32KB

    Extent is the combination of several data blocks. It is used for storing the special type of information.

    A segment is the combination of many extents. There are 4 types of segment. They are :
        1. Data Segment                     2. Index Segment
        3. Undo Segment                     4. Temporory Segment
        Temporory segment are created to provide a temporory workarea for the SQL statement to complete the execution. Segments are used to store the big data like tables, index, etc.
    
    TableSpace are the combination of segments. Used for grouping the related data in one container. There are 2 types of Tablespaces. They are :
                1. TEMPORORY TABLESPACE
                    Stores the temporory data of a session
                2. PERMANENT TABLESPACE
                    Stores the persistent schema objects.
        Database defaultly hase 2 tablespaces. They are SYSTEM, SYSAUX

    SCHEMA is the collection of database objects that are owned by a database user. Thse object contains table, procedure, package, etc.

*/