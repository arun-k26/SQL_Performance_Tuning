/* 

    The first step of the optimization is the query transformer.
    1. Query transformer transforms the query into a better performance one but semantically equivalent of it.

    2. If the transform is not better, it uses the original one.

    3. Time restriction and old statistics may lead a wrong plan creation.

    4.  
        1. OR EXPANSION : If you use an OR Operator in the where clause, the indexes will not be used.
            select * from sales where prod_id = 14 or promo_id = 33;

            Using The OR Operator in the query it will scan the entire table, it will not use the index. SO, to fine tune this by,

            select * from sales where prod_id = 14
            union all
            select * from sales where promo_id = 33 and prod_id <> 14;

            The total cost of this query is very less than the original query. SO, defaultly query transformer transforms the original query into the (union all) optimized query internally.

        2. SUBQUERY UNNESTING :
            select * from sales where cust_id in (select cust_id from customers);

            select sales.* from sales, customers where sales.cust_id = customer.cust_id;

            Oracle Query transformer, internally convert the subqury into the join statement. So, it compares which having the lesser cost then it uses the least one.

*/