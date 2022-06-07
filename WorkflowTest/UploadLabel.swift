//
//  UploadLabel.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import SwiftUI

struct UploadLabel: View {
    var body: some View {
        Label("Upload your files to the cloud", systemImage: "cloud")
            .foregroundColor(.yellow)
    }
}

struct UploadLabel_Previews: PreviewProvider {
    static var previews: some View {
        UploadLabel()
    }
}
