//
//  StudentsList.swift
//  hw44
//
//  Created by Алексей on 17.11.24.
//

import SwiftUI

struct StudentsList: View {
    let students: [Student] = [
            Student(
                firstName: "Alexey",
                lastName: "Evmenkov",
                homeworks: [
                    Homework(title: "Math", description: "Algebra problems", rate: 4.5),
                    Homework(title: "History", description: "Essay on WW2", rate: 5.0)
                ]
            ),
            Student(
                firstName: "Anna",
                lastName: "Ivanova",
                homeworks: [
                    Homework(title: "Physics", description: "Quantum mechanics", rate: 3.8)
                ]
            )
        ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(students) { student in
                    NavigationLink(
                        destination: StudentDetails(student: student), label: {
                            Text("\(student.firstName) \(student.lastName)")
                        }
                    )
                    }
                }
            }
            .navigationTitle("Students")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

#Preview {
    StudentsList()
}
