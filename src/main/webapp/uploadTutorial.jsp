<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Tutorial</title>
</head>
<body>
    <h2>Upload Tutorial</h2>
    <form action="/advisor/uploadTutorial" method="post" enctype="multipart/form-data">
        <!-- Tutorial Title -->
        <div>
            <label for="title">Tutorial Title:</label>
            <input type="text" id="title" name="title" required /><br><br>
        </div>
        
        <!-- Tutorial Description -->
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br><br>
        </div>

        <!-- File Upload (PDF/Video) -->
        <div>
            <label for="file">Upload Tutorial (PDF/Video):</label>
            <input type="file" id="file" name="file" accept=".pdf, .mp4, .avi, .mov" required /><br><br>
        </div>

        <!-- Type of Tutorial (PDF or Video) -->
        <div>
            <label for="type">Tutorial Type:</label>
            <select name="type" id="type" required>
                <option value="pdf">PDF</option>
                <option value="video">Video</option>
            </select><br><br>
        </div>

        <!-- Submit Button -->
        <div>
            <input type="submit" value="Upload Tutorial" />
        </div>
    </form>

    <br>
    <a href="/advisor/dashboard">Back to Dashboard</a>
</body>
</html>
