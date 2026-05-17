/* 

    Where to look in Explain plan ?
        1. COST
        2. ACCESS METHODS
        3. CARDINALITY
        4. JOIN METHODS AND JOIN TYPES
        5. PARTITION PRUNING
        6. OTHERS

        1. COST : 
            Cost is calculated with many parameters and will mostly lead you to the solution. Need to find in which area of cost is high consuming part.

            BEFORE TUNING :
                explain plan for
                SELECT p.prod_id,p.prod_name, s.amount_sold, s.quantity_sold
                FROM sales s, products p, customers c
                WHERE s.prod_id = p.prod_id
                and s.CUST_ID = c.CUST_ID
                and s.cust_id in (2,3,4,5);
                
                select * from table(dbms_xplan.display());
            
            For this query total cost is 211. But for this in (2, 3, 4, 5) Consuming 208 Cost, while checked in explain plan Oracle internally converts in (2, 3, 4, 5) into OR CONDITION (or cust_id = 2 or cust_id = 3 or cust_id = 4 or cust_id = 5).

            So we found the high consuming area now we are going to tune this.

            AFTER TUNE : 
                explain plan for  
                SELECT p.prod_id,p.prod_name, s.amount_sold, s.quantity_sold
                FROM sales s, products p, customers c
                WHERE s.prod_id = p.prod_id
                and s.CUST_ID = c.CUST_ID
                and s.cust_id between 2 and 5;
                
                select * from table(dbms_xplan.display());

            So, s.cust_id between 2 and 5 now this area reduced the cost entirely by oracle internally converts the or condition into AND condition. THis reduces by cost is 60

        2. ACCESS METHODS :
            If the explain plan shows a full table scan, maybe you can tune it with using an index scan or maybe it used the wrong index_type.
        
        3. CARDINALITY :   
            If it reads more data that it needs, that means there is something wrong here.
        
        4. JOIN METHODS AND JOIN TYPES :
            Incorrect join methods and join types can decrease the performance. So, you need to check if these are correct or not.
        
        5. PARTITION PRUNING :
            Partition pruning will increase the performance significantly.

        6. OTHERS :
            We will see those in upcoming lectures.

 */