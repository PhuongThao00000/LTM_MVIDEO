<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Resources/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Register - Video Merger</title>
</head>

<body>
    <section class="header">
        <div class="header-content">
            <div class="logo">
                <img src="Resources/img/video.png" alt="Video Merger Logo">
                <h1>Video Merger</h1>
            </div>
        </div>
    </section>
    <section class="body">
        <div class="background-decoration"></div>
        <div class="register-wrapper">
            <div class="register-container">
                <%
                    String error="";
                    if(request.getAttribute("errorMsg")!=null){
                        error=(String)request.getAttribute("errorMsg");
                    }
                %>
                <form method="POST" action="register" class="register-form" id="registerForm">
                    <div class="form-header">
                        <i class="fas fa-user-plus"></i>
                        <h2>Create Account</h2>
                        <p>Join us and start merging videos</p>
                    </div>
                    
                    <% if(!error.isEmpty()) { %>
                        <div class="error-alert">
                            <i class="fas fa-exclamation-circle"></i>
                            <span><%=error%></span>
                        </div>
                    <% } %>
                    
                    <div class="input-group">
                        <label for="fullName">
                            <i class="fas fa-user"></i>
                            Full Name
                        </label>
                        <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
                        <span class="input-focus"></span>
                    </div>
                    
                    <div class="input-group">
                        <label for="username">
                            <i class="fas fa-envelope"></i>
                            Email Address
                        </label>
                        <input type="email" id="username" name="email" placeholder="Enter your email" required>
                        <span class="input-focus"></span>
                    </div>
                    
                    <div class="input-group">
                        <label for="password">
                            <i class="fas fa-lock"></i>
                            Password
                        </label>
                        <div class="password-wrapper">
                            <input type="password" id="password" name="password" placeholder="Create a password" required>
                            <button type="button" class="toggle-password" onclick="togglePassword('password')">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <span class="input-focus"></span>
                        <div class="password-strength">
                            <div class="strength-meter"></div>
                            <span class="strength-text">Password strength</span>
                        </div>
                    </div>
                    
                    <div class="input-group">
                        <label for="retypePassword">
                            <i class="fas fa-lock-open"></i>
                            Confirm Password
                        </label>
                        <div class="password-wrapper">
                            <input type="password" id="retypePassword" name="retypePassword" placeholder="Confirm your password" required>
                            <button type="button" class="toggle-password" onclick="togglePassword('retypePassword')">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <span class="input-focus"></span>
                    </div>
                    
                    <button type="submit" class="btn btn-register">
                        <i class="fas fa-user-check"></i>
                        Create Account
                    </button>
                    
                    <div class="login-link">
                        <span>Already have an account?</span>
                        <a href="login" class="link-signin">
                            Sign in here
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script>
        function togglePassword(fieldId) {
            const passwordInput = document.getElementById(fieldId);
            const toggleBtn = event.currentTarget.querySelector('i');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleBtn.classList.remove('fa-eye');
                toggleBtn.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleBtn.classList.remove('fa-eye-slash');
                toggleBtn.classList.add('fa-eye');
            }
        }
        
        // Password strength indicator
        const passwordInput = document.getElementById('password');
        const strengthMeter = document.querySelector('.strength-meter');
        const strengthText = document.querySelector('.strength-text');
        
        if (passwordInput) {
            passwordInput.addEventListener('input', function() {
                const strength = getPasswordStrength(this.value);
                const strengthValues = ['weak', 'fair', 'good', 'strong'];
                strengthMeter.className = 'strength-meter ' + strengthValues[strength];
            });
        }
        
        function getPasswordStrength(password) {
            let strength = 0;
            if (password.length >= 8) strength++;
            if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
            if (/\d/.test(password)) strength++;
            if (/[^a-zA-Z\d]/.test(password)) strength++;
            return Math.min(strength - 1, 3);
        }
    </script>
</body>
</html>