//
//  main.swift
//  Swift_Closures
//
//  Created by 张德荣 on 15/8/24.
//  Copyright (c) 2015年 张德荣. All rights reserved.
//

import Foundation

let names = ["Chris", "Alex","Ewa","Barry","Daniella"]

func backwards(s1 : String ,s2 : String) ->Bool {
     return s1 > s2
}

var reversed = sorted(names, backwards)

reversed = sorted(names, {
    (s1 : String , s2 :String) -> Bool in
    return s1 > s2
})

reversed = sorted(names, {(s1: String ,s2 : String) -> Bool in return s1 > s2})

reversed = sorted(names, { s1 ,s2 in return s1 > s2 })

reversed = sorted(names, {s1 ,s2 in s1 > s2})

reversed = sorted(names, {$0 > $1 })

reversed = sorted(names, >)




func someFunctionThatTakesAClosure(closure : () -> ()){
  
}

someFunctionThatTakesAClosure({

})

someFunctionThatTakesAClosure(){
  
}


reversed = sorted(names) { $0 >  $1}

println(reversed)



let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16,58,510]

/// 字典digitNames下标后跟着一个叹号 (!)，因为字典下标返回一个可选值 (optional value)，表明即使该 key 不存在也不会查找失败。 在上例中，它保证了number % 10可以总是作为一个digitNames字典的有效下标 key。 因此叹号可以用于强制解析 (force-unwrap) 存储在可选下标项中的String类型值。
let strings = numbers.map{
 (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        println(digitNames[number % 10]!)
        number  /= 10
    }
    return output
}


func makeIncrementor(forIncrement amount : Int) -> () ->Int {
     var runingTotal = 0
     func incrementor() ->Int {
      runingTotal += amount
      return runingTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)

let a = incrementByTen()
println(a)
let b = incrementByTen()
println(b)
let c = incrementByTen()
println(c)

let incrementBySeven = makeIncrementor(forIncrement: 7)
let z = incrementBySeven()

println(z)

let d = incrementByTen()
println(d)

let alsoIncrementByTen = incrementByTen

println(alsoIncrementByTen())

//println(strings)