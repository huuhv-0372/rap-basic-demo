CLASS lhc_ZI_UN_SALESORDER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_un_salesorder RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_un_salesorder.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_un_salesorder.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_un_salesorder.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_un_salesorder RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_un_salesorder.

ENDCLASS.

CLASS lhc_ZI_UN_SALESORDER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    " Logic tạo Sales Order (giả lập)
    DATA lt_data TYPE TABLE OF zjh_usalesorder.
    LOOP AT entities INTO DATA(ls_entity).
      APPEND VALUE #( salesorder      = ls_entity-salesorder
                      customername    = ls_entity-customername
                      totalamount     = ls_entity-totalamount
                      currency        = ls_entity-currency
                      last_changed_at = '20250331170950.7582310' ) TO lt_data.
    ENDLOOP.
    INSERT zjh_usalesorder FROM TABLE @lt_data.
  ENDMETHOD.


  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
    SELECT salesorder, customername, totalamount, currency, last_changed_at
      FROM zjh_usalesorder
      FOR ALL ENTRIES IN @keys
      WHERE salesorder = @keys-salesorder
      INTO TABLE @DATA(lt_data).
    DATA lt_result TYPE TABLE OF zjh_usalesorder.
    LOOP AT lt_data INTO DATA(ls_data).
      APPEND VALUE #( salesorder      = ls_data-salesorder
                      customername    = ls_data-customername
                      totalamount     = ls_data-totalamount
                      currency        = ls_data-currency
                      last_changed_at = ls_data-last_changed_at
                      status          = COND #( WHEN ls_data-totalamount > 1000
                                                THEN 'HIGH_VALUE'
                                                ELSE 'NORMAL' ) ) TO lt_result.
    ENDLOOP.
*    result = lt_result.
  ENDMETHOD.


  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_UN_SALESORDER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_UN_SALESORDER IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
