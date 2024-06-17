@EndUserText.label: 'Interface Sale Order'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_SALEORDER_6247 provider contract transactional_interface as projection on ZR_SALEORDER_6247
{
    key SaleUUID,
    IdSale,
    Email,
    Firstname,
    Lastname,
    Country,
    Createon,
    Deliverydate,
    Orderstatus,
    Imageurl,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Item: redirected to composition child ZI_ITEM_6247, 
    _OrderStatusText
}
