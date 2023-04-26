//
//  main.swift
//  MyCreditManager
//
//  Created by 서은수 on 2023/04/27.
//

import Foundation

// MARK: - Properties

struct Student {
    var name: String
    var courses: [String:String]
    var GPA: Double
}

// 추가된 학생들 리스트
var students: [Student] = []

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
        // 성적추가
        addCourseGrade()
    case "4":
        // 성적삭제
        removeCourseGrade()
    case "5":
        // 평점보기
        showGPA()
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

// MARK: - Functions

// 1: 학생추가
public func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    let inputName = readLine()!
    // 잘못된 입력 처리
    if inputName.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        let inputStudent = Student(name: inputName, courses: [:], GPA: 0)
        
        // 이미 존재하는 학생인 경우
        if !(students.filter({ $0.name == inputName }).isEmpty) {
            print("\(inputName)은(는) 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
        // 새 학생일 경우 추가
        else {
            students.append(inputStudent)
            print("\(inputName) 학생을 추가했습니다.")
        }
    }
}

// 2: 학생삭제
public func removeStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    let inputName = readLine()!
    
    // 잘못된 입력 처리
    if inputName.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        // 목록이 비어있으면 바로 종료
        if students.count == 0 {
            print("\(inputName) 학생을 찾지 못했습니다.")
        } else {
            // 목록을 찾아봤으나 이름을 찾지 못한 경우
            if students.filter({ $0.name == inputName }).isEmpty {
                print("\(inputName) 학생을 찾지 못했습니다.")
            } else {
                // 이름을 찾은 경우 목록을 해당 학생을 제거한 목록으로 갱신
                students = students.filter { $0.name != inputName }
                print("\(inputName) 학생을 삭제하였습니다.")
            }
        }
    }
}

// 3: 성적추가
public func addCourseGrade() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    let inputCourseRecord = readLine()!.split(separator: " ")
    
    // 잘못된 입력 처리
    if inputCourseRecord.count != 3 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        let studentName = String(inputCourseRecord[0])
        let courseName = String(inputCourseRecord[1])
        let courseGrade = String(inputCourseRecord[2])
        
        // 받은 이름의 학생이 목록에 없을 경우
        if students.filter({ $0.name == studentName }).isEmpty {
            print("\(studentName) 학생을 찾지 못했습니다.")
        } else {
            // 학생이 있는 경우 그 학생의 인덱스를 찾는다
            var index = 0
            for student in students {
                if student.name == studentName {
                    break
                }
                index += 1
            }
            // 해당하는 학생의 과목 성적 정보 추가(변경)
            students[index].courses[courseName] = courseGrade
            print("\(studentName) 학생의 \(courseName) 과목이 \(courseGrade)로 추가(변경)되었습니다.")
        }
    }
}

// 4: 성적삭제
public func removeCourseGrade() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
    let inputCourse = readLine()!.split(separator: " ")
    let studentName = String(inputCourse[0])
    let courseName = String(inputCourse[1])
    
    // 잘못된 입력 처리
    if inputCourse.count != 2 {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        // 받은 이름의 학생이 목록에 없을 경우
        if students.filter({ $0.name == studentName }).isEmpty {
            print("\(studentName) 학생을 찾지 못했습니다.")
        } else {
            // 학생이 있는 경우 그 학생의 인덱스를 찾는다
            var index = 0
            for student in students {
                if student.name == studentName {
                    break
                }
                index += 1
            }
            // 인풋 과목의 정보가 없는 경우
            if students[index].courses.filter({ $0.key == courseName }).isEmpty {
                print("\(studentName) 학생의 \(courseName) 성적은 등록되어 있지 않습니다.")
            } else {
                // 과목 정보가 있는 경우 삭제
                students[index].courses.removeValue(forKey: courseName)
                print("\(studentName) 학생의 \(courseName) 과목의 성적이 삭제되었습니다.")
            }
        }
    }
}

// 5: 평점보기
public func showGPA() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    let inputName = readLine()!
    
    // 잘못된 입력 처리
    if inputName.isEmpty {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    } else {
        // 입력받은 이름의 학생이 없는 경우
        if students.filter({ $0.name == inputName }).isEmpty {
            print("\(inputName) 학생을 찾지 못했습니다.")
        } else {
            let student = students.filter({ $0.name == inputName }).first
            // 학생의 성적이 없는 경우
            if student!.courses.isEmpty {
                print("\(inputName) 학생의 등록된 성적이 없습니다.")
            } else {
                // 과목과 성적을 모두 출력한 후 마지막 줄에 평점 출력
                student!.courses.forEach { (key: String, value: String) in
                    print("\(key): \(value)")
                }
                print(calculateGPA(student!))
            }
        }
    }
}

// 학생의 평점 계산
private func calculateGPA(_ student: Student) -> String {
    let grades = student.courses.values
    let count = grades.count
    var sum: Double = 0
    
    for grade in grades {
        // 성적별 점수에 맞게 총합 계산
        switch grade {
        case "A+":
            sum += 4.5
        case "A":
            sum += 4
        case "B+":
            sum += 3.5
        case "B":
            sum += 3
        case "C+":
            sum += 2.5
        case "C":
            sum += 2
        case "D+":
            sum += 1.5
        case "D":
            sum += 1
        default:
            break
        }
    }
    
    // 최대 소수점 2번째 자리까지 출력
    return String(round((sum / Double(count)) * 100) / 100)
}
