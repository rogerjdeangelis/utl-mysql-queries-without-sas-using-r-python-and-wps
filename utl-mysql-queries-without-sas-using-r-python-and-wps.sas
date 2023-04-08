%let pgm=utl-mysql-queries-without-sas-using-r-python-and-wps ;

MySQL queries using r pytho and wps without sas


https://github.com/rogerjdeangelis/utl-mysql-queries-without-sas-using-r-python-and-wps


/*        _       _           _
 _ __ ___| | __ _| |_ ___  __| |
| `__/ _ \ |/ _` | __/ _ \/ _` |
| | |  __/ | (_| | ||  __/ (_| |
|_|  \___|_|\__,_|\__\___|\__,_|

*/

github
https://tinyurl.com/y4todtld
https://github.com/rogerjdeangelis/utl-reading-sas7bdats-and-wrting-SAS-V5-export-files-in-python

pyreadstat
https://github.com/Roche/pyreadstat

github
https://tinyurl.com/yxphau4q
https://github.com/rogerjdeangelis/utl-accessing-a-mysql-database-using-R-without-the-sas-access-product

SAS Forum
https://tinyurl.com/y44nnauz
https://communities.sas.com/t5/SAS-Programming/MySQL-connecting-issue/m-p/677391

Reference
https://www.tutorialspoint.com/r/r_database.htm

github macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

gitnub
https://tinyurl.com/khkhkxxm
https://github.com/rogerjdeangelis/utl-sqlite-processing-in-python-with-added-math-and-stat-functions

https://tinyurl.com/9x9sp9vv
https://github.com/rogerjdeangelis/utl-python-r-and-sas-sql-solutions-to-add-missing-rows-to-a-data-table

Support for SQL is very poor in R and Python.
For instance outer joins are not supported in R or Python and most stat/math functions are
not directly supported in Python. unctions.

StackOverflow R
https://tinyurl.com/58mkv62d
https://stackoverflow.com/questions/73765595/conditional-insertion-of-extra-row-in-data-table

Solution by Akrun
https://stackoverflow.com/users/3732271/akrun

Related github
https://tinyurl.com/khkhkxxm
https://github.com/rogerjdeangelis/utl-sqlite-processing-in-python-with-added-math-and-stat-functions

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

/*----- make sure you have the server running ----*/

mysql 8.0

host     = 'localhost'
user     = 'root'
passwd   = 'xxxxxx'
database = 'sakila'   /*---- included schema with MySQL ----*/

table: country

/*                                        _   _
__      ___ __  ___   _ __   __ _ ___ ___| |_| |__  _ __ _   _
\ \ /\ / / `_ \/ __| | `_ \ / _` / __/ __| __| `_ \| `__| | | |
 \ V  V /| |_) \__ \ | |_) | (_| \__ \__ \ |_| | | | |  | |_| |
  \_/\_/ | .__/|___/ | .__/ \__,_|___/___/\__|_| |_|_|   \__,_|
         |_|         |_|
*/

