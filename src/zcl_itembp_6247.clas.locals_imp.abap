CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setItemNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Item~setItemNumber.

    METHODS validateItem FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateItem.

ENDCLASS.

CLASS lhc_Item IMPLEMENTATION.

  METHOD setItemNumber.

*    DATA: lv_count TYPE i,
*          lv_max_iditem TYPE i,
*          lt_items TYPE TABLE OF zr_item_6247,
*          lv_max_iditem_str TYPE string.
*
*    CLEAR lv_count.
*    CLEAR lv_max_iditem.
*
*    " Leer la entidad root para Items me da error : no reconoce mi entidad
*    READ ENTITIES OF zr_item_6247 IN LOCAL MODE
*      ENTITY Item
*      FIELDS ( IdItem SaleUUID )
*      WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_items).
*
*    DELETE lt_items WHERE IdItem IS NOT INITIAL.
*
*    CHECK lt_items IS NOT INITIAL.
*
*    " Seleccionar el máximo IdItem existente
*    SELECT MAX( CAST( id_item AS INT4 ) ) FROM zitem_6247 INTO @lv_max_iditem.
*
*    IF lv_max_iditem IS INITIAL.
*      lv_max_iditem = 0.
*    ENDIF.
*
*    lv_count = lv_max_iditem.
*
*    " Incrementar y asignar nuevos IdItem
*    MODIFY ENTITIES OF zr_item_6247 IN LOCAL MODE
*      ENTITY Item
*      UPDATE
*      FIELDS ( IdItem )
*      WITH VALUE #( FOR item IN lt_items INDEX INTO i (
*                       %tky = item-%tky
*                       IdItem = CONV string( lv_count + i ) ) ).

    ENDMETHOD.

    METHOD validateItem.

    ENDMETHOD.

ENDCLASS.
