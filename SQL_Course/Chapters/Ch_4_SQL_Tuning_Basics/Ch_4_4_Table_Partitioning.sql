/*

    TABLE PARTITIONING : 
        When we run a query, Oracle first checks if it is not there in the result cache. If it is not there then its time to get from the memory.
        Now, it needs proper execution plan. First, it checks the shared SQL area for a similar execution plan. If not, it creates a new execution plan.
        Since, we have a execution plan now, it first checcks the buffer cache if there is any data related with query or not. If not, its the time to go to the disc.

        The partition now comes to play.

        LETS REMEMBER, how it reads the data from the disc.

        AS we know, our table data is shared in the blocks, when the server goes to the discs it has many different methods of reading from the disc.

        Most of the time, it reads all the blocks of a table to find some data. If the table is large, this operation is very costly to perform. Even if you creates indexes for this will not work.

        Because, as we know, indexes goes to the rows by their rowid. We will learn indexes very deeply in this course. 

        But, when you search a range of data, indexes will not work so efficient. Because data will be in many different blocks, indexes will not work so efficient and the data will be in different blocks and for each block and row the server will search the index, for each row and go to different blocks for them.

        SO, this will be really costly operation and the database server will not do that. Instead, it will simply try to read all the blocks of that table and this will be very costly too.

        FOR EXAMPLE :
            If you have an index in the table hire_date column of the employees table, and you search for a single hire_date, it will work with the indexes. 

            But if you query the employees who hired between a range of dates, it will not work. Instead, it will sean all the table and then filter by the date. 
             
             If our table is big, we may get the result in minutes or hours. TO reduce the performance problem of range search ORACLE have a feature called "TABLE PARTITIONING".

             PARTITIONING MEANS SIMPLY DIVIDED THE TABLE INTO SMALLER PIECES : 
                Table -> Partition1_2018, Partition2_2019, Partition3_2020, Partition4_2021

                If I want to fetch particular data means the server wont check the n-partitions. It directly checks the particular partition alone.

                FOR EXAMPLE :
                    I need employeess between 2019 and 2020, This time the server directly reads the two partition only not the entire thing. So, this is 100 times faster than that.

*/


CREATE TABLE hr.employees_part (
    employee_id      NUMBER(6, 0),
    first_name       VARCHAR2(20),
    last_name        VARCHAR2(25)
        CONSTRAINT emp_part_last_name_nn NOT NULL,
    email            VARCHAR2(25)
        CONSTRAINT emp_part_email_nn NOT NULL,
    phone_number     VARCHAR2(20),
    hire_date        DATE
        CONSTRAINT emp_part_hire_date_nn NOT NULL,
    job_id           VARCHAR2(10)
        CONSTRAINT emp_part_job_nn NOT NULL,
    salary           NUMBER(8, 2),
    commission_pct   NUMBER(2, 2),
    manager_id       NUMBER(6, 0),
    department_id    NUMBER(4, 0),
    CONSTRAINT emp_part_salary_min CHECK ( salary > 0 ),
    CONSTRAINT emp_part_email_uk UNIQUE ( email ),
    CONSTRAINT emp_part_dept_fk FOREIGN KEY ( department_id )
        REFERENCES hr.departments ( department_id ),
    CONSTRAINT emp_part_job_fk FOREIGN KEY ( job_id )
        REFERENCES hr.jobs ( job_id ),
    CONSTRAINT emp_part_manager_fk FOREIGN KEY ( manager_id )
        REFERENCES hr.employees ( employee_id )
)
TABLESPACE sysaux
    PARTITION BY RANGE (
        hire_date
    ) INTERVAL ( numtoyminterval(1, 'YEAR') ) ( PARTITION p_start
        VALUES LESS THAN ( DATE '2000-01-01' )
    );
    

-- Step 2 :
 INSERT INTO employees_part SELECT * FROM employees;
 
 
-- Step 3 : 
SELECT COUNT(*) FROM hr.employees;
SELECT COUNT(*) FROM hr.employees_part;

-- Step 4 : 
ALTER TABLE hr.employees RENAME TO employees_old;
ALTER TABLE hr.employees_part RENAME TO employees;

-- Step 5 : Recreate Additional Indexes (if any)

CREATE INDEX hr.emp_dept_idx
ON hr.employees (department_id)
LOCAL;

-- Step 7 : 

BEGIN
  DBMS_STATS.GATHER_TABLE_STATS(
    ownname => 'HR',
    tabname => 'EMPLOYEES'
  );
END;
/

SELECT partition_name, num_rows
FROM user_tab_partitions
WHERE table_name = 'EMPLOYEES';

SELECT *
FROM user_tab_partitions
WHERE table_name = 'EMPLOYEES';


