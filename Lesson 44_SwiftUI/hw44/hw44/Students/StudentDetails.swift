//
//  StudentDetails.swift
//  hw44
//
//  Created by Алексей on 19.11.24.
//

import SwiftUI

struct StudentDetails: View {
    
    let student: Student
    
    var body: some View {
        VStack {
            Avatar()
            HStack {
                Text("First name").bold()
                    .font(.headline)
                Spacer()
            }.padding(.leading, 10)
            HStack {
                Text(student.firstName)
                Spacer()
            }.padding(.leading, 10)
            HStack {
                Text("Last name").bold()
                    .font(.headline)
                Spacer()
            }.padding(.leading, 10)
            HStack {
                Text(student.lastName)
                    .padding(.leading, 10)
                Spacer()
            }

            
            Text("Homeworks")
                .bold()
                .font(.headline)
            
            List {
                ForEach(student.homeworks) { homework in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(homework.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        HStack {
                            Text(homework.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        HStack {
                            Text("Rate: \(homework.rate, specifier: "%.1f")")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                    )
                    .padding(.vertical, 4)
                }
            }
        }
    }
}


#Preview {
    let student =  Student(
        firstName: "Alexey",
        lastName: "Kolobkov",
        homeworks: [
            Homework(title: "Math", description: "Algebra problems", rate: 4.5),
            Homework(title: "History", description: "Essay on WW2", rate: 5.0)
        ]
    )
    StudentDetails(student: student)
}
