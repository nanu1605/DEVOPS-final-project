<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .calculator {
            max-width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
        }

        .input-group {
            margin-bottom: 10px;
        }

        input[type="text"], select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        select {
            appearance: none;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .result {
            margin-top: 20px;
            text-align: center;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="calculator">
        <h1>Simple Calculator</h1>
        
        <form action="" method="post">
            <div class="input-group">
                <input type="text" name="num1" placeholder="Enter number 1" required>
            </div>
            <div class="input-group">
                <input type="text" name="num2" placeholder="Enter number 2" required>
            </div>
            <div class="input-group">
                <select name="operation">
                    <option value="add">Addition (+)</option>
                    <option value="subtract">Subtraction (-)</option>
                    <option value="multiply">Multiplication (*)</option>
                    <option value="divide">Division (/)</option>
                </select>
            </div>
            <div class="input-group">
                <input type="submit" value="Calculate">
            </div>
        </form>
        
        <div class="result">
            <%
                if (request.getMethod().equals("POST")) {
                    double num1 = Double.parseDouble(request.getParameter("num1"));
                    double num2 = Double.parseDouble(request.getParameter("num2"));
                    String operation = request.getParameter("operation");
                    double result = 0;
                    
                    if (operation.equals("add")) {
                        result = num1 + num2;
                    } else if (operation.equals("subtract")) {
                        result = num1 - num2;
                    } else if (operation.equals("multiply")) {
                        result = num1 * num2;
                    } else if (operation.equals("divide")) {
                        if (num2 != 0) {
                            result = num1 / num2;
                        } else {
                            out.println("<p>Error: Division by zero</p>");
                        }
                    }
                    
                    out.println("Result: " + result);
                }
            %>
        </div>
    </div>
</body>
</html>
