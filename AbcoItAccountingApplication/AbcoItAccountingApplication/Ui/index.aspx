<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AbcoItAccountingApplication.Ui.index" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="UTF-8">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
             <?php echo form_open('login_controller/loginValidation') ?>
            <p id="profile-name" class="profile-name-card"><?php echo validation_errors();?></p>
            <div class="form-signin">
	           
	                <span id="reauth-email" class="reauth-email"></span>
	                <input type="email" name="email" id="email" class="form-control" placeholder="Email" required='' autofocus>
	                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="" >
	                <div id="remember" class="checkbox">
	                    <label>
	                        <input type="checkbox" name="remember" value="remember"> Remember me
	                    </label>
	                </div>
	                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
	            <?php echo form_close();  ?><!-- /form -->
            </div>
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
            <a href="registration" style="float: right" class="btn btn-link">
                No account?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->

    </form>
</body>
</html>
