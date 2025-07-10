//
//  main.swift
//  closures
//
//  Created by Jean Oliveira Miranda on 06/07/25.
//

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int{
    return operation(n1, n2)
}




let result = calculator(n1: 2, n2: 3) {$0 * $1}



print(result)



let array = [1,2,3,4,5]

//print(array.map{$0 + 1})

//let mapAddedOne = array.map({(n1) -> Int in
//    return n1 + 1
//})

let mappedTimes2 = array.map({$0 * 2})

print(mappedTimes2)
