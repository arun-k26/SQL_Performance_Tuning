/* 

    When a transaction modifies any data, the database server copies the original data from the disc and store them into a memory before modifying it. The original copy of related data is called UNDO DATA.

    Another copy of the related data is also written into the buffer cache and all the changes are done in those blocks.

    So, UNDO DATA is kept unchanged.

    1. If you want to rollback your changes or if your changes need to be rollback because of a system failure, the UNDO blocks are used to for the rollbacks.

    2. PROVIDING READ CONSISTENCY.
        When we make any change to the tables, only we can see these changes until we commit them, this is provided by the UNDO DATA.

    If you change any data in your session, that is shown only to you, it will not to the other users. Som when you commit then the every users see the changed data.

        BLOCK > EXTENT > SEGMENTS > TABLESPACE

        1. BLOCK    
            A block is te smallest logical group of data in memory or disc.
        
        2. EXTENT
            The larger one of the logical database space is EXTENT.
        
        3. SEGMENTS
            Segments are a larger memory are which includes a group of extents like
                example : EXTENT
                          EXTENT
                          EXTENT
        
        4. TABLESPACE 
            A larger memory including segments is called as tablespace.

*/