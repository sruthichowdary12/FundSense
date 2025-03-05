<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width: device-width, initial-scale=1.0" />
    <title>FUND SENSE </title>
    <style>
      body {
        font-family: monospace;
        background: rgb(2, 0, 36);
        background-image: linear-gradient(
          140deg,
          hsl(0deg 0% 0%) 0%,
          hsl(221deg 100% 9%) 72%,
          hsl(216deg 83% 12%) 100%
        );
        min-height: 100vh;
        overflow: hidden;
        color: #fff;
      }
    </style>
  </head>
  <body>
    
      FUND SENSE
    </a>
    <script>
      var vapiInstance = null;
      const assistant = "9a72e2bd-0991-477a-8923-54ebddac5697"; // Substitute with your assistant ID
      const apiKey = "7eeedfb4-77f2-44dd-8ce0-e3c708347cfe"; // Substitute with your Public key from Vapi Dashboard.
      

      (function (d, t) {
        var g = document.createElement(t),
          s = d.getElementsByTagName(t)[0];
        g.src =
          "https://cdn.jsdelivr.net/gh/VapiAI/html-script-tag@latest/dist/assets/index.js";
        g.defer = true;
        g.async = true;
        s.parentNode.insertBefore(g, s);

        g.onload = function () {
          vapiInstance = window.vapiSDK.run({
            apiKey: apiKey, // mandatory
            assistant: assistant, // mandatory
           
          });
        };
      })(document, "script");
    </script>
  </body>
</html>