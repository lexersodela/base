# How to set environment variable
1. Create folder in assets/env and create prod.json 
<!-- prod.json is just a name you can name it anything you want e.g. dev.json test.json -->
2. Put this inside your json file
```json
{
    "CAT_API_URL": "cat-fact.herokuapp.com"
}
```
<!-- we only need CAT_API_URL in this test project -->

# How to run in vscode
1. locate your .vscode/launch.json and put this inside
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "base",
            "request": "launch",
            "type": "dart",
            "args": [
                "--dart-define-from-file=assets/env/prod.json"
            ],
            "program": "lib/main.dart"
        },
        {
            "name": "base (profile mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile",
            "args": [
                "--dart-define-from-file=assets/env/prod.json"
            ],
            "program": "lib/main.dart"
        },
        {
            "name": "base (release mode)",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release",
            "args": [
                "--dart-define-from-file=assets/env/prod.json"
            ],
            "program": "lib/main.dart"
        }
    ]
}
```
<!-- Ensure your environment variable matches -->

# How to generate apk
```bash
flutter build apk --dart-define-from-file=assets/env/prod.json
```
<!-- Ensure your environment variable matches -->
