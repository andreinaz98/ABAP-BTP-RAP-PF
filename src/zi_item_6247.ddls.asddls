@EndUserText.label: 'Interface Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZI_ITEM_6247 as projection on ZR_ITEM_6247
{
    key SaleUUID,
    key ItemUUID,
    IdSale,
    IdItem,
    Name,
    Description,
    Releasedate,
    Discontinueddate,
    Price,
    Height,
    Width,
    Depth,
    Quantity,
    Unitofmeasure,
    LocalLastChangedAt,
    /* Associations */
    _SaleOrder: redirected to parent ZI_SALEORDER_6247
}
