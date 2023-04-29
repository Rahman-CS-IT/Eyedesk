<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--Custom CSS Link-->
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/dashboard.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/facilitysetting.css">
    <script defer src="<?php echo base_url() ?>/public/assets/js/dash.js" type="text/javascript"></script>

</head>

<body>
    <!-- *************************************** main div ********************************** -->


    <!-- ********************************* Facility nav bar **************************** -->

    <section class="second-nav">
        <div class="left">
            <a class="today-btn" href="#">Today</a>
            <div class="leftarrow"><img src="<?php echo base_url() ?>/public/assets/image/polygon 10.png" alt=""></div>
            &nbsp;
            <div class="date-picker">

                <div class="date-picker__selected-date"></div>

                <div class="dates">
                    <div class="month-wrapper">

                        <div class="arrow prv-month">
                            &lt;
                        </div>

                        <div class="month">
                        </div>

                        <div class="arrow nxt-month">
                            &gt;
                        </div>

                    </div>

                    <div class="days">
                        <div class="day">S</div>
                        <div class="day">M</div>
                        <div class="day">T</div>
                        <div class="day">W</div>
                        <div class="day">T</div>
                        <div class="day">F</div>
                        <div class="day">S</div>
                    </div>

                </div>
            </div>
            &nbsp;
            <div class="rightarrow"><img src="<?php echo base_url() ?>/public/assets/image/polygon 11.png" alt=""></div>
            <div class="scheduler">
                <img src="<?php echo base_url() ?>/public/assets/image/summary.png" alt="" width="25px">
            </div>
        </div>
    </section>


    <!--Doctor Registration Start-->
    <section class="doctor-registration">

        <!--Modal Start-->
        <div class="modal">
            <div class="modal__header">
                <p class="modal__header__heading">Doctor Registration Form</p>
                <div class="modal-closebtn">
                    <a href="<?= base_url('opd') ?>">
                        <img src="<?php echo base_url() ?>/public/assets/image/close.png" alt="" width="28px">

                    </a>
                </div>
            </div>

            <!--Modal Body Start-->
            <form action="<?= base_url('register-staff') ?>" method="POST">
                <div class="modal__container">
                    <div class="modal__container__left">
                        <nav class="modal__container__left__header">
                            <span class="modal__container__left__nav__btn active">Doctor Details</span>
                            <span class="modal__container__left__nav__btn">Other Details</span>
                            <!-- <span class="modal__container__left__nav__btn">History</span>
                            <span class="modal__container__left__nav__btn">Allergies</span> -->
                        </nav>

                        <div class="modal__container__left__body active">

                            <!--Doctor Details Start-->
                            <div class="doctordetails">

                                <div class="doctordetails__name">
                                    <div class="doctordatils__name_header">
                                        <p>Name</p>
                                    </div>
                                    <div class="doctordetails__name_input">
                                        <input type="text" name="name" placeholder="Name" required>
                                        <!-- <input type="text" name="middlename" placeholder="Middle Name">
                                        <input type="text" name="last_name" placeholder="Last Name"> -->
                                    </div>
                                </div>

                                <div class="doctordetails__contact">
                                    <div class="doctordatils__contact_header">
                                        <p>Contact Details</p>
                                    </div>
                                    <div class="doctordetails__contact_input">
                                        <input type="text" name="email" placeholder="Email">
                                        <input type="text" name="password" placeholder="Password">
                                        <input type="text" name="mobile_no" placeholder="Mobile Number" required>
                                    </div>
                                </div>

                                <div class="doctordetails__4col">

                                    <div class="doctordetails__4col_gender">
                                        <div class="doctordatils__4col_gender_header">
                                            <p>Gender</p>
                                        </div>
                                        <div class="doctordatils__4col_gender_input">
                                            <div class="box">
                                                <input type="radio" id="male" value="male" name="gender">
                                                <p>Male</p>
                                            </div>
                                            <div class="box">
                                                <input type="radio" id="female" value="female" name="gender">
                                                <p>Female</p>
                                            </div>
                                            <div class="box">
                                                <input type="radio" id="trans" value="transgender" name="gender">
                                                <p>Transgender</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="doctordetails__4col_dob">
                                        <div class="doctordetails__4col_dob_header">
                                            <p>D.O.B</p>
                                        </div>
                                        <div class="doctordetails__4col_dob_input">
                                            <input type="date" name="DOB">
                                            <div class="box">
                                                <input type="text" placeholder="Age" name="age">
                                                <!-- <input type="text" placeholder="Months" name="months"> -->
                                            </div>
                                        </div>
                                    </div>

                                    <!-- <div class="doctordetails__4col_language">
                                        <div class="doctordatils__4col_language_header">
                                            <p>Language</p>
                                        </div>
                                        <div class="doctordatils__4col_language_input">
                                            <select name="language" id="">
                                                <option value="english">English</option>
                                                <option value="hindi">Hindi</option>
                                                <option value="marathi">Marathi</option>
                                                <option value="telugu">Telugu</option>
                                                <option value="tamil">Tamil</option>
                                                <option value="punjabi">Punjabi</option>
                                                <option value="sindhi">Sindhi</option>
                                                <option value="malayalam">Malayalam</option>
                                            </select>
                                        </div>
                                    </div> -->

                                    <!-- <div class="doctordetails__4col_doctortype">
                                        <div class="doctordatils__4col_doctortype_header">
                                            <p>Doctor Type</p>
                                        </div>
                                        <div class="doctordatils__4col_doctortype_input">
                                            <select name="doctortype" id="">
                                                <option value="new">New</option>
                                                <option value="followup">Follow Up</option>
                                                <option value="operation">Operation</option>
                                            </select>
                                        </div>
                                    </div> -->

                                </div>

                                <div class="doctordetails__2col">

                                    <div class="doctordetails__2col_address">
                                        <div class="doctordetails__2col_address__header">
                                            <p>Address</p>
                                        </div>

                                        <div class="doctordetails__2col_address__line1">
                                            <input type="text" name="address" placeholder="Address">
                                            <!-- <input type="text" name="address2" placeholder="Address 2"> -->
                                        </div>
                                        <!-- <div class="doctordetails__2col_address__line2">
                                            <select name="state" id="">
                                                <option value="none">-- Select State --</option>
                                                <option value="maharashtra">Maharashtra</option>
                                                <option value="delhi">Delhi</option>
                                                <option value="uttarpradesh">Uttar Pradesh</option>
                                                <option value="kerela">Kerela</option>
                                                <option value="karnataka">Karnataka</option>
                                                <option value="punjab">Punjab</option>
                                                <option value="westbengal">West Bengal</option>
                                            </select>
                                            <input type="text" name="city" placeholder="City">
                                            <input type="text" name="pincode" placeholder="Pincode">
                                        </div> -->
                                    </div>

                                </div>

                            </div>

                        </div>
                        <!--Doctor Details End-->

                        <!--Other Details Start-->
                        <div class="modal__container__left__body">

                            <div class="otherdetails">
                                <div class="otherdetails__groupone">
                                    <div class="otherdetails__groupone__imageupload">
                                        <div class="otherdetails__groupone__imageupload__header">
                                            <p>Doctor Image</p>
                                        </div>
                                        <div class="otherdetails__groupone__imageupload__input">
                                            <input type="file" class="file-upload-input" onchange="readURL(this)" accept="Image/*" name="img">
                                        </div>
                                    </div>

                                    <div class="appt-datetime">
                                        <p>Appointment Date & Time</p>
                                        <div class="appt-datetime__input">
                                            <input type="date" class="date" name="joined_at">
                                        </div>
                                    </div>
                                </div>

                                <div class="doctordetails__2col__occupation">
                                    <div class="doctordetails__2col__occupation__header">
                                        <p>Occupation</p>
                                    </div>
                                    <div class="doctordetails__2col__occupation__input">
                                        <select name="qualification" id="">
                                            <option value="MBBS">MBBS</option>
                                            <option value="test">test</option>
                                            <option value="other">Other</option>
                                        </select>
                                        <input type="text" name="speciality" id="" placeholder="Speciality (If Any)">
                                    </div>
                                </div>

                                <div class="doctordetails__1col">

                                    <div class="doctordetails__1col_medicalrecord">
                                        <div class="doctordetails__1col_medicalrecord__header">
                                            <p>Role</p>
                                        </div>
                                        <div class="doctordetails__2col__occupation__input">
                                            <select name="role_id" id="">
                                                <?php if(!empty($role)): ?>
                                                    <?php foreach($role as $row): ?>
                                                        <option value="<?= $row->id ?>"><?= $row->role ?></option>
                                                    <?php endforeach ?>
                                                    <?php else: ?>
                                                        <option value="">No Role</option>
                                                <?php endif ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="doctordetails__1col_govtid">
                                        <div class="doctordetails__1col_govtid__header">
                                            <p>Government Issued ID</p>
                                        </div>

                                        <div class="doctordetails__1col_govtid_input">
                                            <select name="ID_proof" id="">
                                                <option value="aadharcard">Aadhar Card</option>
                                                <option value="voterid">Voter ID</option>
                                                <option value="driverslicense">Driver's License</option>
                                                <option value="passport">Passport</option>
                                            </select>
                                            <input type="file" class="file-upload-input" onchange="readURL(this)" accept="Image/*" name="ID_img">
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                        <!--Other Details End-->

                    </div>

                </div>

                <div class="modal__createappointmentbtn">
                    <button type="submit">Register</button>
                </div>

            </form>
            <!--Modal Body End-->
        </div>
        <!--Modal End-->
    </section>
    <!--Doctor Registration End-->
</body>

</html>