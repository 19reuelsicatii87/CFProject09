<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CFProject09 - Simple Layout</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }

        main {
            padding: 20px;
        }

        .card {
            background: white;
            padding: 15px;
            border-radius: 8px;
            max-width: 600px;
            margin: 20px auto;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        button {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <!-- Header Section -->
    <header>
        <h1>My Simple Page</h1>
    </header>

    <!-- Main Section -->
    <main>
        <div class="card">
            <h2>Welcome to my simple page</h2>
            <div>
                <p style="margin: 0;">This is the main content area.</p>
                <p style="margin: 0;">Version 26.6.8 - 2041 - Updated with Brian</p>
            </div>
        </div>
        <div class="card">
            <button onclick="toggleMessage()">Click Me</button>
            <p id="message"></p>
        </div>
    </main>

    <script>
        function toggleMessage() {
            const message = document.getElementById("message");

            if (message.innerText.trim()) {
                message.innerText = "";
                return;
            }

            message.innerText = "🎉🎉🎉 Version 26.6.8 - 2041 - Updated with Brian 🎉🎉🎉";
        }
    </script>

</body>

</html>