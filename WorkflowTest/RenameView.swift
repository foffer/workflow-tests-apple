//
//  RenameView.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import SwiftUI
import Combine

struct RenameView: View {
    @EnvironmentObject var controller: WorkflowController
    @StateObject var viewModel = RenameViewModel()
        
        var body: some View {
            TextField("Rename to", text: $viewModel.text)
                .onChange(of: viewModel.configuration) { step in
                    print("STEP ADDED: \(step)")
                    controller.add(step)
                }
        }
    }
    
    struct RenameView_Previews: PreviewProvider {
        static var previews: some View {
            RenameView()
        }
    }
    
struct RenameStep: StepConfiguration, Hashable {
    
        let id = "com.cewbed.CardFlow.step.rename"
        let newName: String
        
        var isConfigured: Bool {
            !newName.isEmpty
        }
        
        func run(with files: [File]) -> [File] {
            files
                .map(rename)
        }
        
        private func rename(_ file: File) -> File {
            file.name = newName
            return file
        }
        
    }
    
    class RenameViewModel: ObservableObject {
        
        @Published var text: String = "" {
            didSet {
                textSubject.send(text)
            }
        }
        var textSubject = PassthroughSubject<String, Never>()
        @Published var configuration: RenameStep = .init(newName: "")
        @Published var isConfigured = false
        
        init() {
            configurePublishers()
        }
        
        private func configurePublishers() {
            textSubject
                .print()
                .debounce(for: .seconds(1), scheduler: RunLoop.main)
                .map { [weak self] in
                    if !$0.isEmpty {
                        self?.isConfigured = true
                        return RenameStep(newName: String($0))
                    } else {
                        self?.isConfigured = false
                        return .init(newName: "")
                    }
                    
                }
                .assign(to: &$configuration)
            
        }
    }
