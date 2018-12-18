//: Playground - noun: a place where people can play

import UIKit

//给定一个Dictionary，Dictionary包含key值name和age，用map函数返回age字符串数组;
let dictionary = [["name":"feng","age":"18"],["name":"ming","age":"22"]]
let age = dictionary.map{$0["age"] ?? ""}.filter{$0 != ""}
print(age)

//给定一个String数组，用filter函数选出能被转成Int的字符串
let stringArray = ["123","666","xyz","11a","888","www"]
let choseNum = stringArray.filter{Int($0) != nil}
print("转换成int的字符串有：\(choseNum)")

//用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
let strArray = ["I","am","a","studnet"]
let connectArray = strArray.reduce(""){connectArray,letter in "\(connectArray),\(letter)"}
print("连接后以逗号分割为：\(connectArray)")

//用 reduce 方法一次求出整数数组的最大值、最小值、总数和
var intArray = [100,23,66,88,99,89,69,2]
let number = intArray.reduce((max:Int.min,min:Int.max,sum:0)){(number,i) in
    return(max(number.max,i),min(number.min,i),number.sum+i)
}
print("最大值：\(number.max)")
print("最小值：\(number.min)")
print("总和：\(number.sum)")

//新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
//函数类型为(Int) -> Int
func f1(a: Int) -> Int {
    return a
}

//函数类型为(String) -> Int
func f2(a: String) -> Int {
    return Int(a)!
}

//函数类型为() -> Int
func f3() -> Int {
    return 2
}

//函数类型为(Int) -> Void
func f4(a: Int) {
    
}

//函数类型为(Int) -> Int
func f5(a: Int) -> Int {
    return a + 1
}

let funArr: [Any] = [f1, f2, f3, f4, f5]
for (index, value) in funArr.enumerated() { //因为循环过程中需要设计到数组的下标，要将数组元素一一列举出来
    if value is (Int) -> Int {
        print(index)  //输出类型为(Int) -> Int的函数在数组中的下标
    }
}
//扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
extension Int{
    func sqrt(num:Int)->Double{
        return Darwin.sqrt(Double(num))
    }
}
print(sqrt(9))
//实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。
func maxandmin<T:Comparable>(data:[T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    
    for i in data {
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return(max,min)
}
let maxminInt = maxandmin(data: [1236,888,23,77,89,32])
print("传入整数时最大值为：\(maxminInt.max) 最小值为：\(maxminInt.min)")

let maxminFloat = maxandmin(data: [999.9,88.8,77.7,66.6,77.8])
print("传入浮点数时最大值为:\(maxminFloat.max) 最小值为：\(maxminFloat.min)")

let maxminString = maxandmin(data: ["A","B","C","G"])
print("传入字符串时：最小为：\(maxminString.min) 最大为：\(maxminString.max)")


