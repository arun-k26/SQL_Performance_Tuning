/*

    Explain plan is created with the statistics and based on the estimates. 
    
    HOW CAN WE FIND THE EXACT EXECUTION PLAN ?
        After running a code, you can check it from the shared SQL area. However, we can do it by another way by using AUTOTRACE.
        
    AUTOTRACE traces our query and produces the execution plan and the statistics.
        set autotrace on;
        set autotrace on [explain | statistics]; This will return the rows and explain plan.
        set autotrace on statistics; This will return the rows and statistics.
        set autotrace on trace[only] on [explain | statistics]; This will return only the explain plan and statistics.
        
        set autotrace off; You should close the autotrace, when the work is done.

*/

set autotrace traceonly explain;
select * from employees;
select * from retired_employees;

select * from hr.employees e, hr.retired_employees r where e.employee_id = r.employee_id and e.employee_id = 104;