%utl_submit_wps64("
  proc sql;
    connect
      to mysql (user=root password='xxxxxxxx' database=sakila);
    create
       table country as
    select
       *
    from
       connection
    to
       mysql(
          select
             *
       from
          country
       ) ;
    disconnect from mysql
 ;quit;

 proc print data=country(obs=5) width=min;
 run;quit;
");

/**************************************************************************************************************************/
/*                                                                                                                        */
/* The WPS System                                                                                                         */
/*                                                                                                                        */
/* Obs    COUNTRY_ID       COUNTRY              LAST_UPDATE                                                               */
/*                                                                                                                        */
/*  1          1        Afghanistan            15FEB2006:02:44:00                                                         */
/*  2          2        Algeria                15FEB2006:02:44:00                                                         */
/*  3          3        American Samoa         15FEB2006:02:44:00                                                         */
/*  4          4        Angola                 15FEB2006:02:44:00                                                         */
/*  5          5        Anguilla               15FEB2006:02:44:00                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                    _ _ _
__      ___ __  ___  | (_) |__  _ __   __ _ _ __ ___   ___
\ \ /\ / / `_ \/ __| | | | `_ \| `_ \ / _` | `_ ` _ \ / _ \
 \ V  V /| |_) \__ \ | | | |_) | | | | (_| | | | | | |  __/
  \_/\_/ | .__/|___/ |_|_|_.__/|_| |_|\__,_|_| |_| |_|\___|
         |_|
*/

%utl_submit_wps64("

libname mysqllib mysql user='root' password='xxxxxxxx' database='sakila';

proc sql;
  create
    table country as
  select
    *
  from
    mysqllib.country
;quit;

 proc print data=country(obs=5) width=min;
 run;quit;
");

/**************************************************************************************************************************/
/*                                                                                                                        */
/* The WPS System                                                                                                         */
/*                                                                                                                        */
/* Obs    COUNTRY_ID       COUNTRY              LAST_UPDATE                                                               */
/*                                                                                                                        */
/*  1          1        Afghanistan            15FEB2006:02:44:00                                                         */
/*  2          2        Algeria                15FEB2006:02:44:00                                                         */
/*  3          3        American Samoa         15FEB2006:02:44:00                                                         */
/*  4          4        Angola                 15FEB2006:02:44:00                                                         */
/*  5          5        Anguilla               15FEB2006:02:44:00                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*           _   _
 _ __  _   _| |_| |__   ___  _ __
| `_ \| | | | __| `_ \ / _ \| `_ \
| |_) | |_| | |_| | | | (_) | | | |
| .__/ \__, |\__|_| |_|\___/|_| |_|
|_|    |___/
*/

%utlfkil(d:/xpt/want.xpt);

proc datasets lib=work nolist nodetails mt=data mt=view;
 delete want want_py_long_names;
run;quit;

%utl_submit_py64_310("
import pandas as pd;
import pyreadstat;
import mysql.connector;
dataBase = mysql.connector.connect(host = 'localhost',user = 'root',passwd = 'xxxxxxxx',database = 'sakila' );
cursorObject = dataBase.cursor();
want = pd.read_sql('SELECT * FROM country', con=dataBase);
print(want);
dataBase.close();
want.info();
pyreadstat.write_xport(want,'d:\\xpt\\want.xpt',table_name='want',file_format_version=5
,column_labels=['country_id', 'country', 'last_update']);
");

/*--- handles long variable names by using the label to rename the variables  ----*/

libname xpt xport "d:/xpt/want.xpt";
proc contents data=xpt._all_;
run;quit;

data want_py_long_names;
  %utl_rens(xpt.want) ;
  set want;
run;quit;
libname xpt clear;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*  Up to 40 obs from WANT_LONG_NAMES with formatted variables  total obs=109 08APR2023:14:42:07                          */
/*         COUNTRY_                                                                                                       */
/*  Obs       ID       COUNTRY                                    LAST_UPDATE    ===> note long variable name             */
/*                                                                                                                        */
/*    1        1       Afghanistan                              15FEB06:02:44:00                                          */
/*    2        2       Algeria                                  15FEB06:02:44:00                                          */
/*    3        3       American Samoa                           15FEB06:02:44:00                                          */
/*    4        4       Angola                                   15FEB06:02:44:00                                          */
/*    5        5       Anguilla                                 15FEB06:02:44:00                                          */
/*    6        6       Argentina                                15FEB06:02:44:00                                          */
/*    7        7       Armenia                                  15FEB06:02:44:00                                          */
/*    8        8       Australia                                15FEB06:02:44:00                                          */
/*    9        9       Austria                                  15FEB06:02:44:00                                          */
/*   10       10       Azerbaijan                               15FEB06:02:44:00                                          */
/*   11       11       Bahrain                                  15FEB06:02:44:00                                          */
/*   12       12       Bangladesh                               15FEB06:02:44:00                                          */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___
|  _ \
| |_) |
|  _ <
|_| \_\

*/

%utlfkil(d/xpt/want.xpt);

proc datasets lib=work nolist nodetails mt=data mt=view;
 delete want_r_long_names  want;

%utl_submit_r64(resolve('
library(haven);
library(data.table);
library(SASxport);
library(RMySQL);
DB <- dbConnect(MySQL(), user="root", password="xxxxxxxx",dbname="sakila", host="localhost");
summary(DB);
dbListTables(DB);
dbListFields(DB, "country");
want<-dbReadTable(DB, "counry");
want;
str(want);
dbDisconnect(DB);
for (i in 1:ncol(want)) {
      label(want[,i])<-colnames(want)[i];
      print(label(want[,i])); };
write.xport(want,file="d:/xpt/want.xpt");
'));

/*--- handles long variable names by using the label to rename the variables  ----*/

libname xpt xport "d:/xpt/want.xpt";
proc contents data=xpt._all_;
run;quit;

data want_r_long_names;
  %utl_rens(xpt.want) ;
  set want;
run;quit;
libname xpt clear;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Up to 40 obs from WANT_R_LONG_NAMES with formatted variables  total obs=109 08APR2023:15:05:46                         */
/*        COUNTRY_                                                                                                        */
/* Obs       ID       COUNTRY                                    LAST_UPDATE                                              */
/*                                                                                                                        */
/*   1        1       Afghanistan                              15FEB06:02:44:00                                           */
/*   2        2       Algeria                                  15FEB06:02:44:00                                           */
/*   3        3       American Samoa                           15FEB06:02:44:00                                           */
/*   4        4       Angola                                   15FEB06:02:44:00                                           */
/*   5        5       Anguilla                                 15FEB06:02:44:00                                           */
/*   6        6       Argentina                                15FEB06:02:44:00                                           */
/*   7        7       Armenia                                  15FEB06:02:44:00                                           */
/*   8        8       Australia                                15FEB06:02:44:00                                           */
/*   9        9       Austria                                  15FEB06:02:44:00                                           */
/*  10       10       Azerbaijan                               15FEB06:02:44:00                                           */
/*  11       11       Bahrain                                  15FEB06:02:44:00                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
