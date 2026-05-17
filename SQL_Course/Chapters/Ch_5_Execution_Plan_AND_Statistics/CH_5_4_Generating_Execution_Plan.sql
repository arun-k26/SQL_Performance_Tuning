/*

   3 WAYS TO ANALYZE AN EXPLAIN PLAN :  
        1. EXPLAIN PLAN
        2. AUTO TRACE
        3. V$SQL_PLAN
        
        The optimizer creates an execution plan based on the statistics.
        
        SYNTAX : explain plan for <QUERY>;
            This will generate the explain plan and saves into the plan_table. This query will show the result but this will very difficult to read.
            So , we have another query for the view and read purpose.
            
            SYNTAX : select * from table(dbms_xplan.display());
            
        SYNTAX : explain plan set statement_id = 'MINE' for select from employees where employee_id = 100;

*/ 


explain plan for select * from employees where employee_id = '100'; -- After execution explain_plan has been saved in the plan_table.
select * from plan_table;
select * from table(dbms_xplan.display());

explain plan set statement_id = 'MINE' for select * from employees where employee_id = 100;
select * from plan_table where statement_id = 'MINE';