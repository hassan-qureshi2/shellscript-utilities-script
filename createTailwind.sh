#!/bin/bash

npm init -y

npm install -D tailwindcss postcss autoprefixer

npx tailwindcss init


# echo $data
echo '/** @type {import('tailwindcss').Config} */
module.exports = {
   content: ["./*.html"],
  theme: {
    extend: {},
  },
  plugins: [],
}' > tailwind.config.js


touch input.css

dataInputCSS="@tailwind base;
@tailwind components;
@tailwind utilities;"

echo $dataInputCSS > input.css

echo '"scripts": {
  "watch": "tailwindcss -i ./input.css -o ./css/style.css --watch",
  "build": "tailwindcss -i ./input.css -o ./css/style.css"
},' >> package.json


touch index.html

echo '<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="./css/style.css" rel="stylesheet">
</head>
<body>
  <h1 class="text-3xl font-bold underline bg-lime-300">
    Hello world!
  </h1>
</body>
</html>
' > index.html

touch .gitignore


echo '.DS_STORE
node_modules
scripts/flow/*/.flowconfig
.flowconfig
*~
*.pyc
.grunt
_SpecRunner.html
__benchmarks__
build/
remote-repo/
coverage/
.module-cache
fixtures/dom/public/react-dom.js
fixtures/dom/public/react.js
test/the-files-to-test.generated.js
*.log*
chrome-user-data
*.sublime-project
*.sublime-workspace
.idea
*.iml
.vscode
*.swp
*.swo' > .gitignore
