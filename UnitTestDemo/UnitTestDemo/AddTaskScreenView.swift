//
//  AddTaskScreenView.swift
//  UnitTestDemo
//
//  Created by Thongchai Subsaidee on 13/9/2564 BE.
//

import SwiftUI

struct AddTaskScreenView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var taskTitel: String
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                TextField("Enter task", text: $taskTitel)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "addTaskTextField")
                
                Button("Add") {
                    presentationMode.wrappedValue.dismiss()
                }
                .accessibility(identifier: "addTaskButton")
                
                Spacer()
            }
            .padding()
            
            .navigationTitle("Add Task")
        }
        
    }
}

struct AddTaskScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskScreenView(taskTitel: .constant(""))
    }
}
