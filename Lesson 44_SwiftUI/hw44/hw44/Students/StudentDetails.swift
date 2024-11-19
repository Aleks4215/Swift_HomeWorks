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
            Avatar().frame(maxWidth: .infinity, alignment: .center)
            VStack(alignment: .leading, spacing: 8) {
                Text("First name").bold()
                    .font(.headline)
                Text(student.firstName)
                Text("Last name").bold()
                    .font(.headline)
                Text(student.lastName)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Homeworks")
                .bold()
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
            
            List {
                ForEach(student.homeworks) { homework in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(homework.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text(homework.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Rate: \(homework.rate, specifier: "%.1f")")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemGray6))
                    )
                    .padding(.vertical, 4)
                }
            }
        }
        Spacer()
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
