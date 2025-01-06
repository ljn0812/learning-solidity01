// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract TestStruct {

    struct Product {
        uint productId;//产品id
        string productName;//产品名称
        uint price;//价格
        uint stock;//库存
    }

    struct Order {
        uint orderId; //订单id
        address customerId; //客户地址
        uint productId; //产品id
        uint count;//订单的数量
    }

    mapping (address => Order) public orders;//客户与订单的映射

    mapping (uint => Product) public products;//ID与产品的映射
    uint productId;//产品ID
    uint orderId;//订单的ID
    //函数  更新产品信息
    function updateProduct(uint _productID,string memory newProductName ,uint _price, uint _stock) public {
        Product storage p = products[_productID]; //根据产品id查询出该产品的信息
        p.productName = newProductName; //修改产品名称
        p.price = _price;//修改价格
        p.stock = _stock;//修改库存
    }
//函数  增加产品
    function addProduct(string memory newProductName ,uint _price, uint _stock) public {
        productId++;//产品ID自增
        products[productId] = Product(productId,newProductName,_price,_stock);//更新产品信息并和ID关联映射
    }
    //通过ID查询产品信息
    function getProductInfo(uint _productID) public view returns (string memory pName,uint price,uint stock){
        Product memory p = products[_productID];//获取对应的产品信息
        return (p.productName,p.price,p.stock);//返回产品信息
    }

    function createOrder(uint _productID, uint _count) public {
        orderId++; //订单ID自增
        orders[msg.sender] = Order(orderId, msg.sender, _productID, _count);//创建订单并与客户ID关联
    }

    function getOrder() public view returns (uint _orderId, uint _productId, uint _count) {
        return(orders[msg.sender].orderId, orders[msg.sender].productId, orders[msg.sender].count);//返回订单信息
    }
}