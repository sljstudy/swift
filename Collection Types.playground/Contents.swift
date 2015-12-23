//: Playground - noun: a place where people can play

import UIKit

//MARK: 集合类型 Collection Types

// Array -- 基础

//Array 可以存放重复的数据 有序的
// 初始化
var intArray = [Int]() // 数组类型为Int
// 添加值
intArray.append(2) //

//intArray = [] // 空

// 指定大小，默认值的array
var twoArray = [Int](count: 2, repeatedValue: 5) // 大小为2, 默认值为5

// 数组相加
intArray + twoArray

// 初始值
var stringArray:[String] = ["slj","Swift","Collection Types"]

// isEmpty判断数组是否为0
if stringArray.isEmpty {
    print("stringArray is  empty")
}else{
    print("stringArray is not empty")
}

// 数组个数
stringArray.count

// 下标取值
stringArray[0]

// 下标改变值
stringArray[0] = "SongLijun"

// insert(_:atIndex:) 在索引之前添加数据相
stringArray.insert("Study", atIndex: 1)

// removeAtIndex(_:) 根据索引值 移除数据
//stringArray.removeAtIndex(1)

// removeLast() 移除最后一个 removeFirst() 移除第一个
//stringArray.removeLast()
//stringArray.removeFirst()

// 数组遍历
for item in stringArray {
    print("item -> \(item)")
}
// 遍历数组中的索引以及对应值 enumerate()
for (index, value) in stringArray.enumerate() {
    print("index -> \(index) : value -> \(value)")
}

// Array -- 进阶

extension Array {
    
    /**
     根据索引获取数据
     
     - parameter index: 索引
     
     - returns: 值
     */
    func get (index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
    
    /**
     遍历数组 for 返回值
     
     - parameter call: 值
     */
    func each (call: (Element) -> ()) {
        for item in self {
            call(item)
        }
    }
    
    /**
     遍历数组 for 返回索引和值
     
     - parameter 索引和值
     */
    func each (call: (Int, Element) -> ()) {
        for (index, item) in self.enumerate() {
            call(index, item)
        }
    }

    
}
stringArray.get(0)
stringArray.each { (value) -> () in
    print("value -> \(value)")
}
stringArray.each { (index, value) -> () in
    print("index:\(index) -> value:\(value)")
}




//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// Set 不可以存重复的数据，一些方法与array相同，不过多编写
// 构造Set集合
var intSet = Set<Int>() //范型为int的Set集合
intSet.count

var stringSet: Set<String> = ["itjh","Swift","Collection Types"]

// 插入
intSet.insert(6)

// 移除
intSet.removeFirst() //移除第一个
intSet.remove(7) // 移除数据为7的数据
intSet.removeAll() // 移除所有

// 遍历
for value in stringSet {
    print("value-> \(value)")
}

// 排序
for value in stringSet.sort() {
    print("value-> \(value)")
}
// Set集合操作
var oneSet:Set<Int> = [1,2,5,35,32,9]
var twoSet:Set<Int> = [3,4,5,30,34]
/*
使用intersect(_:)方法根据两个集合中都包含的值创建的一个新的集合。
使用exclusiveOr(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
使用union(_:)方法根据两个集合的值创建一个新的集合。
使用subtract(_:)方法根据不在该集合中的值创建一个新的集合。
*/

oneSet.intersect(twoSet) // 两个集合中相同的数据创建一个新的集合
oneSet.exclusiveOr(twoSet) // 移除两个集合中相同的数据创建一个新的集合
oneSet.union(twoSet) // 整合两个集合数据
oneSet.subtract(twoSet) // oneSet移除两个集合中相同的数据创建一个新的集合

// Set集合比较
/*
使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
使用isSupersetOf(_:)方法来判断一个集合中包含另一个集合中所有的值。
使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
使用isDisjointWith(_:)方法来判断两个集合是否不含有相同的值。
*/

// 例子来自apple中文文档
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦","🐶", "🐭"]

houseAnimals.isSubsetOf(farmAnimals) // 判断houseAnimals中的数据是否在farmAnimals中存在 ps:全部的数据
houseAnimals.isSupersetOf(farmAnimals) // 判断houseAnimals中的数据 包含farmAnimals中所有的数据
houseAnimals.isDisjointWith(cityAnimals) // 判断两个集合 不存在相同的数据


// Set --进阶
extension Set {
    
    /**
     遍历 Set
     
     - parameter each: value
     */
    func each( each:(Element) -> () ){
        for value in self {
            each(value)
        }
    }
}
farmAnimals.each { (value) -> () in
    print("Set \(value)")
}



// Dictionary 字典 key value 无序

// 构建空字典
var stringOfIntDic = [String:Int]()
stringOfIntDic["itjh"] = 223 // itjh:223
stringOfIntDic = [:] // [:]

// 初始化值
var intOfStringDic:[Int:String] = [1:"itjh",2:"Swift",3:"Collection Types"]
intOfStringDic.count

// 更新数据
intOfStringDic[1] = "itjh_slj"
intOfStringDic.updateValue("itjh", forKey: 1)


// 遍历字典 key value
for (key,value) in intOfStringDic {
    print("\(key) -> \(value)")
}
// 遍历字典key
for key in intOfStringDic.keys{
    print("key -> \(key)")
}
// 遍历字典value
for value in intOfStringDic.values{
    print("value -> \(value)")
}
// Dicrionary -- 进阶

extension Dictionary {
    
    /**
     遍历字典
     
     - parameter each: key value
     */
    func each (each: (Key, Value) -> ()) {
        for (key, value) in self {
            each(key, value)
        }
    }
    /**
     遍历字典keys
     
     - parameter each: keys
     */
    func eachKey (each: (Key) -> ()) {
        for (key) in self.keys {
            each(key)
        }
    }
    
    /**
     遍历字典value
     
     - parameter each: values
     */
    func eachValue (each: (Value) -> ()) {
        for (value) in self.values {
            each(value)
        }
    }
    
}

intOfStringDic.each { (key, value) -> () in
    print("Dic  \(key):\(value)")
}

intOfStringDic.eachKey { (key) -> () in
    print("Dic key  \(key)")
}
intOfStringDic.eachValue { (value) -> () in
    print("Dic value  \(value)")
}




