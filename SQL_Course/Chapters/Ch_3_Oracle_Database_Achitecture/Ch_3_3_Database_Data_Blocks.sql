/*

    All the datas are stored in the blocks for both the disc and memory.
        Oracle does not store the whole table in one block and return it from directly.
        It has different algorith to do that.

        A block is the smallest unit of the database for storing the data. It is a logical unit that consist of multiple operating system blocks. There can be millions or billions of blocks and they stored the actual data in it.

        A block can have a whole table, or couple rows of a table. Or sometimes a block can have rows of different tables.
        A block has a specific size and connot be extended directly.

        A block can have 2KB to 32BK size (BY DEFAULT 8KB). Block can have the index data too.

        A block stores the row data or index rows.
    ______________________________________________________
    |                    BLOCK HEADER                      |
    |_____________________________________________________|
    |                                                     |
    |                  TABLE DIRECTORY                    |
    |_____________________________________________________|
    |                                                     |
    |                   ROW DIRECTORY                     |
    |_____________________________________________________|
    |                                                     |
    |                     FREE SPACE                      |
    |_____________________________________________________|
    |                                                     |
    |                     ROW DATA                        |
    |   ______________________________________________    |
    |  | Row 1: ID=1, NAME=Surya, SAL=5000         |     |
    |  |______________________________________________|  |
    |   ______________________________________________   |
    |  | Row 2: ID=2, NAME=Ravi, SAL=4000          |     |
    |  |______________________________________________|  |
    |   ______________________________________________   |
    |  | Row 3: ID=3, NAME=John, SAL=6000          |     |
    |  |______________________________________________|  |
    |_____________________________________________________|

    BLOCK HEADER INCLUDES: 
        Row block or Index Block -> Block type information
        Table information which have the rows in it.
        Row directory means the address of each row in this block.

        Because this is lofical block and each row will be stored in the real block of memory, abd those blocks have specific address.
            WE WILL CALL THE ADDRESS -> ROWID

            With this rowid we will directly go to the exactly location of the row and read it easily.
            
            EXAMPLE : SELECT ROWID, e.* FROM employees e;

            RESULT:
            
            AAARyrAAEAAAIwNAAA	100	Steven	King
            AAARyrAAEAAAIwNAAB	101	Neena	Kochhar
            AAARyrAAEAAAIwNAAC	102	Lex	De Haan
            AAARyrAAEAAAIwNAAD	103	Alexander	Hunold

            AAARyrAAEAAAIwNAAD ==>  Which file → Which block → Which row inside block
            Different ROWIDs = different rows (may be same block) ✅

            Each row has a unique ROWID, but multiple rows are stored inside the same data block. ROWID identifies the exact location of the row within that block.

            ROWID = Address  
            Block = Container  
            Rows = Items inside container

            We have every row has consumes soe and free space in it.
            If our row block need extra space means it will extends the space from the free space. If this space is not enough for us whener extend means it will delete this row space and create the row where the maximum space is having.

            We can use the PCTFREE or PCTUSE parameters to specify the space size in blocks.
                I/O -> Means cost in tuning

*/