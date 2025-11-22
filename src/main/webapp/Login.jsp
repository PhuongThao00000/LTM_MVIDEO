<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Resources/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Login - Video Merger</title>
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
        <div class="login-wrapper">
            <div class="login-container">
                <%
                    String error="";
                    if(request.getAttribute("errorMsg")!=null){
                        error=(String)request.getAttribute("errorMsg");
                    }
                %>
                <form action="login" method="POST" class="login-form">
                    <div class="form-header">
                        <i class="fas fa-hand-wave"></i>
                        <h2>Welcome Back</h2>
                        <p>Sign in to your account</p>
                    </div>
                    
                    <% if(!error.isEmpty()) { %>
                        <div class="error-alert">
                            <i class="fas fa-exclamation-circle"></i>
                            <span><%=error%></span>
                        </div>
                    <% } %>
                    
                    <div class="input-group">
                        <label for="username">
                            <i class="fas fa-envelope"></i>
                            Email address
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
                            <input type="password" id="password" name="password" placeholder="Enter your password" required>
                            <button type="button" class="toggle-password" onclick="togglePassword()">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <span class="input-focus"></span>
                    </div>
                    
                    <button type="submit" class="btn btn-login">
                        <i class="fas fa-arrow-right"></i>
                        Sign In
                    </button>
                    
                    <div class="signup-link">
                        <span>Don't have an account?</span>
                        <a href="register" class="link-signup">
                            Create one now
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleBtn = document.querySelector('.toggle-password i');
            
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
    </script>
</body>
</html>