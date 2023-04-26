//
//  main.swift
//  MyCreditManager
//
//  Created by 서은수 on 2023/04/27.
//

import Foundation

// MARK: - Properties

// 추가된 학생들의 이름
var namesOfStudents: [String] = []

// MARK: - Main

while true {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    let functionNumber = readLine()!
    if functionNumber == "X" {
        print("프로그램을 종료합니다...")
        break
    }
    
    switch functionNumber {
    case "1":
        // 학생추가
        addStudent()
    case "2":
        // 학생삭제
        removeStudent()
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

// MARK: - Functions

// 1: 학생추가
public func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let nameOfStudent = readLine()!
    // 잘못된 입력 처리
    if nameOfStudent.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    // 중복일 경우
    else if namesOfStudents.contains(nameOfStudent) {
        print("\(nameOfStudent)은(는) 이미 존재하는 학생입니다. 추가하지 않습니다.")
    }
    // 새 학생일 경우 추가
    else {
        namesOfStudents.append(nameOfStudent)
        print("\(nameOfStudent) 학생을 추가했습니다.")
    }
}

// 2: 학생삭제
public func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let inputName = readLine()!
    // 잘못된 입력 처리
    if inputName.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    
    // 이름 목록이 비어있으면 바로 종료
    if namesOfStudents.count == 0 {
        print("\(inputName) 학생을 찾지 못했습니다.")
    } else {
        var index = 0
        for nameOfStudent in namesOfStudents {
            // 이름 목록에 있으면 해당 학생 삭제
            if nameOfStudent == inputName {
                namesOfStudents.remove(at: index)
                print("\(inputName) 학생을 삭제하였습니다.")
                break
            }
            index += 1
        }
        // 이름 목록을 다 찾아봤으나 찾지 못한 경우
        if index == namesOfStudents.count + 1 {
            print("\(inputName) 학생을 찾지 못했습니다.")
        }
    }
}
