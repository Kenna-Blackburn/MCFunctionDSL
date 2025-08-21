//
//  Execute.swift
//  MCFunctionDSL
//
//  Created by Kenna Blackburn on 8/20/25.
//

import Foundation

struct Execute<Run: MCComponent>: MCComponent {
    let subcommands: [any ExecuteSubcommand]
    let runCommand: () -> Run
    
    init(
        _ subcommands: (any ExecuteSubcommand)...,
        @MCComponentBuilder run runCommand: @escaping () -> Run
    ) {
        self.subcommands = subcommands
        self.runCommand = runCommand
    }
    
    var body: some MCComponent {
        _MCComponentGroup { supergroup in
            let baseCommand = Command("execute") { command in
                subcommands.forEach({ command.append($0) })
            }
            
            supergroup = runCommand()
                .compileLines()
                .map { line in
                    let runCommand = Command(line)
                    if runCommand.isExecutable {
                        let trimmedRunCommand = runCommand.modifyingString({ $0.trimmingCharacters(in: .whitespaces) })
                        return Command(baseCommand, "run", trimmedRunCommand).unpaddingArgument()
                    } else {
                        return runCommand
                    }
                }
        }
    }
}

