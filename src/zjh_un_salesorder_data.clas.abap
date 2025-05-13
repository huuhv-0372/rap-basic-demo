CLASS zjh_un_salesorder_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjh_un_salesorder_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DELETE FROM zjh_usalesorder.
    INSERT zjh_usalesorder FROM (
        SELECT FROM zjh_saleorder
        FIELDS
            sales_order AS salesorder,
            customer_name AS customername,
            total_amount AS totalamount,
            currency AS currency,
            ' ' as status,
            last_changed_at AS last_changed_at
         ORDER BY sales_order
         UP TO 100 ROWS ).

    COMMIT WORK.
    out->write( 'usalesorder data inserted'  ).
  ENDMETHOD.
ENDCLASS.
