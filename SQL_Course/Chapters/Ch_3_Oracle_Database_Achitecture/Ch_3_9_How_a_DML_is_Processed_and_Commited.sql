/* 

    This is very important to know because we are not only tuning the SQL queries, we can tuning the DML also.
    When we run the DML code, then server checks the SHARED SQL AREA in the library cache to find if there are any similar SQL Statements in there.

    Checks the Data dictionary cache and checks if the related table info is there, then there is no need to get the previllages or defenitions of the related table.

    If these data are not available in the data dictionary cache and library cache, these are returned from the disc and written into these areas.

    So, when the data is ready, it changes the query is true. When this steps are done, it go to the buffer cache for the related data and the UNDO SEGMENTS.

    If you do a DML operation, the related data is written to the buffer cache first. This is the valid for both querying and DML operation.

    So, if the data that needs to be modified is not in the buffer cache, the server fetches the data  from the disc and writes them into the BUFFER CACHE.

    Once the data is ready in the buffer cache, it locks the related blocks for the other user.

    All of your changes are written into the related blocks in buffer cache. These changed blocks are called as DIRTY BLOCKS.

    The changes are applied to the redo log buffer before the BUFFER CACHE. The server returns the feedback for the changes.
    

*/