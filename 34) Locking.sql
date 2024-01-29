/* Data intergrity is achieved by lock, no lost of data
Lock can be done on Database, table, page/column, row

Types of lock that can be done on rows:
i) Shared lock/Read lock:
acquired by select,
all the users will be allowed to read your data but cannot modify

ii) Exclusive(x) lock/Write lock:
acquired by insert, update, delete,
once at a time, cant be shared
*/