<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>HaloMed | Add New Lab Test</title>
  <link rel="shortcut icon" href="images/halomed2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #87AFC7;
      color: #79BAEC;
      min-height: 100vh;
      margin: 0;
      display: flex;
      flex-direction: column;
    }

    header {
      width: 100%;
      position: relative;
      top: 0;
    }

    footer {
      width: 100%;
      position: relative;
      bottom: 0;
      margin-top: auto;
    }

    .main_content {
      flex-grow: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .form-container {
      background: #b5e2ff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      width: 100%;
    }

    .form-container h1 {
      text-align: center;
      margin-bottom: 20px;
      font-size: 28px;
      color: #333;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: 600;
      margin-bottom: 5px;
      color: #555;
    }

    .form-group input, 
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background: #f8f9fa;
      color: #333;
      outline: none;
      transition: border 0.3s;
    }

    .form-group input:focus, 
    .form-group textarea:focus {
      border-color: #4e91f5;
    }

    .submit-btn {
      background: #4e91f5;
      border: none;
      padding: 12px 20px;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
      width: 100%;
      font-size: 16px;
      color: #fff;
      transition: background 0.3s;
    }

    .submit-btn:hover {
      background: #3a78e0;
    }
  </style>
</head>
<body>
  
  <div class="main_content">
    <div class="form-container">
      <h1>Add New Lab Test</h1>
      <form action="LabTestInsertServlet" method="post">
        <div class="form-group">
          <label for="testName">Test Name</label>
          <input type="text" name="test_name" required />
        </div>

        <div class="form-group">
          <label for="description">Description</label>
          <textarea name="description" rows="4" required></textarea>
        </div>

        <div class="form-group">
          <label for="price">Price (LKR)</label>
          <input type="number" name="price" step="0.01" required />
        </div>

        <button type="submit" class="submit-btn">Add Test</button>
      </form>
    </div>
  </div>

</body>
</html>
