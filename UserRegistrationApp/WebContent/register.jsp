
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    
    <title>Responsive Registration Form</title>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #4070f4;
        }
        .container {
            position: relative;
            max-width: 900px;
            width: 100%;
            border-radius: 6px;
            padding: 30px;
            margin: 0 15px;
            background-color: #fff;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        .container header {
            position: relative;
            font-size: 24px;
            font-weight: 600;
            color: #333;
            text-align: center;
        }
        .container header::before {
            content: "";
            position: absolute;
            left: 50%;
            bottom: -5px;
            transform: translateX(-50%);
            height: 3px;
            width: 50px;
            border-radius: 8px;
            background-color: #4070f4;
        }
        .container form {
            position: relative;
            margin-top: 30px;
            min-height: 490px;
            background-color: #fff;
            overflow: hidden;
        }
        .container form .form {
            position: absolute;
            width: 100%;
            background-color: #fff;
            transition: 0.3s ease;
        }
        .container form .form.second {
            opacity: 0;
            pointer-events: none;
            transform: translateX(100%);
        }
        form.secActive .form.second {
            opacity: 1;
            pointer-events: auto;
            transform: translateX(0);
        }
        form.secActive .form.first {
            opacity: 0;
            pointer-events: none;
            transform: translateX(-100%);
        }
        .container form .title {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
            font-weight: 500;
            color: #333;
        }
        .container form .fields {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        form .fields .input-field {
            display: flex;
            width: calc(100% / 3 - 15px);
            flex-direction: column;
            margin: 4px 0;
            position: relative;
        }
        .input-field label {
            font-size: 12px;
            font-weight: 500;
            color: #2e2e2e;
        }
        .input-field input, .input-field select {
            outline: none;
            font-size: 14px;
            font-weight: 400;
            color: #333;
            border-radius: 5px;
            border: 1px solid #aaa;
            padding: 0 15px;
            height: 42px;
            margin: 8px 0;
        }
        .input-field input:focus,
        .input-field select:focus {
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.13);
            border-color: #4070f4;
        }
        .input-field select,
        .input-field input[type="date"] {
            color: #707070;
        }
        .input-field input[type="date"]:valid {
            color: #333;
        }
        .container form button, .backBtn {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 45px;
            max-width: 200px;
            width: 100%;
            border: none;
            outline: none;
            color: #fff;
            border-radius: 5px;
            margin: 25px 0;
            background-color: #4070f4;
            transition: all 0.3s linear;
            cursor: pointer;
        }
        .container form .btnText {
            font-size: 14px;
            font-weight: 400;
        }
        form button:hover,
        .backBtn:hover {
            background-color: #265df2;
        }
        form button i,
        form .backBtn i {
            margin: 0 6px;
        }
        form .backBtn i {
            transform: rotate(180deg);
        }
        form .buttons {
            display: flex;
            align-items: center;
        }
        form .buttons button , .backBtn {
            margin-right: 14px;
        }
        
        
        
        
        
        
        
        
        .input-field {
    display: flex;
    flex-direction: column;
    margin-bottom: 15px;
}

.input-field label {
    font-weight: bold;
    margin-bottom: 5px;
    color: #333;
}

.input-field input[type="file"],
.input-field input[type="number"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    outline: none;
    transition: border-color 0.3s;
}

.input-field input[type="file"]:focus,
.input-field input[type="number"]:focus {
    border-color: #007bff;
}

.error-message {
    color: red;
    font-size: 14px;
    margin-top: 5px;
}
        
        
        
    
    
    
    
    
    
.admin-login {
    position: fixed; /* Keeps it fixed at the bottom */
    bottom: 20px;    /* Position it 20px from the bottom */
    left: 50%;       /* Aligns it to the center horizontally */
    transform: translateX(-50%); /* Centers the element */
    display: flex;   /* Use flexbox to center the button */
    justify-content: center;
    z-index: 1000;   /* Ensure it stays on top of other content */
}

/* Button styling */
.admin-login button {
    background-color: #28a745; /* Green color */
    color: #fff;
    padding: 12px 24px; /* Adjust the padding for a bigger button */
    font-size: 16px;     /* Font size */
    border: none;        /* No border */
    border-radius: 5px;  /* Rounded corners */
    cursor: pointer;      /* Pointer cursor on hover */
    transition: background-color 0.3s, transform 0.2s; /* Transition effects */
    display: flex;       /* Flex to center the text */
    align-items: center; /* Align items vertically */
    justify-content: center; /* Center items horizontally */
}

/* Hover effect */
.admin-login button:hover {
    background-color: #218838; /* Darker green on hover */
    transform: scale(1.05);    /* Slightly enlarge on hover */
}

