# Data base system subject database scripts

Example folder structure of this repo

```
.
├── User (This folder is belongs to the User table)
│   └── create.sql (create table script file)
│   └── insert.sql (Adding value to user table script file)
│   └── workbenchExport.sql (The exported file from workbench for this table)
│ 
└── Scripts
│   └── scriptOne.sql (script file which is align with our feature)
│   └── scriptTwo.sql (script file which is align with our feature)
```


Each script file in the ``` Scripts ``` folder should contains the comments, sample template

```
1. What is the purpose of this script is used for
2. Any assumption interms of script and backend language side
3. What is the data representation from this script execution
```