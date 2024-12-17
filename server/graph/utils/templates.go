package utils

var EmailVerificationTemplate string = `<h1>Email Confirmation</h1>
<h2>Hello %s</h2>
<p>Thank you for registering. Please confirm your email by clicking on the following link within 15 minutes.</p>
<a href=%s> Click here</a>
<p>This email is auto generated, please do not reply to this email.</p>`

var PasswordResetTemplate string = `<h1>Password Reset</h1>
<h2>Hello %s</h2>
<p>Reset your password by clicking on the following link within 15 minutes.</p>
<a href=%s> Click here</a>
<p>This email is auto generated, please do not reply to this email.</p>`
