// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {
  context.subscriptions.push(
    vscode.workspace.onDidChangeTextDocument((event) => {
      if (event.reason) return;
      if (event.document.languageId != "bag") return;
      const change = event.contentChanges[0];
      if (change.rangeLength > 1) return;
      if (change.text == " ") {
        const previous2CharsRange = change.range.with(
          change.range.start.with(undefined, change.range.start.character - 2)
        );
        const previous2Chars = event.document.getText(previous2CharsRange);
        if (previous2Chars == " i") {
          vscode.window.activeTextEditor?.edit((x) =>
            x.replace(previous2CharsRange, " |")
          );
        }
      }
    })
  );
}

// this method is called when your extension is deactivated
export function deactivate() {}
