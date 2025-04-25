CLASS lhc_ZI_UNMANAGED_SALESORDER DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_unmanaged_salesorder RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_unmanaged_salesorder.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_unmanaged_salesorder.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_unmanaged_salesorder.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_unmanaged_salesorder RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_unmanaged_salesorder.

ENDCLASS.

CLASS lhc_ZI_UNMANAGED_SALESORDER IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
    SELECT sales_order, customer_name, total_amount, currency
      FROM zjh_saleorder
      FOR ALL ENTRIES IN @keys
      WHERE sales_order = @keys-Sales_Order
      INTO TABLE @DATA(lt_result).
*    result = lt_result.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_UNMANAGED_SALESORDER DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_UNMANAGED_SALESORDER IMPLEMENTATION.

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
