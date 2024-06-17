@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity Root Sale Order'
define root view entity ZR_SALEORDER_6247
  as select from zsaleorder_6247
  composition [0..*] of ZR_ITEM_6247 as _Item
  association [0..1] to ZR_ORDERSTAUST_6247 as _OrderStatusText on $projection.Orderstatus = _OrderStatusText.Orderstatus
                                                                and _OrderStatusText.IdLang = $session.system_language
{
  key sale_uuid             as SaleUUID,
      id_sale               as IdSale,
      email                 as Email,
      firstname             as Firstname,
      lastname              as Lastname,
      country               as Country,
      createon              as Createon,
      deliverydate          as Deliverydate,
      @ObjectModel.text.element: [ '_OrderStatusText' ]
      orderstatus           as Orderstatus,
      imageurl              as Imageurl,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      //_association_name // Make association public
       // association con el hijo
      _Item,
      //assocition para las traducciones
       _OrderStatusText
}
