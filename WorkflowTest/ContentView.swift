//
//  ContentView.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 29/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var controller = WorkflowController()
    @State private var actions: Set<Action> = []
    var body: some View {
        HStack {
            List(Array(actions)) {
                action in
                action.main()
                    .environmentObject(controller)
            }
            .frame(minWidth: 200)
            List(Action.allCases) { action in
                Button(action: {
                    actions.insert(action)
                }) {
                    action.label()
                }
                .disabled(actions.contains(action))
                .opacity(actions.contains(action) ? 0.5 : 1)
            }
            .frame(width: 250)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WorkflowController())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
