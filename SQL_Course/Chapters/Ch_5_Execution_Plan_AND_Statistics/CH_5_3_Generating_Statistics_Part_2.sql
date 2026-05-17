/*

    1. GATHER_DICTIONARY_STATS PROCEDURE
        This appproach does not used in the office or by the DBA. Because this is a more time consuming process.
        
        SYSTAX : exec dbms_stats.gather_dictionary_stats;
    
    2. GATHER_SCHEMA_STATS PROCEDURE
        SYNTAX : exec dbms_stats.gather_schema_stats(ownname => 'HR');
        This will work only for the particular schema.
    
    3. GATHER_TABLE_STATS PROCEDURE
        SYNTAX : exec dbms_stats.gather_table_stats(ownname => 'HR', tabname => 'EMPLOYEES', cascade => true);
        This is the very fast approach. Beacuse, this will update the statistics for the particular table.
            CASCADE means it generates the statistics for all the indexes of the table.
            
    4. GATHER_INDEX_STATS PROCEDURE
        SYNTAX : exec DBMS_STATS.GATHER_INDEX_STATS(ownname => 'HR', indname => 'EMP_IDX');
        THis is the most fastest approach. Because, it will generate the statistics for the particular index of the table.
    
    
    HOW CAN WE SEE OPTIMIZER STATISTICS :
        1. dba_tables
        2. dba_tab_statistics
        3. dba_tab_col_statistics
        4. dba_indexes
        5. dba_clusters
        6. dba_tab_partitions
        7. dba_ind_partitions
        8. dba_part_col_statistics
        
*/

select * from dba_tab_statistics where table_name = 'EMPLOYEES';
select * from dba_part_col_statistics where table_name = 'EMPLOYEES';