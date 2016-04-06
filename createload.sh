!# env bash

DBFARM=$HOME/dbfarm15
DB=grocery

monetdb status || monetdbd start $DBFARM

monetdb destroy -f $DB
monetdb create $DB && \
monetdb release $DB && \
mclient -d$DB $DB.ddl && \
mclient -d$DB $DB.ri && \
mclient -d$DB -s "COPY INTO customer FROM STDIN USING DELIMITERS '|','\\n'" - < customer.tbl && \
mclient -d$DB -s "COPY INTO product FROM STDIN USING DELIMITERS '|','\\n'" - < product.tbl && \
mclient -d$DB -s "COPY INTO buy FROM STDIN USING DELIMITERS '|','\\n'" - < buy.tbl