.admin-login .btnText {
    font-weight: bold; /* Make button text bold */
}

  
    
    
    
    
    
    
    
    
    
    
    
    
    
        
        
     
        
        
        
        
        
        
        
        .buttons button {
    background-color: #007bff; /* Example color, you can change it */
    color: #fff;
    padding: 10px 20px;
    font-size: 14px;
    width: 100%; /* Ensure all buttons are the same width */
    max-width: 150px; /* Adjust the max-width as needed */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin: 5px; /* Adds spacing between buttons */
}

.buttons button:hover {
    background-color: #0056b3; /* Darker shade on hover */
}
        
        
        
        
        
        
        
        
        
        
        /* Error Message Styling */
        .error-message {
            color: red;
            font-size: 12px;
            position: absolute;
            bottom: -18px;
            left: 0;
        }
        
        @media (max-width: 750px) {
            .container form {
                overflow-y: scroll;
            }
            .container form::-webkit-scrollbar {
               display: none;
            }
            form .fields .input-field {
                width: calc(100% / 2 - 15px);
            }
        }
        
        @media (max-width: 550px) {
            form .fields .input-field {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>Registration</header>

        <form action="register" method="POST" enctype="multipart/form-data">
            <!-- First Form Section -->
            <div class="form first">
                <div class="details personal">
                    <span class="title">Personal Details</span>

                    <div class="fields">
                        <div class="input-field">
    <label for="fullName">Full Name</label>
    <input type="text" id="fullName" name="full_name" placeholder="Enter your name" required>
    <span class="error-message" id="fullNameError"></span>
</div>
                        

                      

                        <div class="input-field">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" required>
                            <span class="error-message" id="emailError"></span>
                        </div>

                        <div class="input-field">
                            <label for="mobile">Mobile Number</label>
                            <input type="tel" id="mobile" name="mobile" placeholder="Enter mobile number" required pattern="\d{10,15}">
                            <span class="error-message" id="mobileError"></span>
                        </div>

                        <div class="input-field">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender" required>
                                <option disabled selected value="">Select gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Others</option>
                            </select>
                            <span class="error-message" id="genderError"></span>
                        </div>

                        <div class="input-field">
                            <label for="occupation">Occupation</label>
                            <input type="text" id="occupation" name="occupation" placeholder="Enter your occupation" required>
                            <span class="error-message" id="occupationError"></span>
                        </div>
                    </div>
                </div>

                <div class="details ID">
                    <span class="title">Identity Details</span>
                    
                    
                    
                    
                    
                    

                    <div class="fields">
                        <div class="input-field">
                            <label for="idType">ID Type</label>
                            <input type="text" id="idType" name="idType" placeholder="Enter ID type" required>
                            <span class="error-message" id="idTypeError"></span>
                        </div>











                        <div class="input-field">
                            <label for="idNumber">ID Number</label>
                            <input type="text" id="idNumber" name="idNumber" placeholder="Enter ID number" required pattern="\d{6,20}">
                            <span class="error-message" id="idNumberError"></span>
                        </div>

                        <div class="input-field">
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" placeholder="Enter your address" required>
                            <span class="error-message" id="addressError"></span>
                        </div>
                    </div>
                </div>

                <div class="buttons">
                    <button type="button" class="btnNext">Next</button>
                </div>
            </div>

            <!-- Second Form Section -->
            <div class="form second">
                <div class="details education">
                    <span class="title">Education Details</span>

                    <div class="fields">
                        <div class="input-field">
                            <label for="highestQualification">Highest Qualification</label>
                            <input type="text" id="highestQualification" name="highestQualification" placeholder="Enter your qualification" required>
                            <span class="error-message" id="highestQualificationError"></span>
                        </div>

                        <div class="input-field">
                            <label for="instituteName">Institute Name</label>
                            <input type="text" id="instituteName" name="instituteName" placeholder="Enter your institute name" required>
                            <span class="error-message" id="instituteNameError"></span>
                        </div>

                        



<div class="input-field">
    <label for="photo">Upload Photo</label>
    <input type="file" id="photo" name="photo" accept="image/*" required>
    <span class="error-message" id="photoError"></span>
</div>




                <div class="buttons">
                    <button type="button" class="backBtn">Back</button>
                  
                    <button type="submit">Register</button>
                </div>
                
                
                 <div class="admin-login">
                <button type="button" onclick="redirectToAdmin()"><span class="btnText">Admin Login</span></button>
            </div>
            
           
            
            </div>
        </form>
    </div>

    <script>
        const nextButton = document.querySelector(".btnNext");
        const backButton = document.querySelector(".backBtn");
        const form = document.querySelector("form");

        nextButton.addEventListener("click", () => {
            form.classList.add("secActive");
        });

        backButton.addEventListener("click", () => {
            form.classList.remove("secActive");
        });
        
        
        
        
        
        
         function redirectToAdmin() {
            window.location.href = 'adminlogin.html';
        }
        
        
        
        
    </script>
</body>
</html>





