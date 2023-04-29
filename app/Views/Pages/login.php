<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <!--Font Awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/login.css">
    <script defer src="<?php echo base_url() ?>/public/assets/js/login.js" type="text/javascript"></script>
</head>

<body>
    <section>
        <div class="center">
            <div class="help"><a href="#">Need help?</a></div>

            <div class="image">
                <img src="<?php echo base_url() ?>/public/assets/image/eyedesk.png" alt="logo">
            </div>
            <header>

                <h2 class="heading">Login</h2>
            </header>
            <?php
            
            if (session()->getFlashdata('LoginFailed')) {    ?>
                <p class="alert alert-danger text-center" style="margin-top: 10px;"> <?= $this->session->flashdata('Login Failed') ?></p>
            <?php } ?>
            <div class="form">
                <form method="post" action="<?php base_url()?>check">
                <?php
            
            if (session()->getTempdata('success')) {    ?>
                <p class="alert alert-danger text-center" style="margin-top: 10px;"> <?= session()->getTempdata('success') ?></p>
            <?php } ?>
                    <?php
                    if (session()->getTempdata('error')) {    ?>
                        <p class="text-danger text-center" style="margin-top: 10px;"> <?= session()->getTempdata('error') ?></p>
                    <?php } ?>

                    <div class="login-validate">
                        <select class="validate[required]" name="login_type" style="width:100%;">
                            <option value=""><?php echo ('--- Select Account Type ---'); ?></option>
                            <!-- <option value="admin"><?= 'Admin' ?></option>
                            <option value="doctor"><?= 'Doctor' ?></option>
                            <option value="optometrists"><?= 'Optometrists' ?></option>
                            <option value="patient"><?= 'Patient' ?></option>
                            <option value="nurse"><?= 'Nurse' ?></option>
                            <option value="pharmacist"><?= 'Pharmacist' ?></option>
                            <option value="laboratorist"><?= 'Laboratorist' ?></option>
                            <option value="accountant"><?= 'Accountant' ?></option> -->
                            <?php if(!empty($role)):?>
                            <?php foreach ($role as $row): ?>
                               <option value="<?= $row->role ?>"><?= $row->role ?></option>
                            <?php endforeach ?>
                            <?php endif ?>
                        </select>
                    </div>
                    <div class="txt_field">
                        <input type="email" name="email" id="email" required>
                        <span></span>
                        <label for="email">Email</label>
                    </div>
                    <div class="txt_field">
                        <input type="password" name="password" id="password" required>
                        <i class="fa-solid fa-eye" id="eye" onclick="passwordToggle();"></i>
                        <span></span>
                        <label for="password">Password</label>

                    </div>
                    <div class="pass">Forgot Password?</div>

                    <input class="submit" type="submit">
                    <div class="signup_link">Don't have an account? <a href="#">Signup</a></div>

                </form>
            </div>

    </section>

</body>

</html>