CLASS zcl_un_salesorder_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_un_salesorder_query IMPLEMENTATION.
  METHOD if_rap_query_provider~select.
    DATA: lt_result TYPE TABLE OF zi_un_salesorder.

    " Lấy tham số Query từ request
    DATA(lt_sort)    = io_request->get_sort_elements( ).
    DATA(lv_top)     = io_request->get_paging( )->get_page_size( ).
    DATA(lv_skip)    = io_request->get_paging( )->get_offset( ).

    " Xây dựng điều kiện WHERE từ filter
    DATA(lv_filter) = io_request->get_filter( )->get_as_sql_string( ).

    " Xây dựng ORDER BY từ sort
    DATA: lt_orderby TYPE TABLE OF string.
    LOOP AT lt_sort INTO DATA(ls_sort).
      APPEND |{ ls_sort-element_name } { COND #( WHEN ls_sort-descending = abap_true THEN 'DESC' ELSE 'ASC' ) }| TO lt_orderby.
    ENDLOOP.

    " Thực hiện truy vấn
    SELECT salesorder, customername, totalamount, currency, last_changed_at
      FROM zjh_usalesorder
      WHERE (lv_filter)
      ORDER BY (lt_orderby)
      INTO TABLE @DATA(lt_data)
      UP TO @lv_top ROWS
      OFFSET @lv_skip.

    " Logic tùy chỉnh: Tính toán status
    LOOP AT lt_data INTO DATA(ls_data).
      DATA(ls_result) = VALUE zi_un_salesorder(
        salesorder      = ls_data-salesorder
        customername    = ls_data-customername
        totalamount     = ls_data-totalamount
        currency        = ls_data-currency
        last_changed_at = ls_data-last_changed_at
        status          = COND #( WHEN ls_data-totalamount > 1000
                                  THEN 'HIGH_VALUE'
                                  ELSE 'NORMAL' )
      ).
      APPEND ls_result TO lt_result.
    ENDLOOP.

    " Trả kết quả
    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).
  ENDMETHOD.
ENDCLASS.
