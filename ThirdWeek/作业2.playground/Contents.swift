//: Playground - noun: a place where people can play

import UIKit

enum Gender:Int {
    case male
    case female
    static func >(a:Gender,b:Gender)->Bool{
        return a.rawValue < b.rawValue
    }
}

//department枚举
enum Department:String{
    case teacher
    case student
}

//协议
protocol SchoolProtocol{
    func lendbook()
    var department:Department{get set}
}

class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String { return firstName+" "+lastName }
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName:String) {
        self.init(firstName:firstName,lastName: "白", age:19,gender:Gender.female)
    }
    var  description:String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    static func == (p1:Person,p2:Person) -> Bool{
        return p1.fullName == p2.fullName
    }
    static func !=(p1:Person,p2:Person) -> Bool{
        return p1.fullName != p2.fullName
    }
    //run函数
    func run(){
        print("Person \(self.fullName) is running")
    }
}
var  p1 = Person(firstName: "li", lastName: "juyi", age: 22, gender: Gender.female)
var  p2 = Person(firstName: "li", lastName: "juyi", age: 33, gender: Gender.male)
var  p3 = Person(firstName: "liyifeng")
if p1==p2 {
    print("same person")
}
if p1 != p2 {
    print("not same person")
}
print(p1)
print(p2)
print(p1.description)
print(p2.description)

//教师类
class Teacher:Person,SchoolProtocol{
    var title:String
    //实现协议
    var department: Department
    init(title:String,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.title=title
        //实现协议
        self.department = Department.teacher
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(firstName: String, lastName: String) {
        self.init(title:"shuxue",firstName:firstName,lastName:lastName,age:18,gender:Gender.male)
    }
    override var description:String{
        return "标题:\(title)\(super.description)"
    }
    //重写run函数
    override func run() {
        print("Teacher \(self.fullName) is running")
    }
    //实现协议
    func lendbook() {
        print("\(self.fullName)老师借了一本书")
    }
}
var t1 = Teacher(title: "yuwen", firstName: "kun", lastName: "cai", age: 12, gender: Gender.female)
var t2 = Teacher(firstName: "hao", lastName: "huang")
print(t1)
print(t2)
print(t1.description)
print(t2.description)

//学生类
class Student:Person,SchoolProtocol{
    var stuNo:Int
    //实现协议
    var department: Department
    init(stuNo:Int,firstName:String,lastName:String,age:Int,gender:Gender){
        self.stuNo = stuNo
        //实现协议
        self.department=Department.student
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(firstName: String, lastName: String) {
        self.init(stuNo:2016110,firstName:firstName,lastName:lastName,age:17,gender:Gender.female)
    }
    override var description: String{
        return "\(super.description)  学号:\(stuNo)"
    }
    //重写run函数
    override func run() {
        print("Student \(self.fullName) is running")
    }
    //实现协议
    func lendbook() {
        print("学生 \(fullName) 借了一本书")
    }
}
var s1 = Student(stuNo: 2016111, firstName: "feng", lastName: "wang", age: 22, gender: Gender.female)
var s2 = Student(firstName: "ming", lastName: "huang")
print(s1)
print(s2)
print(s1.description)
print(s2.description)

//构建数组
var reArray = [Person]()
//人
for i in 1...3{
    let arrayPerson = Person(firstName: "\(i)", lastName: "li", age: 20+i, gender: Gender.female)
    reArray.append(arrayPerson)
}
//教师
for i in 1...4{
    let arrayTeacher=Teacher(title: "yingyu", firstName: "\(i)", lastName: "wan", age: 10+i, gender: Gender.female)
    reArray.append(arrayTeacher)
}
//学生
for i in 1...5{
    let arrayStudent=Student(stuNo: 2016110+i, firstName: "\(i)", lastName: "lan", age: 30+i , gender: Gender.male)
    reArray.append(arrayStudent)
}

var dictionary = ["Person":0,"Teacher":0,"Student":0]
print(dictionary)
print(reArray)
for travereArray in reArray{
    if travereArray is Student{
        dictionary["Student"]! += 1
    }else if travereArray is Teacher{
        dictionary["Teacher"]! += 1
    }else{
        dictionary["Person"]! += 1
    }
}
print("字典内容：")
for(key,value) in dictionary{
    print("\(key):\(value)个")
}

//age排序
print("按age排序：")
reArray.sort{$0.age < $1.age}

for p in reArray{
    print(p.description)
}
//fullname排序
print("按fullname排序：")
reArray.sort { $0.fullName < $1.fullName }
for p in reArray{
    print(p.description)
}
//gender+age排序
print("按gender+age排序：")
reArray.sort {($0.gender>$1.gender)&&($0.age>$1.age)}
for p in reArray{
    print(p.description)
}

//对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法
for p in reArray{
    p.run()
}
for p in reArray{
    if let s=p as? Student{
        s.lendbook()
    }else if let t=p as? Teacher{
        t.lendbook()
    }
}
