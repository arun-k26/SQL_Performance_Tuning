/* 

    When we say storage for Oracle database you should think about the files shared in the disc. The memory is not considered as storage in Oracle.

    ORACLE DATABASE HAS DIFFERENT STORAGE FILES : 
    
    1. CONTROL FILE :
        Control file stores the physical structure informatioon of the database. These files are bery critical to the database without these we cannot access to data in the database.

    2. DATA FILE :
        These files stores the actual data of the database. Our tables, procedures, application data all stores in this file.

    3. ONLINE REDO LOG FILE :
        Redo log file entries are stored from the buffer cache to the online redo log files. These files are used for the recovery of the database if the system crashes.
    
    4. ARCHIVED REDO LOG FILE :
        The online redolog files should be fast. So, it must be some light weighted. So, Constatnt moved the data from online redolog file to archieved redolog file to provide more space to the online redolog file.
    
    5. BACKUP FILE :
        Backup files is also used for the recovery. This is the exact copy of the actual data is stored in this backup files for the disaster recovery.

    6. PARAMETER FILE :
        This file includes the configure data of the database instance.
    
    7. PASSWORD FILE :
        This file stores the password of the admin users like system, sysdba,sysasm.

    8. ALERT LOG AND TRACE LOG :
        This stores the log messages and error occurs in the database. The trace files are used to store the trace infor of the process.

*/