<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EyeDesk</title>
    <style>
        *{
            
        }
        .base{
            position: absolute;
            top: 50%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%);
            }
        img{
            display: block;
            height: 10rem;
            width: 40rem;
            margin: auto;
        }
        button{
            display: block;
            height: 4rem;
            width: 20rem;
            margin: auto;
            margin-top: 36px; 
            color: var(--font-color-primary);
            background-color: #134cab;
            padding: 0.5999999999999996rem 3rem;
            font-size: 1.5rem;
            color: #fff;
            font-weight: 600;
            border-radius: 3rem;
            /* border: 1px solid #696969; */
            border: none;
            cursor: pointer;
        }
        a{
            text-decoration:none;
            cursor:default;
        }
    </style>
</head>
<body>
    <div class="base">
    <img src="<?php echo base_url() ?>/public/assets/image/eyedesk.png" alt="loading">
    <a href="<?php echo base_url('login')?>"><button type='button'>Continue</button></a>
    </div>
</body>
</html>