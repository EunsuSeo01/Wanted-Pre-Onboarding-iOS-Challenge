//
//  main.swift
//  MyCreditManager
//
//  Created by 서은수 on 2023/04/27.
//

import Foundation

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    var functionNumber = readLine()!
    if functionNumber == "X" {
        print("프로그램을 종료합니다...")
        break
    }
    switch functionNumber {
    case "1":
        print("1: 학생추가")
    case "2":
        print("2: 학생삭제")
    case "3":
        print("3: 성적추가")
    case "4":
        print("4: 성적삭제")
    case "5":
        print("5: 평점보기")
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
