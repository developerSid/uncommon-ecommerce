# Uncommon eCommerce

This is an event sourced (hopefully :) ) eCommerce solution.  Probably going to be pretty basic. 

## Needs
1. Order Capture
2. Manage Inventory
   1. Not a warehouse management system, only inventory that it has been told is available
3. Catalog searching
4. Manage Catalog
5. Manage Customer Carts

## Inventory Management
1. Add Model
   1. Model description
   2. SKU
   3. ID - UUID/GUID
2. Delete Model
   1. Use the ID from #1
3. Add Inventory to Model
   1. Amount of items being added
   2. Model ID from #1 to add the inventory to
4. Subtract Inventory from Model
   1. Use the ID from #1
5. Set Price for Model

## Order Taking
1. Create Cart
2. Complete Cart
3. Delete Cart
4. Add Inventory Item to Cart
   1. Amount
5. Remove item from Cart

## Project Setup

### .Net Tooling install
[Install Script](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)

```shell
dotnet-install.sh -c 6.0 --runtime aspnetcore
dotnet-install.sh -c 5.0 --runtime aspnetcore
dotnet-install.sh -c LTS --runtime aspnetcore
```

add $HOME/.dotnet to $PATH in your profile

### Solution Setup
[Multi-Project Solution](https://corebts.com/blog/how-to-use-dot-net-core-cli-create-multi-project/)

```shell
dotnet new sln -o uncommon-ecommerce
cd uncommon-ecommerce
dotnet new gitignore
dotnet new editorconfig
dotnet new blazorwasm -o customer-client --language csharp
dotnet new classlib -o datastore --language csharp
dotnet sln uncommon-ecommerce.sln add ./customer-client/customer-client.csproj ./datastore/datastore.csproj
dotnet add ./customer-client/customer-client.csproj reference ./datastore/datastore.csproj
```

## Stuff to look into
* [Spec BDD Testing Framework specflow](https://specflow.org/)
* [Fluent assertions Toolkit](https://www.n-fluent.net/)

