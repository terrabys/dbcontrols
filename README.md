# DB-Controls
Batch script to start, stop, and display status of DB services in windows.

This cmd script was created to have controls over MySQL, PostgrasSQL, and MongoDB services
to start & stop them on demand, so not keep the services running all the time in a background.
this script also can start every DBs respective GUI application i.e. MySQL Workbench, PgAdmin 4, and Compass

### Installation:
  Downlaod or copy to .cmd or .bat file

### Configuration:
  ![image](https://user-images.githubusercontent.com/17948952/185748236-9b9fac2a-50e1-4d65-9c97-3497056122f7.png)
  
  sqlSrvName= Your MySQL service name  
  pgSqlSrvName= Your PostgresSQL service name  
  mongoDbSrvName= Your MongoDB service name  
  
  **All service names should be without quotes for example: sqlSrvName=MySQL86**
  
  pathToWorkbench="Path to workbench exe in quotes"  
  pathToPgAdmin="Path to PgAdmin 4 exe in quotes"  
  pathToMonDbCompass="Path to MongoDB Compass exe in quotes"  
  
  **Example: pathToWorkbench="C:\Program Files\MySQL\MySQL Workbench 8.0\MySQLWorkbench.exe"**
  
  Change service startup type to manual to disable auto startup
  
  ![image](https://user-images.githubusercontent.com/17948952/185748969-7e9cf94c-620f-448d-be61-d2aae0f5049d.png)
  
### Requirements:
  In order to work properly this script must be run as Administrator to have the ability to start or stop services on your computer
  there’s a privilege check at the start of the script the following message with appear if script doesn’t have admin privileges:
  ![image](https://user-images.githubusercontent.com/17948952/185749729-0bcbf1ac-444a-4cea-863a-128855de5b17.png)
