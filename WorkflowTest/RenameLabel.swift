//
//  RenameLabel.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import SwiftUI

struct RenameLabel: View {
    var body: some View {
        Label("Rename your file with this action", systemImage: "text.viewfinder")
            .foregroundColor(.yellow)
    }
}

struct RenameLabel_Previews: PreviewProvider {
    static var previews: some View {
        RenameLabel()
    }
}
