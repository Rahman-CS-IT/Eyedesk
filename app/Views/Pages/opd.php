<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/slots.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/main_nav.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/opd_right.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/opd_navbar.css" type="text/css">
    <link rel="stylesheet" href="<?php echo base_url() ?>/public/assets/css/report.css" type="text/css">
    <style>
        .modal-backdrop {
            z-index: -1;
        }
        /* .col-md-4{

            width: 100%;
        } */
        .row{
            width: -webkit-fill-available;
        }
        table{
            text-align:center;
        }
    </style>
    
</head>


<body>
    <!-- ********************************* opd nav bar **************************** -->

    <section class="second-nav">
        <div class="left">
            <div class="Calendar">
                <!-- <a href="<?= base_url('reserved-slots') ?>"><img src="<?php echo base_url() ?>/public/assets/image/summary.png" alt="opd" width="25px" />
                    </a> -->
                <!-- <img src="<?php echo base_url() ?>/public/assets/image/summary.png" alt="" width="25px"> -->
            </div>

            <div class="search_p">
                <input type="text" placeholder="Search Patient" id="opd-search" name="opd-search">
                <input type="image" name="" id="" src="<?php echo base_url() ?>/public/assets/image/arrow.png">
            </div>
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

        <!-- <div class="center"></div> -->

        <div class="right_nav">
            <p>Appointment Details</p>
        </div>
        <div class="report">
            <div class="report_btn">
                <p class="report__button" onclick="addReportToggle();">Reports
                <p>
                    <!-- <img src="<?php echo base_url() ?>/public/assets/image/main_report.png" alt="searchicon"> -->

            </div>
        </div>
        <div class="report">
            <div class="report_btn">
                <p class="report__button" onclick="slotsToggle();">Add
                <p>
                    <!-- <img src="<?php echo base_url() ?>/public/assets/image/main_report.png" alt="searchicon"> -->

            </div>
        </div>
    </section>
    <!--Patient Registration Start-->
    <section class="patient-reports">
        <!--Modal Start-->
        <div class="modal">
            <div class="modal__header">
                <p class="modal__header__heading">EMR List</p>
                <div class="modal-closebtn" onclick="addReportToggle();">
                    <img src="<?php echo base_url() ?>/public/assets/image/close.png" alt="" width="28px">
                </div>
            </div>
            <!--Modal Body Start-->
           
            <div class="modal__container">
                <div class="modal__container_table" id="ajaxContent">
                    <table>
                        <thead>
                            <tr>
                                <th>Patient ID</th>
                                <th>Name</th>
                                <th>Date & Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="table-body">
                           <?php
                        if (!empty($fetch_data)) {
                            $i = 1;
                            foreach($fetch_data as $row){
                                $row->fname = str_replace("EMR/","", $row->emr_path);
                            ?>
                            <tr>
                                <td>
                                <?= $row->pat_id ?>
                                </td>
                                <td>
                                    <?= $row->firstname ?>
                                </td>
                                <td><?= $row->created_at?></td>

                                <td>
                                    <a href="<?= base_url($row->emr_path)?>" download title="Download Report" target="_blank">
                                    <img
                                        src="<?php echo base_url() ?>/public/assets/image/download.png"
                                        class="downlaod-emr-img" alt="download">
                                    </a>
                                    <a  href="<?= $row->emr_path ?>" 
                                        target="_blank"
                                        title="View File"><img
                                        src="<?php echo base_url() ?>/public/assets/image/view.png"
                                        class="view-emr-img" alt="View">
                                    </a>
                                    <a  href="<?php echo base_url();?>/email/<?php echo $row->pat_id;?>"><img
                                        src="<?php echo base_url() ?>/public/assets/image/email.webp"
                                        class="email-emr-img" alt="email" title="Mail"></a>
                                </td>
                            </tr>
                            <?php
                            }
                        }
                        else {
                            ?>
                            <tr>
                                <!-- <td></td> -->
                                <td colspan="4">No Reports</td>
                            </tr>

                            <?php
                        }

                        ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="search-emr">
                <input type="text" id="search-query" name="search-query" placeholder="Serach By Name, ID, Date">
                <button type="submit" id="searchBtn">Search</button>
            </div>
            <!--Modal Body End-->
        </div>
        <!--Modal End-->
    </section>
    <!--Patient Registration End-->
    <section class="slots-container">
        <div class="slots_modal">
            <div class="slots_modal_header">
                <p class="slots_modal_header_heading">Appointment Details</p>
                <div class="slots_modal-closebtn" onclick="slotsToggle();">
                    <img src="<?php echo base_url() ?>/public/assets/image/close.png" alt="" width="28px">
                </div>
            </div>
            <div class="slots_modal_container">
                <div class="container-fluid">
                    <!-- end row -->
            
                    <div class="row justify-content-center ">
                        <div class="card-body">
            
                            <div class="container-fluid">
                                <div id="calendar"></div>
                            </div>
            
                            <div class="modal" tabindex="-1" id="cal_modal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header row">
                                            <div class="col-md-4">
                                            </div>
                                            <div class="col-md-6">
                                                <h5 class="modal-title">Appointment Details</h5>
                                            </div>
                                            <div class="col-md-1">
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                        </div>
                                        <div class="modal-body">
            
                                            <form id="suspend_form">
                                                <div class="row">
                                                    <!-- <label class="mt-2">Appointment Details</label> -->
                                                    <h5 class="modal-title"><span id="dis_error" class="text-danger"></span>
                                                    </h5>
                                                    <div class="row">
            
                                                        <label class="mt-2">Type<span class="text-warning">*</span></label>
            
                                                        <div class="mt-2 col-md-6">
                                                            <input type="radio" name="appointmenttype" id="appointmenttype" value="Walk-in">
                                                            <label>Walk-in</label>
                                                        </div>
            
                                                        <div class="mt-2 col-md-6">
                                                            <input type="radio" name="appointmenttype" id="appointmenttype" value="Appointment">
                                                            <label>Appointment</label>
                                                        </div>
            
                                                    </div>
                                                   
            
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Appointment Date<span class="text-warning">*</span></label>
                                                            <div class="appt-datetime__input">
                                                                <input type="date" class="form-control" name="start" id="datefrom">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Apointment Time<span class="text-warning">*</span></label>
                                                            <input type="time" class="form-control" id="timefrom" name="timestart">
                                                        </div>
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-6">
                                                                <label class="mt-2">Patient Id<span class="text-warning">*</span></label>
                
                                                                <select class="form-control" id="patient_id" name="patient_id">
                                                                    <?php
                                                                    if (!empty($fetch_data)) {
                                                                        foreach ($fetch_data as $row) {
                                                                            echo '<option value="' . $row->pat_id . '">' . $row->pat_id . '</option>';
                                                                        }
                                                                    } else {
                                                                        echo '<option value="' . '' . '">' . "No Doctor Available" . '</option>';;
                                                                    }
                                                                    ?>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-6">
                                                            <label class="mt-2">Consultant<span class="text-warning">*</span></label>
            
                                                            <select class="form-control" id="consultant" name="consultant">
                                                                <?php
                                                                if (!empty($result)) {
                                                                    foreach ($result as $row) {
                                                                        echo '<option value="' . $row->name . '">' . $row->name . '</option>';
                                                                    }
                                                                } else {
                                                                    echo '<option value="' . '' . '">' . "No Doctor Available" . '</option>';;
                                                                }
                                                                ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Location<span class="text-warning">*</span></label>
            
                                                            <select class="form-control" id="location" name="location">
                                                                <option value="">Select Location</option>
            
                                                                <option value="aeh">AEH</option>
                                                                <option value="aec">AEC</option>
                                                                <option value="saf">SAF</option>
            
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                                        <label class="mt-2">Categories<span class="text-warning">*</span></label>
                
                                                                        <select class="form-control" id="appointmentcategory" name="appointmentcategory">
                                                                            <option value="none">--Select Appointment Type--</option>
                                                                            <option value="comprehensive">Comprehensive</option>
                                                                            <option value="routine">Routine</option>
                                                                            <option value="lens">Contact Lens</option>
                                                                        </select>
                                                         </div>

                                                        </div>
                                                                <div class="row">
                                                                    
                                                            <div class="appt-types">
                                                                <div class="appt-types__input">
                                                                    <div class="col-md-6">
                                                                        <label class="mt-2">Appointment Type<span class="text-warning">*</span></label>
                
                                                                        <select class="form-control" id="appointmentreason" name="appointmentreason">
                                                                            <!-- <option value="review">Review</option>
                                                                                <option value="walkin">Walk-In</option> -->
                                                                            <option value="consultation">Consultation</option>
                                                                            <option value="checkup">Checkup</option>
                                                                            <option value="surgery">Surgery</option>
                
                                                                        </select>
                                                                    </div>
                                                            </div>
                
                                                        </div>
                                                        <!-- <p class="reservation">Reserved Slot for <span class="reservation_time"></span></p>
                                                        <div id="calendar2" class="reservation-container"> -->
            
                                                        </div>
                                                    </div>
                                                </div>
            
                                            </form>
            
                                            <div class="modal-footer">
                                                <button type="button" id="save_events" class="btn btn-primary">Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
            
                            <div class="modal" tabindex="-1" id="update_cal_modal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header row">
                                            <div class="col-md-4"> <button type="button" class="btn btn-primary" id="del">Delete</button>
                                            </div>
                                            <div class="col-md-6">
                                                <h5 class="modal-title">Appointment Details
                                                </h5>
                                            </div>
                                            <div class="col-md-1">
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                        </div>
            
                                        <div class="modal-body">
            
                                            <form id="up_suspend_form">
                                                <div class="row">
                                                    <!-- <label class="mt-2">Appointment Details</label> -->
                                                    <h5 class="modal-title"><span id="up_dis_error" class="text-danger"></span>
                                                    </h5>
                                                    <div class="row" id="up_appointmenttype">
                                                        <!-- id="up_appointmenttype -->
            
                                                        <label class="mt-2">Type<span class="text-warning">*</span></label>
            
                                                        <div class="mt-2 col-md-6">
                                                            <input type="radio" name="up_appointmenttype" value="Walk-in">
                                                            <label>Walk-in</label>
                                                        </div>
            
                                                        <div class="mt-2 col-md-6">
                                                            <input type="radio" name="up_appointmenttype" value="Appointment">
                                                            <label>Appointment</label>
                                                        </div>
            
                                                    </div>
            
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Appointment Date<span class="text-warning">*</span></label>
                                                            <div class="appt-datetime__input">
                                                                <input type="date" class="form-control" name="up_start" id="up_datefrom">
                                                                <input type="hidden" class="form-control" id="up_id" name="up_id">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Apointment Time<span class="text-warning">*</span></label>
                                                            <input type="time" class="form-control" id="up_timestart" name="up_timestart">
                                                        </div>
                                                    </div>
            
            
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Location<span class="text-warning">*</span></label>
            
                                                            <select class="form-control" id="up_location" name="up_location">
                                                                <option value="">Select Location</option>
                                                                <option value="aeh">AEH</option>
                                                                <option value="aec">AEC</option>
                                                                <option value="saf">SAF</option>
            
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6">
                                                                <label class="mt-2">Patient Id<span class="text-warning">*</span></label>
                
                                                                <select class="form-control" id="patient_id" name="patient_id">
                                                                    <?php
                                                                    if (!empty($fetch_data)) {
                                                                        foreach ($fetch_data as $row) {
                                                                            echo '<option value="' . $row->pat_id . '">' . $row->pat_id . '</option>';
                                                                        }
                                                                    } else {
                                                                        echo '<option value="' . '' . '">' . "No Doctor Available" . '</option>';;
                                                                    }
                                                                    ?>
                                                                </select>
                                                            </div>
                                                        <div class="col-md-6">
                                                            <label class="mt-2">Consultant<span class="text-warning">*</span></label>
            
                                                            <select class="form-control" id="up_consultant" name="up_consultant">
                                                                <?php
                                                                if (!empty($result)) {
                                                                    foreach ($result as $row) {
                                                                        echo '<option value="' . $row->name . '">' . $row->name . '</option>';
                                                                    }
                                                                } else {
                                                                    echo '<option value="' . '' . '">' . "No Doctor Available" . '</option>';;
                                                                }
                                                                ?>
                                                            </select>
                                                        </div>
            
                                                        <div class="appt-types">
                                                            <div class="appt-types__input">
                                                                <div class="col-md-6">
                                                                    <label class="mt-2">Appointment Type<span class="text-warning">*</span></label>
            
                                                                    <select class="form-control" id="up_appointmentreason" name="up_appointmentreason">
                                                                        <!-- <option value="review">Review</option>
                                                                            <option value="walkin">Walk-In</option> -->
                                                                        <option value="consultation">Consultation</option>
                                                                        <option value="checkup">Checkup</option>
                                                                        <option value="surgery">Surgery</option>
            
                                                                    </select>
                                                                </div>
            
                                                                <div class="col-md-6">
                                                                    <label class="mt-2">Categories<span class="text-warning">*</span></label>
            
                                                                    <select class="form-control" id="up_appointmentcategory" name="up_appointmentcategory">
                                                                        <option value="none">--Select Appointment Type--</option>
                                                                        <option value="comprehensive">Comprehensive</option>
                                                                        <option value="routine">Routine</option>
                                                                        <option value="lens">Contact Lens</option>
                                                                    </select>
                                                                </div>
            
                                                            </div>
            
                                                        </div>
            
                                                        <p class="reservation">Reserved Slot for <span class="reservation_time"></span></p>
                                                        <!-- <div class="reservation-container">
            
                                                        </div> -->
                                                    </div>
                                                </div>
            
                                            </form>
            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="up_save_events" class="btn btn-primary">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            
            
                            <div class="modal" tabindex="-1" id="day_modal">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <!-- <h5 class="modal-title"><span id="dis_error_day" class="text-danger"></span></h5> -->
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
            
                                            <form id="day_form">
                                                <div class="row">
                                                    <!-- <span>Note : <span class="text-warning">*</span> Denoted Field Are Required </span><br> -->
                                                    <div class="col-md-12">
                                                        <label>Event</label>
                                                        <select class="form-control" id="center_name_day">
                                                            <option value="">Select event</option>
                                                            <option value="Google">Google</option>
                                                            <option value="Youtube">Youtube</option>
                                                        </select>
                                                    </div>
            
                                                    <div class="col-md-12">
                                                        <label class="mt-3"> <span>Drag Your Event To Change Date & Time</span></label>
            
                                                    </div>
                                                    <input type="hidden" id="daystart" name="">
                                                    <input type="hidden" id="dayend" name="">
            
            
                                                </div>
            
            
                                            </form>
            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" id="save_events_day" class="btn btn-primary">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
            
                        </div>
                        <!--Card-body -->
                    </div>
                    <!-- end main content-->
            
                </div><!-- container-fluid -->

            </div><!-- container-fluid -->
        </div>
        </div>
    </section>


    <div class="main">


        <!-- ********************************************** Left window ******************************** -->
        <!-- <div class="opd_ele"> -->
        <div class="left">
            <nav>
                <ul>
                    <li onclick="all()"><a href="">
                            <?php echo count($fetch_data) + 7; ?><span>ALL</span>
                        </a></li>
                    <li onclick="my_queue()"><a href="">
                            <?php echo count($fetch_data) + 1; ?><span>MY QUEUE</span>
                        </a></li>
                    <li onclick="not_arrived()"><a href="">1<span>NOT ARRIVED</span></a></li>
                    <li onclick="my_appointment()"><a href="">2<span>MY APPOINTMENTS</span></a></li>
                    <li onclick="referrals()"><a href="">2<span>REFERRALS</span></a></li>
                    <li onclick="provisional()"><a href="">1<span>PROVISIONAL</span></a></li>
                </ul>
            </nav>
            <div class="container_item" id="body">
                <div class="container_item1 item">
                    <?php
                        if (!empty($fetch_data)) {
                            $todays_date = date('Y-m-d');
                            foreach ($fetch_data as $row) {
                                $start = $row->appointment_start_time;
                                $start_time = date('h:i a', strtotime($start));
                        ?>
                    <div class="row" id="dataById" onclick="rightProfileToggle()" data-id="<?= $row->id ?>">
                        <div class="col">
                            <h4 name='p_name_left'>
                                <?php echo $row->firstname; ?>
                                <?php echo $row->lastname;?>
                            </h4>
                        </div>
                        <div class="col_colright">
                            <span class="info"><button>REVIEW</button><button>FOLLOW UP</button> <time>
                                    <?php echo $start_time; ?>
                                </time>
                            </span>
                        </div>
                    </div>
                    <?php
                            }
                        }
                        // }
                        else {
                            ?>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>No Appointments Today</td>
                        <td></td>
                        <td></td>
                    </tr>

                    <?php
                        }

                        ?>


                    <!-- <h4><span class="alert">2</span> Ms. Paige Turner</h4> -->
                </div>
                <div class="container_item2 item">
                    <div class="row">
                        <div class="col">
                            <h4> Mr. Willie Makeit</h4>
                        </div>
                        <div class="col_colright3">
                            <span class="info"><button>FREE</button><time>5:00 PM</time> </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h4> Ms. Dee Zyna</h4>
                        </div>
                        <div class="col_colright4">
                            <span class="info"><button>Review</button><time>5:30 PM</time> </span>
                        </div>
                    </div>
                </div>
                <div class="container_item3 item">

                    <div class="row">
                        <div class="col">
                            <h4> Mr. Bea Mine</h4>
                        </div>
                        <div class="col_colright5">
                            <span class="info"><button>New</button><time>3:45 PM</time> </span>
                        </div>
                    </div>
                </div>
                <div class="container_item4 item">
                    <div class="row">
                        <div class="col">
                            <h4> Mr. John Doe</h4>
                        </div>
                        <div class="col_colright6">
                            <span class="info"><button>Review</button><time>1:00 PM</time> </span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h4> Mr. John Doe</h4>
                        </div>
                        <div class="col_colright7">
                            <span class="info"><button>Review</button><time>2:15 PM</time> </span>
                        </div>
                    </div>
                </div>
                <div class="container_item5 item">

                    <div class="row">
                        <div class="col">
                            <h4> Ms. Epzy Ivy</h4>
                        </div>
                        <div class="col_colright8">
                            <span class="info"><button>REFRACTION</button><time>3:30 PM</time> </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- *************************************** right window ******************************************* -->

        <div class="right">

            <!-- *********************** section 1 ************************************ -->

            <div class="section1">
                <div class="label1">
                        <div class="p_name"></div>
                        <div class="p_age">( male | 24 Years )</div>
                        <button type="button" class="edit_btn"></button>
                        <img class="profile_img" src="">
                        <button type="button" class="summary_btn">Summary</button>
                        <a id="emr_btn" href="#" target="_blank"><button type="button" class="print_btn"></button></a>
                </div>
                <table>
                    <tr>
                        <td>Patient ID</td>
                        <td>:</td>
                        <td class="pat_id">AEH-XYZ-123456</td>
                    </tr>
                    <tr>
                        <td>Registration Date</td>
                        <td>:</td>
                        <td>13/05/2022</td>
                    </tr>
                    <tr>
                        <td>Primary Contact</td>
                        <td>:</td>
                        <td class="mob">1234567890</td>
                    </tr>
                    <tr>
                        <td>Patient Referral</td>
                        <td>:</td>
                        <td>None</td>
                    </tr>
                    <tr>
                        <td>Last Visit</td>
                        <td>:</td>
                        <td>
                            <div class="box">
                                <select name="#" id="">
                                    <option value="default" selected>14 Aug ( Doc. Nathalie Tie )</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- ************************** section 2 ************************************** -->

            <div class="section2">
                <div class="labels">
                    <span class="first">Opthalmic & Systemic</span>
                    <span class="second">:</span>
                    <span class="third">Hypertension, Thyroid Disorder</span>
                </div>
            </div>

            <!-- **************************** section 3 ************************************** -->

            <div class="section3">
                <div class="btn">
                    <button type="submit" class="arrived_btn">Arrived</button>
                    <div class="arrow"><img src="<?php echo base_url() ?>/public/assets/image/image 26.png" alt="">
                    </div>
                    <button type="submit" class="dummy_btn">Admin</button>
                </div>
            </div>

            <!-- ******************************* section 4 ********************************** -->

            <div class="section4">
                <div class="ele1">
                    <h3>Case Details</h3>
                    <button type="submit" class="name_btn" id="id_btn">( Click to Add Name ) - AEH-XYZ-123456</button>
                </div>
                <div class="ele2">
                    <span class="all_cases">All Cases</span>
                    <span class="change_cases">Change Case</span>
                </div>
                <div class="ele3">
                    <h2>Template Details</h2>
                </div>
                <div class="ele4">
                    <div class="select">
                        <div class="new_box">
                            <select name="#" id="">
                                <option value="defualt" selected>New</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="report_btn"> <img
                            src="<?php echo base_url() ?>/public/assets/image/reporticon.png" alt=""><a
                            href="#">Consolidate
                            Reports</a></button>
                </div>
                <div class="ele5">
                    <span class="old_templet">Old Templates</span>
                </div>
                <div class="ele6">
                    <div class="eye_1">
                        <select name="" id="">
                            <option value="defualt">Eye (12 Aug 22)</option>
                        </select>
                    </div>
                    <div class="eye2">
                        <div class="eye_2">
                            <select name="" id="">
                                <option value="defualt">Eye (12 Jul 22)</option>
                            </select>
                        </div>
                    </div>
                    <div class="eye3">
                        <div class="eye_3">
                            <select name="" id="">
                                <option value="defualt">Eye (12 Jul 22)</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ******************************** section 5 ***************************************** -->

            <div class="section5">
                <nav>
                    <ul>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 27.png"
                                alt=""><span>Overview</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 28.png"
                                alt=""><span>Bills</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 29.png"
                                alt=""><span>Diagnosis</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 30.png"
                                alt=""><span>Investigations</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 31.png"
                                alt=""><span>Procedures</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 32.png"
                                alt=""><span>Prescriptions</span></li>
                        <li><img src="<?php echo base_url() ?>/public/assets/image/image 33.png"
                                alt=""><span>Glasses</span></li>
                    </ul>
                </nav>
                <div class="ele2">
                    <button type="submit" class="surgery_btn">Surgery Advised</button>
                    <button type="submit" class="schedule_btn">Schedule Admission</button>
                </div>
                <div class="ele3">
                    <table>
                        <tr>
                            <td>Consultant</td>
                            <td>:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Scheduled By</td>
                            <td>:</td>
                            <td>Reeve Ewer</td>
                        </tr>
                        <tr>
                            <td>Schedule Time</td>
                            <td>:</td>
                            <td>28 Aug at 4 : 00 PM </td>
                        </tr>
                        <tr>
                            <td>Patient Type</td>
                            <td>:</td>
                            <td class="apt_type">Follow Up</td>
                        </tr>
                    </table>
                </div>
                <div class="ele4">
                    <table>
                        <tr>
                            <td>Appt/OPD ID</td>
                            <td>:</td>
                            <td class="pat_id">AEH-XYZ-123456</td>
                        </tr>
                        <tr>
                            <td>Booking Time</td>
                            <td>:</td>
                            <td>28 Aug at 4 : 00 PM </td>
                        </tr>
                    </table>
                </div>

                <div class="ele5">
                    <span>Dilatation</span>
                    <span>:</span>
                    <span><button type="submit">Dilate</button></span>
                    <span>00:00:00</span>
                </div>
                <div class="ele6">
                    <span>Appointment Actions</span>
                    <span>:</span>
                    <span><button type="submit">Reschedule</button></span>
                    <span><button type="reset">Cancel</button></span>
                </div>
                <div class="ele7">
                    <span><button type="file">Upload Papers <img src="" alt=""></button></span>
                </div>
            </div>

            <!-- *********************** section 6 ******************************* -->

            <div class="section6">
                <div class="ele1">
                    <h4>All Bills</h4>
                    <span class="bill_amount">Bill Amount : ₹2500.00</span>
                    <button type="submit" class="bill_btn">Bills</button>
                </div>
                <div class="ele2">
                    <table>
                        <tr>
                            <td>Recieved</td>
                            <td>Pending</td>
                            <td>Net Total</td>
                        </tr>
                        <tr>
                            <td>₹2500.00</td>
                            <td>₹500.00</td>
                            <td>₹2500.00</td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- ************************** section 7 *************************** -->

            <div class="section7">
                <div class="ele1">
                    <h3>Recent Investigations</h3>
                    <span class="view_1">View More ></span>
                </div>
                <div class="ele2">
                    <table>
                        <tr>
                            <th colspan="2">Opthal ( 0 )</th>
                            <th colspan="2">Laboratory ( 1 )</th>
                            <th colspan="2">Radiology ( 1 )</th>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td>28 Aug'22</td>
                            <td>Neil Down</td>
                            <td colspan="2">Vit.B.12 (before starting medicine)</td>
                            <td colspan="2">Advised</td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- *************************** section 8 ********************************** -->

            <div class="section8">
                <div class="ele1">
                    <span>Recent Medical Prescription</span>
                    <span class="view_2">View More ></span>
                </div>
                <div class="ele2">
                    <span>Recent Optical Prescription</span>
                    <span class="view_2">View More ></span>
                </div>
                <div class="ele3">
                    <table>
                        <tr>
                            <th>Advised On</th>
                            <th>Advised By</th>
                        </tr>
                        <tr>
                            <td>28 Aug'22</td>
                            <td>Neil Down</td>
                        </tr>
                    </table>
                </div>
                <div class="ele4">
                    <table>
                        <tr>
                            <th>Advised On</th>
                            <th>Advised By</th>
                            <th>Type</th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="pr">No Prescription
                                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quod ipsa quae fugit
                                    autem. Animi sit officia, laudantium atque asperiores enim assumenda esse ipsa ipsum
                                    temporibus a labore unde architecto vel facilis. Quae voluptates non deserunt
                                    exercitationem aliquid aliquam, magnam error deleniti quam nam modi voluptatem,
                                    iusto nulla, tempore repellat pariatur.
                                </div>
                            </td>
                            <td>Neil Down</td>
                        </tr>
                    </table>
                </div>
            </div>
            

            <!-- </div> -->
        </div>
        <script defer src="<?php echo base_url() ?>/public/assets/js/dash.js" type="text/javascript"></script>

        <!-- <script src="date.js"></script> -->
        <script defer src="<?php echo base_url() ?>/public/assets/js/report.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
        <script>
            $(document).ready(function() {

                $('#opd-search').on('input', function(){
                    var query = $('#opd-search').val();
                    $.ajax({
                        url: '<?php echo base_url('opd-search')?>',
                        type: 'POST',
                        data: {'opd-search':query},
                        success: function(data){
                            var body = $('#body');
                            body.empty();
                            var resultHtml = '';
                            $.each(data, function(index, result){
                                var formattedDateTime = '';
                                if (result.appointment_start_time != null) {
                                    // Input date and time in "YYYY-MM-DD HH:mm:ss" format
                                    var inputDateTime = result.appointment_start_time;

                                    // Split the input date and time into date and time components
                                    var parts = inputDateTime.split(" ");
                                    var datePart = parts[0];
                                    var timePart = parts[1];

                                    // Split the time component into hours, minutes, and seconds
                                    var timeParts = timePart.split(":");
                                    var hours = parseInt(timeParts[0]);
                                    var minutes = parseInt(timeParts[1]);
                                    var seconds = parseInt(timeParts[2]);

                                    // Convert hours to 12-hour format
                                    var meridiem = (hours >= 12) ? "PM" : "AM";
                                    hours = (hours % 12 === 0) ? 12 : (hours % 12);

                                    // Format the date and time into "h:mm A" format
                                    formattedDateTime = hours + ":" + (minutes < 10 ? "0" + minutes : minutes) + " " + meridiem;
                                }

                                var html = '<div class="container_item1 item"><div class="row" id="dataById" onclick="rightProfileToggle()" data-id="'+ result.id + '"><div class="col"><h4 name="p_name_left">'+ result.firstname + ' ' + result.lastname + '</h4></div><div class="col_colright"><span class="info"><button>REVIEW</button><button>FOLLOW UP</button><time>'+ formattedDateTime + '</time></span></div></div>';

                            $('#body').append(html);
                            })
                        }
                    });
                })


                $('#search-query').on('input',function(){
                    var searchQuery = $('#search-query').val();
                    $.ajax({
                        url: '<?php echo base_url("search") ?>',
                        type: 'POST',
                        data: { 'search-query': searchQuery },
                        success: function(data) {
                            var tbody = $('#table-body');
                            tbody.empty();
                            var resultsHtml = '';
                            $.each(data, function(index, result) {
                                var html = '<tr>' +
                                '<td>' + result.pat_id + '</td>' +
                                '<td>' + result.firstname + '</td>' +
                                '<td>' + result.created_at + '</td>' +
                                '<td>' +
                                '<a href="' + result.emr_path + '" download title="Download Report" target="_blank">' +
                                '<img src="<?= base_url() ?>/public/assets/image/download.png" class="downlaod-emr-img" alt="download">' +
                                '</a>' +
                                '<a href="' + result.emr_path + '" target="_blank" title="View File">' +
                                '<img src="<?= base_url() ?>/public/assets/image/view.png" class="view-emr-img" alt="View">' +
                                '</a>' +
                                '<a href="<?= base_url()?>/email/' + result.pat_id + '">' +
                                '<img src="<?= base_url() ?>/public/assets/image/email.webp" class="email-emr-img" alt="email" title="Mail">' +
                                '</a>' +
                                '</td>' +
                                '</tr>';

                            $('#table-body').append(html);             
                            })}
                    });

                })
                function ucfirst(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}
                function populateFields(data) {
                    // populate the fields with the data
                    $('.p_name').text(ucfirst(data.firstname)+ ' ' + data.lastname);
                    $('.p_age').text('( '+data.gender +' | ' + data.year + ' Year )');
                    $('.profile_img').attr('src', '<?php echo base_url() ?>/' + data.img_path );
                    $('.pat_id').text(data.pat_id);
                    $('#id_btn').text('( Click to Add Name ) - '+data.pat_id)
                    $('.mob').text(data.mobilenumber);
                    $('.apt_type').text(data.patienttype);
                    $('#emr_btn').attr('href',data.emr_path);
                    // console.log(data.created_at );
                }
                $('#body').on('click', '.row', function() {
    var userId = $(this).data('id');
    console.log(userId);
    $.ajax({
        url: '<?php echo base_url("getData") ?>',
        type: 'get',
        data: { id: userId },
        success: function(data) {
            populateFields(data);
        },
        error: function(xhr, textStatus, errorThrown) {
            console.log('Error:', errorThrown);
        }
    });
});
                $('.row').click(function(){
                    var userId = $(this).data('id');
                console.log(userId);
                $.ajax({
                    url: '<?php echo base_url("getData") ?>',
                    type: 'get',
                    data: { id: userId },
                    success: function(data) {
                        
                        populateFields(data);
                        
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log('Error:', errorThrown);
                    }
                })});
                
                var calendarEl = document.getElementById('calendar');
    
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    editable: true,
                    firstDay: 1,
                    timeZone: 'UTC',
                    themeSystem: 'bootstrap5',
                    initialView: "dayGridMonth",
                    eventTimeFormat: {
                        hour: 'numeric',
                        minute: '2-digit'
                    },
    
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                    },
    
                    expandRows: true,
                    height: 600,
                    dayMaxEvents: true, // allow "more" link when too many events
                    events: "slots-load",
    
                    selectable: true,
                    // selectHelper: true,
    
                    select: function(info) {
                        var view = calendar.view;
    
                        if (view.type == "dayGridMonth") {
    
                            $("#cal_modal").modal("show");
    
                            var setstart = info.startStr;
                            var setfrom = moment(info).format('HH:mm');
    
                            $("#datefrom").val(setstart);
                            $("#timefrom").val(setfrom);
    
                        } else if (view.type == "timeGridDay") {
                            $("#day_modal").modal("show");
    
                            var start = info.startStr;
                            var end = info.endStr;
    
                            $("#daystart").val(start);
                            $("#dayend").val(end);
                        }
                    },
    
                    eventClick: function(info) {
    
                        var id = info.event.id;
    
                        $.ajax({
                            url: "get-cell-data",
                            data: {
                                id: id,
                            },
                            type: "POST",
                            dataType: "json",
                            success: function(data) {
    
                                $("#up_datefrom").val(data[0].start_date);
                                $("#up_timestart").val(data[0].start_time);
    
                                if (data[0].appointmenttype == 'Walk-in') {
                                    $('#up_appointmenttype').find(':radio[name=up_appointmenttype][value=Walk-in]').prop('checked', true)
                                    $("#up_appointmenttype").val('Walk-in');
                                } else {
                                    $('#up_appointmenttype').find(':radio[name=up_appointmenttype][value=Appointment]').prop('checked', true)
                                    $("#up_appointmenttype").val('Appointment');
                                }
                                $("#up_pat_id").val(data[0].pat_id)
                                $("#up_location").val(data[0].location);
                                $("#up_consultant").val(data[0].consultant);
                                $("#up_appointmentreason").val(data[0].appointmentreason);
                                $("#up_appointmentcategory").val(data[0].appointmentcategory);
    
                                $("#up_id").val(data[0].id);
    
                                $("#update_cal_modal").modal("show");
                                $("#up_time_error").text(null);
                                $("#time_error").text(null);
                            },
                            error: function() {},
                        });
                    },
                });
    
                $("#save_events_day").click(function() {
                    $("#day_modal").modal("show");
    
                    if ($("#center_name_day").val() == "") {
                        $("#dis_error_day").text("Note : All Field Required");
                        return false;
                    } else {
                        $("#dis_error_day").text(null);
                        $("#day_modal").modal("hide");
    
                        var center = $("#center_name_day").val();
                        var start = $("#daystart").val();
                        var end = $("#dayend").val();
    
                        $.ajax({
                            url: "update-day",
                            type: "POST",
                            data: {
                                title: center,
                                start: start,
                                end: end,
                            },
                            success: function() {
                                $("#day_form")[0].reset();
                                calendar.refetchEvents();
                                Swal.fire({
                                    icon: "success",
                                    title: "Event Added Successfully",
                                    showConfirmButton: false,
                                    timer: 2500,
                                });
                            },
                        });
                    }
                });
    
                //save events by month and by week
    
                $("#save_events").click(function() {
                    if (
                        $("#datefrom").val() == "" ||
                        $("#timestart").val() == "" ||
                        $("#appointmenttype").val() == "" ||
                        $("#location").val() == "" ||
                        $("#consultant").val() == "" ||
                        $("#appointmentreason").val() == "" ||
                        $("#appointmentcategory").val() == ""
                    ) {
                        $("#dis_error").text("Note : All Field Required");
                        return false;
                    } else {
                        $("#dis_error").text(null);
                        $("#cal_modal").modal("hide");
    
                        $.ajax({
                            url: "insert-slot",
                            type: "POST",
                            data: $("#suspend_form").serialize(),
                            success: function() {
                                $("#suspend_form")[0].reset();
                                calendar.refetchEvents();
                                Swal.fire({
                                    icon: "success",
                                    title: "Event Added Successfully",
                                    showConfirmButton: false,
                                    timer: 2500,
                                }, function() {
                                    location.reload();
                                });
                            },
                        });
                    }
                });
    
                $("#up_save_events").click(function() {
                    if (
                        $("#up_datefrom").val() == "" ||
                        $("#up_timestart").val() == "" ||
                        $("#up_appointmenttype").val() == "" ||
                        $("#up_location").val() == "" ||
                        $("#up_consultant").val() == "" ||
                        $("#up_appointmentreason").val() == "" ||
                        $("#up_appointmentcategory").val() == ""
                    ) {
                        $('#up_dis_error').text('Note : All Field Required');
                        return false;
                    } else {
                        $('#up_dis_error').text(null);
                        $("#update_cal_modal").modal("hide");
                        $.ajax({
                            url: "up-insert-slot",
                            type: "POST",
                            data: $("#up_suspend_form").serialize(),
                            success: function() {
                                $("#up_suspend_form")[0].reset();
                                calendar.refetchEvents();
                                Swal.fire({
                                    icon: "success",
                                    title: "Event Updated Successfully",
                                    showConfirmButton: false,
                                    timer: 2500,
                                });
                            },
                        });
                    }
                });
    
                $("#del").click(function() {
                    Swal.fire({
                        title: "Are you sure?",
                        text: "You won't be able to revert this!",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Yes, remove it!",
                    }).then((result) => {
                        if (result.value) {
                            var id = $("#up_id").val();
                            $.ajax({
                                url: "delete-slot",
                                type: "POST",
                                data: {
                                    id: id,
                                },
                                success: function() {
                                    $("#update_cal_modal").modal("hide");
                                    calendar.refetchEvents();
                                    Swal.fire({
                                        icon: "success",
                                        title: "Event Removed",
                                        showConfirmButton: false,
                                        timer: 2500,
                                    });
                                },
    
                            });
                        }
                    });
                });

              
                calendar.render();

                
                
               
            });
        </script>
//          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
//         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
//     <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
//     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
//     <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script>
//     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
</body>

</html>