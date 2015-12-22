# Swift 2.1 String 学习笔记 基础 VS 进阶

## Swift 2.1 String 学习笔记 基础 VS 进阶

### －－－ 基础

``` swift
// 学习 Swift String

// MARK:基础
var str = "Hello, Swift String 🐢"

//isEmpty属性来判断该字符串是否为空
if str.isEmpty {
    print("str is null")
}

//for-in循环 遍历字符
for character in "SwiftString😊".characters {
    print(character)
}
//String “转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)”
let 笑脸 = "\u{2541}"

// String 字符长度
let strChaCount = "strChaCount \(str.characters.count)"

//根据下标获取字符串字符
str.startIndex
str[str.startIndex]

str.endIndex
// 错误的写法
//str[str.endIndex]
// 正确的写法 
// endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的
// predecessor()方法，可以得到前面一个索引
// successor()方法，可以得到后面一个索引
str[str.endIndex.predecessor()]
str[str.startIndex.successor()]
// 使用character 的indices 得到String 字符的下标 
for index in str.characters.indices {
//    terminator 字符之间的间隔
    print("\(str[index])",terminator:"")
}

// String 插入(insert(_)) 移除(remove)
str.insert("!", atIndex: str.endIndex) //插入字符

str.insertContentsOf("SLJ_".characters, at: str.startIndex) // 插入字符串 .characters

str.removeAtIndex(str.endIndex.predecessor()) //根据下标删除

// String 比较 (Comparing Strings)

let str1 = "str1"
let str2 = "str2"

if str1 == str2 { //字符串比较
    print("str1 == str2")
}

// 比较字符串的前缀(prefix) 后缀(suffix)
if str1.hasPrefix("str"){
    print("str1 包含前缀 'str' ")
}
if str2.hasSuffix("2"){
    print("str2 包含后缀 '2 '")
}
```
### －－－ 进阶
```swift
// MARK: String 进阶

extension String{
    /**
     截取
     
     - parameter startIndex: 开始下标
     - parameter endIndex:   结束下标
     
     - returns: 截取的字符串
     */
    func splice( var startIndex: Int,var endIndex: Int) -> String? {
        if startIndex < 0 {
            startIndex = 0
        }
        if endIndex < 0 {
            endIndex = 0
        }
        if startIndex > endIndex {
            let _startIndex = startIndex
            startIndex = endIndex
            endIndex = _startIndex
        }
        return self.substringWithRange(Range<String.Index>(start: self.startIndex.advancedBy(startIndex),end: self.startIndex.advancedBy(endIndex)))
    }
    
    /**
     替换
     
     - parameter target:     target 目标字符
     - parameter withString: withString 替换字符
     
     - returns: return 新的字符串
     */
    func replace(target:String,withString:String) -> String{
        var newStr = ""
        if !self.isEmpty{
            newStr =  self.stringByReplacingOccurrencesOfString(target, withString: withString)
        }
        return newStr
    }
    
    /**
     移除空格 trim
     - returns: return 新的字符串
     */
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    /**
     是否包含字符
     
     - parameter searchCharacter: 字符
     
     - returns: return bool
     */
    func search(searchCharacter: Character ) -> Bool? {
        return self.lowercaseString.characters.contains(searchCharacter)
    }
    
    /**
     字符串长度
     
     - returns: 长度
     */
    func length() -> Int? {
        return self.characters.count
    }
    
    
    /**
     字符串根据字符转换成
     
     - parameter character: 字符
     
     - returns: 数组
     */
    func strToArrayFromChar(character: String ) -> Array<String>? {
        return self.componentsSeparatedByString(character)
    }
    

}

var strSup = "  Hello World  "
// trim 前面 后面空格
strSup.trim()



// replace 替换
let aString: String = "This is my string"

aString.replace(" ", withString: "😊")

// string to array 字符串根据字符转换成数组
let aArray = aString.componentsSeparatedByString(" ")

aString.strToArrayFromChar(" ")

// splice 字符串截取 开始下标 结束下标
aString
aString.splice(-1, endIndex: 3)

// search 是否包含
aString.search("😊")
```
github: https://github.com/sljstudy/swift 

持续更新，欢迎大家补充！！！