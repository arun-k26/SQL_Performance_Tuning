/* 

    The optimizer decides the best execution plan based on the cost of different plans. SO, cost is important.
    1. Cost is the optimizer's best estimate of the number of I/Os to execute a statement.
        FOR EXAMPLE, If a plan cost 1000, that means our query need to read 1000 single blocks to execute our query.
        To estimate the cost, the estimator uses :
            1. DISK I/O
            2. CPU USAGE
            3. MEMORY USAGE

    Single block I/O Cost   = No. of single block reads * single block read time

    Multiblock I/O Cost     = No. of multitask reads * Multiblock read time

    CPU Cost                =  No. of CPU Cycle
                              ------------------
                                  CPU Speed


    COST        = Single block I/O Cost + Multiblock I/O Cost + CPU Cost
                 --------------------------------------------------------
                              Single block read time

*/