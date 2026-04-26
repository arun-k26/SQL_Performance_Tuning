/* 

    The database buffer cache is the largest memory area in SGA. This memory areas stores the copies of the datablock that are read from the disc. THis data is available for all the users.
    
    When the first user runs a query, the related data is read from the disc and stored it in the BUFFER CACHE.

    So, when any other user, or may be te same user want to reach to the same data, before checking the disc the server checks the buffer cache first. If all the data we need is already in the buffer cache, it can read the data from the BUFFER CACHE directly.

    If some of the data is not in the BUFFER CACHE but some of it is already in the buffer cache, it goes to the disc only for the absent block.

    If there is no related data with out query in the buffer cache, the server reads all the data from the fisc into the BUFFER CACHE.


    WHY TO READ INTO BUFFER CACHE ???
        The reason is it is much faster than the DISC.
        So, if the same data will be used for the next times, its better to store it in the memory.
        If your are making a join operations, it is an CARTESIAN PRODUCT, then all the rows of the first table will join with the other one.
    
    If we do that by reading from the disc all the time, it would be a very costly operation. So, the data is stored in the buffer cache and read from here rapidly.

    It is maintained with complex algorithm. Since, the memory is finite, we cannot  store all the data in the buffer cache. This kind of database is called INMEMORY DATABASE. But storing all the data in the memory is really expensive and ORACLE does not do that in this way.

    So, the buffers in the buffer cache are managed by the COMPLEX ALGORITHM.
    It stores the most recently used data and the most touched one. It does not delete the frequently used one it deletes the least used one. Between the data buffer cache and the database disc we have the database write process

    So, database write process handles the write operations to the disc. So, reading from the dic is handled by the server. It reads the related data from the disc and stores it into the buffer cache, Towrite to the disc from the buffer cache, ORACLE uses databases writer process.

        If you make an update statement on a block in the buffer cache, It is not directly updated to the disc. You make the update to the block the buffer in the buffer cachem when you commit, there blocks are written to the DISC with using the DATABASE WRITTER PROCESSOR.

        This also increases the performance, by writting the multiple data in a single step. Buffer not only stores the data, it also stores the INDEX DATA, too.....

*/