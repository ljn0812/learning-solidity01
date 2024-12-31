// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Car {
    //子类可以访问非私有的属性
    uint public speed;
    //virtual， 说明该函数可以被重写
    function drive(uint _speed) public virtual {
        speed = _speed;
    }
}

contract ElectricCar is Car {
    uint public batteryLevel;
    //重写父类中的方法
    function drive(uint _speed) public override {
        super.drive(_speed);
    }
}

contract Person {
    function getName() public virtual {

    }
}

contract Employee {
    function getSalary() public virtual {

    }
}

contract Manager is Person,Employee{
    //重写父类中的方法
    function getSalary() public override {

    }
}

//抽象类
abstract contract Shape {
    //纯虚函数
    function area() public virtual ;
} 

contract Square is Shape {
    //重写area函数
    function area() public override {

    }
}

contract Circle is Shape {
    //重写area函数
    function area() public override {

    }
}