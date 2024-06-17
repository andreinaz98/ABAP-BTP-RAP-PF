CLASS lhc_SaleOrder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SaleOrder RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR SaleOrder RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR SaleOrder RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION SaleOrder~Resume.

    METHODS setSaleOrderNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR SaleOrder~setSaleOrderNumber.

    METHODS setCreateon FOR DETERMINE ON SAVE
      IMPORTING keys FOR SaleOrder~setCreateon.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR SaleOrder~validateDates.

ENDCLASS.

CLASS lhc_SaleOrder IMPLEMENTATION.

  METHOD get_instance_features.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.

    DATA(lv_technical_user) = cl_abap_context_info=>get_user_technical_name( ).

    CHECK 1 = 2.

    IF requested_authorizations-%create EQ if_abap_behv=>mk-on.

      IF lv_technical_user EQ 'CB9980006247'.
        result-%create = if_abap_behv=>auth-allowed.
      ELSE.
        result-%create = if_abap_behv=>auth-unauthorized.
        DATA(lv_message) = abap_true.
      ENDIF.

    ENDIF.
    IF requested_authorizations-%update EQ if_abap_behv=>mk-on OR
       requested_authorizations-%action-Edit EQ if_abap_behv=>mk-on.

      IF lv_technical_user EQ 'CB9980006247'.
        Result-%update = if_abap_behv=>auth-allowed.
        result-%action-Edit = if_abap_behv=>auth-allowed.
      ELSE.
        Result-%update = if_abap_behv=>auth-unauthorized.
        result-%action-Edit = if_abap_behv=>auth-unauthorized.
        lv_message = abap_true.
      ENDIF.

    ENDIF.

    IF requested_authorizations-%delete EQ if_abap_behv=>mk-on.
      IF lv_technical_user EQ 'CB9980006247'.
        Result-%delete = if_abap_behv=>auth-allowed.
      ELSE.
        Result-%delete = if_abap_behv=>auth-unauthorized.
        lv_message = abap_true.

      ENDIF.
    ENDIF.

    IF lv_message = abap_true.
      APPEND VALUE #( %msg = NEW /dmo/cm_flight_messages(
                                        textid = /dmo/cm_flight_messages=>not_authorized
                                       severity = if_abap_behv_message=>severity-error )
                        %global = if_abap_behv=>mk-on ) TO reported-saleorder.
    ENDIF.


  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD setSaleOrderNumber.

    DATA lv_count TYPE i.
    CLEAR lv_count.

    " Leer la entidad root para Sale Order
    READ ENTITIES OF zr_saleorder_6247 IN LOCAL MODE
         ENTITY SaleOrder
         FIELDS ( IdSale )
         WITH CORRESPONDING  #( keys )
         RESULT DATA(Sales).

    DELETE sales WHERE IdSale IS NOT INITIAL.

    CHECK sales IS NOT INITIAL.

    " Seleccionar el máximo IdSale existente y lo convierto de char a numero que pueda incrementar
    SELECT COUNT(*) FROM zsaleorder_6247 INTO @DATA(lv_max_idsale).
    IF lv_max_idsale IS INITIAL.
      lv_max_idsale = '0'.
      lv_count = CONV i( lv_max_idsale ).
    ELSE.
      lv_count = CONV i( lv_max_idsale ).
    ENDIF.


    "     Incrementar y asignar nuevos IdSale
    MODIFY ENTITIES OF zr_saleorder_6247 IN LOCAL MODE
           ENTITY SaleOrder
           UPDATE
           FIELDS ( IdSale  )
           WITH VALUE #(  FOR saleorder IN sales INDEX INTO i (
                                %tky = saleorder-%tky
                                IdSale = CONV string( lv_count + i ) ) ).

  ENDMETHOD.

  METHOD setCreateon.

    DATA lv_count TYPE i.
    CLEAR lv_count.

    READ ENTITIES OF zr_saleorder_6247 IN LOCAL MODE
         ENTITY SaleOrder
         FIELDS ( IdSale Createon )
         WITH CORRESPONDING  #( keys )
         RESULT DATA(lt_sale_dateon).

    DELETE lt_sale_dateon WHERE IdSale IS NOT INITIAL.

    CHECK lt_sale_dateon IS NOT INITIAL.

    READ TABLE lt_sale_dateon INTO DATA(ls_sale_dateon) INDEX 1.
    ls_sale_dateon-Createon = cl_abap_context_info=>get_system_date( ).


    MODIFY ENTITIES OF zr_saleorder_6247 IN LOCAL MODE
           ENTITY SaleOrder
           UPDATE
           FIELDS ( Createon  )
           WITH VALUE #( ( %tky = CORRESPONDING #( ls_sale_dateon )
                                Createon = ls_sale_dateon-Createon ) ).

  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.
