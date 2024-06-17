@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_ITEM_6247
  as select from zitem_6247
  association        to parent ZR_SALEORDER_6247 as _SaleOrder       on  $projection.SaleUUID = _SaleOrder.SaleUUID
{
  key sale_uuid             as SaleUUID,
  key item_uuid             as ItemUUID,
      id_sale               as IdSale,
      id_item               as IdItem,
      name                  as Name,
      description           as Description,
      releasedate           as Releasedate,
      discontinueddate      as Discontinueddate,
      price                 as Price,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      height                as Height,
      @Semantics.quantity.unitOfMeasure : 'unitofmeasure'
      width                 as Width,
      depth                 as Depth,
      quantity              as Quantity,
      unitofmeasure         as Unitofmeasure,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //Association
      // association con el padre
      _SaleOrder
      
}
